require 'rails_helper'

RSpec.describe RemindersController, type: :controller do

  let(:user) {
    User.create!(email: "user@gmail.com", password: "12345678", password_confirmation: "12345678")
  }

  let(:another_user) {
    User.create!(email: "another@gmail.com", password: "87654321", password_confirmation: "87654321")
  }

  let(:valid_attributes) {
    { title: "awesome title", description: "wonderful description",
      scheduled_at: DateTime.new(2001,2,3,4,5,6), user_id: user.id }
  }

  let(:invalid_attributes) {
    { title: "", description: "", user_id: nil }
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    context "when user is signed in" do
      before { sign_in(user, nil) }
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "when no user is signed in" do
      it "returns a redirect response and redirects to sign in path" do
        get :new, params: {}, session: valid_session
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST #create" do
    context "when user is signed in" do
      before { sign_in(user, nil) }
      context "with valid params" do
        it "creates a new Reminder" do
          expect {
            post :create, params: { reminder: valid_attributes }, session: valid_session
          }.to change(Reminder, :count).by(1)
        end

        it "redirects to the created reminder" do
          post :create, params: { reminder: valid_attributes }, session: valid_session
          expect(response).to redirect_to reminder_url(Reminder.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { reminder: invalid_attributes }, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    context "when no user is signed in" do
      it "returns a redirect response and redirects to sign in" do
        post :create, params: { reminder: invalid_attributes }, session: valid_session
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #index" do
    context "when user is signed in" do
      before do
        sign_in(user, nil)
      end
      it "returns a success response" do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "when no user is signed in" do
      it "returns a redirect response and redirects to sign in path" do
        get :index, params: {}, session: valid_session
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end

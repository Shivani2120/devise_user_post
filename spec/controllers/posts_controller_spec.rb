require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  describe "responds to" do

    before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = create(:user, password: 'password123', password_confirmation: 'password123')
        sign_in @user
    end

    it "it doesn't matter" do

        post :create, :params => { :post => { :title => "Anything", 
                                              :description => "Related To anything" } }
        expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end
end
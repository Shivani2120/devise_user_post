require 'rails_helper'

RSpec.describe Post, :type => :model do
    subject {
        described_class.new(title: "Anything",
                            description: "Anithing related to title",
                            user_id: "1234567890"
                            )
      }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a name" do 
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
        subject.description = nil
        expect(subject).to_not be_valid
    end

    describe "Associations" do
        it { should belong_to(:user).without_validating_presence }
        it { should have_many(:post_comments) }
        it { should have_many(:post_likes) }
    end


  end
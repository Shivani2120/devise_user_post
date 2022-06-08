require 'rails_helper'

RSpec.describe PostComment, :type => :model do
    subject {
        described_class.new(comment: "hello",
                            user_id: 1,
                            post_id: 1)
      }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

end


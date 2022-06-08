require 'rails_helper'

RSpec.describe PostLike, :type => :model do
    subject {
        described_class.new(user_id: 1,
                            post_id: 1)
      }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

end
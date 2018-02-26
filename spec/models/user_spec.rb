require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }


  describe "Validations" do

    it "is valid with valid attributes" do
      expect( build(:user) ).to be_valid
    end
    
    it { expect(user).to validate_presence_of(:first_name)  }
    it { expect(user).to validate_presence_of(:last_name)  }

    it { expect(user).to validate_length_of(:first_name).is_at_least(2).is_at_most(30) }
    it { expect(user).to validate_length_of(:last_name).is_at_least(2).is_at_most(30) }
  
  end
  
  it '#name returns first and last name' do
    expect(user.name).to eq('First Last')
  end
  
end

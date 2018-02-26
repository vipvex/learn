require 'rails_helper'

RSpec.describe Blog, type: :model do
  
  let(:blog) { build(:blog) }
  
  describe 'Validations' do 
     
    it 'is valid with valid params' do
      expect(blog).to be_valid
    end
     
    it { expect(blog).to validate_presence_of(:title)  }
    it { expect(blog).to validate_uniqueness_of(:title) }
    it { expect(blog).to validate_length_of(:title).is_at_least(2).is_at_most(150) }
    
    it { expect(blog).to validate_presence_of(:body) }
    
    it { expect(blog).to belong_to(:author) }
      
  end
  
  describe 'Associations' do
    it { is_expected.to belong_to(:author) }
  end
  
end

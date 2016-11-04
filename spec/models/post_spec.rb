require 'rails_helper'

RSpec.describe Post, type: :model do

  context "Information cannot contain any blank fields" do

    before :each do
      @gossip = create(:post)
    end

    it "author cannot be blank" do
      @gossip.author = " "
      expect(@gossip).to_not be_valid
    end

    it "title cannot be blank" do
      @gossip.title = " "
      expect(@gossip).to_not be_valid
    end

    it "title cannot be more than 255 chars" do
      @gossip.title = "a" * 256
      expect(@gossip).to_not be_valid
    end

    it "body cannot be blank" do
      @gossip.body = " "
      expect(@gossip).to_not be_valid
    end
  
  end
end

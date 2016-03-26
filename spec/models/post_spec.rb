require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe Post do

    it 'has valid title' do
      post = Post.new(
          title:'First Post',
          content: 'Hi this is fun :D',
          category: FactoryGirl.create(:category),
          user: FactoryGirl.create(:user)
      )
      expect(post).to be_valid
    end

    it 'should not be valid with no title' do
      post = Post.new(
          title: nil,
          content: 'Hi this is fun :D',
          category: FactoryGirl.create(:category),
          user: FactoryGirl.create(:user)
      )
      expect(post).to_not be_valid
    end

    it 'should not be valid with no content' do
      post = Post.new(
          title: 'First post',
          content: nil,
          category: FactoryGirl.create(:category),
          user: FactoryGirl.create(:user)
      )
      expect(post).to_not be_valid
    end

    it 'should not be valid without a category' do
      post = Post.new(
          title: 'First post!',
          content: 'Hi this is fun :D',
          category: nil,
          user: FactoryGirl.create(:user)
      )
      expect(post).to_not be_valid
    end

    it 'should not be valid with a non existing category' do

      cat = Category.new(name: 'I do not exist yet!')

      post = Post.new(
          title: nil,
          content: 'Hi this is fun :D',
          category: cat,
          user: FactoryGirl.create(:user)
      )
      expect(post).to_not be_valid
    end

    it 'should not be valid without a user' do
      post = Post.new(
          title: 'I am batman',
          content: 'Hi this is fun :D',
          category: FactoryGirl.create(:category),
          user: nil
      )
      expect(post).to_not be_valid
    end

  end

end

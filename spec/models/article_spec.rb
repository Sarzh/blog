require 'spec_helper'

describe Article do 

  describe 'validations' do 

    it { should validate_presence_of :title }
    it { should validate_length_of :title }

    it { should validate_presence_of :text }
    it { should validate_length_of :text }

  end

  describe 'associations' do 

    it { should have_many :comments }

  end

  describe '#subject' do

    it "returns the article's title" do 
      article = create(:article, title: 'Lorem Ipsum') #factory_girl_rails gem needed
      expect(article.subject).to eq 'Lorem Ipsum'
    end

  end

  describe '#last_comment' do
    it "returns last comment" do
      article = create(:article_with_comments)

      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end

end
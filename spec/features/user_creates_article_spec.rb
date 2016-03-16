require 'spec_helper'

feature 'Article Creation' do

  before(:each) do
    sign_up
  end

  scenario 'allows user to visit new article page' do
    visit new_article_path
    expect(page).to have_content 'New article'
  end

  scenario 'user tries to post article' do
    post_article
    expect(page).to have_content 'Test article'
  end

  scenario 'user tries to edit his article' do
    post_article
    visit edit_article_path(1)
    expect(page).to have_content 'Edit Article' #works
    fill_in :article_title, :with => 'Edited test title'
    fill_in :article_text, :with => 'Edited test text'
    click_button 'Save Article'
    expect(page).to have_content 'Edited test title'
  end

end
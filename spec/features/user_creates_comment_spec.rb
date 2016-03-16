require 'spec_helper'

feature 'Article Creation' do

  scenario 'User comments his new article' do
    sign_up
    post_article
    fill_in :comment_body, :with => 'Test comment'
    expect(page).to have_content 'Test comment'
  end

end
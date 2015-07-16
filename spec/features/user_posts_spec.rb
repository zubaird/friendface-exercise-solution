require 'rails_helper'

feature 'User Posts' do

  let(:user) { User.create(username:"Hungrybara", email:"hungrybara@example.com" )}

  scenario 'when a valid post is entered' do
    visit new_user_post_path(user)

    fill_in "content", with: "I like turtles"
    click_button 'post'

    expect(page).to have_content user.posts.first.content
  end
end

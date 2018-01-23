require 'acceptance/acceptance_helper'

feature 'Admin create new admin' do
  given(:admin) { create(:admin) }

  before do
    sign_in(admin)
    visit admin_root_path
  end

  scenario 'Admin create valid object' do
    click_on 'New admin'
    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: 'test@mail.ru'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Save'

    expect(current_path).to eq(admin_users_admins_path)
    expect(page).to have_content (I18n.t('messages.admins.registred'))
  end

  scenario 'Admin create invalid object' do
    click_on 'New admin'
    click_on 'Save'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end

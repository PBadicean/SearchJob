require 'acceptance/acceptance_helper'

def click_edit(id)
  within ".edit-user-#{id}" do
    click_on 'Edit'
  end
end

feature 'Admin edit admins' do
  given(:admin)  { create(:admin) }
  given!(:admin2) { create(:admin) }

  before do
    sign_in(admin)
    visit admin_users_admins_path
    click_edit(admin2.id)
  end

  scenario 'With valid data' do
    fill_in 'Name', with: 'New Name'
    fill_in 'Email', with: 'test2@mail.ru'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Save'

    expect(current_path).to eq(admin_users_admins_path)
    expect(page).to have_content I18n.t('messages.admins.updated')
    expect(page).to have_content 'New Name'
  end

  scenario 'Without password editing' do
    fill_in 'Name', with: 'New Name'
    click_on 'Save'

    expect(current_path).to eq(admin_users_admins_path)
    expect(page).to have_content I18n.t('messages.admins.updated')
    expect(page).to have_content 'New Name'
  end
end

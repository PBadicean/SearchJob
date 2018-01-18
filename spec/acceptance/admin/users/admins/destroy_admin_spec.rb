require 'acceptance/acceptance_helper'

feature 'Admin destroy admins' do

  given(:admin)  { create(:admin) }
  given!(:admin2) { create(:admin) }

  scenario 'Destroy admin' do
    sign_in(admin)
    visit admin_users_admins_path

    within ".destroy-user-#{admin2.id}" do
      click_on 'Destroy'
    end

    expect(current_path).to eq(admin_users_admins_path)
    expect(page).to have_content (I18n.t('messages.admins.destroyed'))
    expect(page).to_not have_content admin2.name
  end
end

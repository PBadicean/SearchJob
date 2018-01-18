require 'acceptance/acceptance_helper'

feature 'Admin create new admin' do
  given(:admin) { create(:admin) }

  scenario 'Admin create valid object' do
    sign_in(admin)
    visit admin_root_path

    click_on 'New admin'
    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: 'test@mail.ru'
    fill_in 'Password confirmation', with: '123456'

    fill_in 'Password', with: '123456'
    click_on 'Save'

    expect(page).to have_content 'New Admin successful Added'
  end

  scenario 'Admin create invalid object' do
    sign_in(admin)
    visit admin_root_path

    click_on 'New admin'
    click_on 'Save'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end

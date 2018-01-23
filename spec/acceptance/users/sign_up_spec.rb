require 'acceptance/acceptance_helper'

place_id = 'input#candidate_info_attributes_place_id'

feature 'Sign up' do

  scenario 'Candidate tries to sign up' do
    visit root_path
    click_on 'Sign up candidate'

    first(place_id, visible: false).set("123123123")
    fill_in 'Name', with: 'polina'
    fill_in 'Email', with: 'test@mail.ru'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with:'123456789'
    click_on 'Save'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
  end

  scenario 'Employer tries to sign up' do
    visit root_path
    click_on 'Sign up employer'

    fill_in 'Company name', with: 'search_job'
    fill_in 'Name', with: 'polina'
    fill_in 'Email', with: 'test@mail.ru'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with:'123456789'
    click_on 'Save'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
  end
end

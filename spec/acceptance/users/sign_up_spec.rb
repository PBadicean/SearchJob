require 'acceptance/acceptance_helper'

place_id = 'input#candidate_info_attributes_place_id'

feature 'Sign up' do

  scenario 'Candidate tries to sign up' do
    visit root_path
    click_on 'Sign up candidate'
    visit candidate_users_registrations_path

    first(place_id, visible: false).set("123123123")
    fill_in 'Name', with: 'polina'
    fill_in 'Email', with: 'test@mail.ru'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with:'123456789'
    click_on 'Sign up'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('Вы успешно зарегестрировались, теперь войдите в ваш аккаунт')
  end
end

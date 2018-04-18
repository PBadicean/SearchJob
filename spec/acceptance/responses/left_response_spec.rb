require 'acceptance/acceptance_helper'

feature 'Candidate left hes response' do

  given(:candidate) { create(:candidate) }
  given(:vacancy)   { create(:vacancy) }

  scenario 'Authenticated candidate creates response' do
    sign_in(candidate)
    visit vacancy_path(vacancy)

    fill_in 'Discription', with: 'I want to work'
    click_on 'Save'
    expect(current_path).to eq vacancy_path(vacancy)
    expect(page).to have_content 'Your Response successful Added'
  end
  #
  scenario 'Authenticated creates invalid response' do
    sign_in(candidate)
    visit vacancy_path(vacancy)

    fill_in 'Discription', with: ''
    click_on 'Save'
    expect(current_path).to eq vacancy_path(vacancy)
    expect(page).to_not have_content 'Your Response successful Added'
  end

  scenario 'Non-Authenticated candidate tries to creates response' do
    visit vacancy_path(vacancy)

    expect(page).to have_no_link 'Save'
  end
end

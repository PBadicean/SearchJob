require 'acceptance/acceptance_helper'

feature 'Candidate edit resume' do

  given(:candidate) { create(:candidate)}
  given!(:resume)    { create(:resume, user: candidate)}

  scenario 'Author edit own resume' do
    sign_in(candidate)
    visit candidate_root_path
    click_on 'My Resumes'
    click_on 'Edit'

    fill_in 'Position', with: 'Ruby Programmer'
    click_on 'Update Resume'

    expect(current_path).to eq (candidate_resumes_path)
    expect(page).to have_content 'Ruby Programmer'
    expect(page).to have_content (I18n.t('messages.resumes.updated'))
  end
end

require 'acceptance/acceptance_helper'

feature 'Candidate edit resume' do

  given(:category)     { create(:category)}
  given!(:subcategory) { create(:category, name: 'Programming', parent_id: category.id)}
  given(:candidate)    { create(:candidate)}
  given!(:resume)       { create(:resume, user: candidate)}
  given!(:experience_1) { create(:experience, company: 'yandex', resume: resume) }
  given!(:experience_2) { create(:experience, company: 'google', resume: resume) }

  scenario 'Author edit own resume', js: true do
    sign_in(candidate)
    visit candidate_root_path
    click_on 'My Resumes'

    click_on 'Edit'
    within('.resume_position'){ fill_in 'Position', with: 'React Programmer' }
    fill_in 'Salary', with: 3500
    fill_in 'About me', with: 'New About'
    within('.tagit'){ first('input').set('js') }
    select "Programming", from: "resume[category_id]"
    within all(".remove-experience").last do
      click_on 'remove experience'
    end

    click_on 'add experience'
    within all(".nested-fields.row").last do
      select 2013, from: select_date('date_start_1i')
      select 'December', from: select_date('date_start_2i')
      select 2016, from: select_date('date_end_1i')
      select 'May', from: select_date('date_end_2i')
      fill_in 'Company', with: 'Audi'
      fill_in 'Duty', with: 'Duty Duty Duty'
      fill_in 'Position', with: 'Teamled'
    end

    click_on 'Update Resume'

    expect(current_path).to eq candidate_resumes_path
    expect(page).to have_content 'React Programmer'
    expect(page).to have_content I18n.t('messages.resumes.updated')

    visit resume_path(resume)

    expect(page).to_not have_content 'google'
    expect(page).to_not have_content 'Junior'
    expect(page).to have_content resume.user.email
    expect(page).to have_content '3500'
    expect(page).to have_content 'React Programmer'
    expect(page).to have_content 'js'
    expect(page).to have_content 'New About'
    expect(page).to have_content 'Audi'
    expect(page).to have_content '2013-12-01'
    expect(page).to have_content '2016-05-01'
  end
end

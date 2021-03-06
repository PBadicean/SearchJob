require 'acceptance/acceptance_helper'

feature 'Candidate makes resume' do

  given(:candidate)    { create(:candidate)}
  given(:category)     { create(:category)}
  given!(:subcategory) { create(:category, name: 'Programming', parent_id: category.id)}

  scenario 'add resume', js: true do
    sign_in(candidate)
    visit candidate_root_path

    click_on 'Create new resume'
    fill_in 'Position', with: 'Ruby Programmer'
    fill_in 'Salary', with: 2500
    fill_in 'About me', with: 'About'
    within('.tagit'){ first('input').set('Ruby') }
    select "Programming", from: "resume[category_id]"

    click_on 'add experience'
    select 2013, from: select_date('date_start_1i')
    select 'May', from: select_date('date_start_2i')
    select 2013, from: select_date('date_end_1i')
    select 'December', from: select_date('date_end_2i')
    fill_in 'Company', with: 'Google'
    within('.nested-fields'){ fill_in 'Position', with: 'Junior' }
    fill_in 'Duty', with: 'A variety of'

    click_on 'Create Resume'

    expect(current_path).to eq(candidate_resumes_path)
    expect(page).to have_content 'Ruby Programmer'
  end

  scenario 'Add invalid resume', js: true do
    sign_in(candidate)
    visit candidate_root_path

    click_on 'Create new resume'
    click_on 'add experience'
    click_on 'Create Resume'

    expect(page).to have_content('Category must exist')
    expect(page).to have_content("Position can't be blank")
    expect(page).to have_content("Salary can't be blank")
    expect(page).to have_content("About me can't be blank")

    expect(page).to have_content("Experiences duty can't be blank")
    expect(page).to have_content("Experiences company can't be blank")
  end
end

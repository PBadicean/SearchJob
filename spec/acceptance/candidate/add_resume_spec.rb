require 'acceptance/acceptance_helper'

feature 'Candidate makes resume' do

  given(:candidate) { create(:candidate)}
  given(:category) { create(:category)}

  before do
    Category.create(name: 'Programmatore', parent_id: category.id)
  end

  scenario 'add resume', js: true do
    sign_in(candidate)
    visit candidate_root_path

    click_on 'Create new resume'
    fill_in 'Position', with: 'Programmatore'
    fill_in 'Salary', with: 2500
    fill_in 'About me', with: 'About'
    select "Programmatore", from: "resume[category_id]"

    click_on 'add experience'

    date_start_year = find(:xpath, ".//select[contains(@id,'date_start_1i')]")[:id]
    date_start_month = find(:xpath, ".//select[contains(@id,'date_start_2i')]")[:id]
    date_end_year = find(:xpath, ".//select[contains(@id,'date_end_1i')]")[:id]
    date_end_month = find(:xpath, ".//select[contains(@id,'date_end_2i')]")[:id]

    select 2013, from: date_start_year
    select 'May', from: date_start_month
    select 2013, from: date_end_year
    select 'December', from: date_end_month
    fill_in 'Company', with: 'Google'
    fill_in 'Duty', with: 'A variety of'

    click_on 'Create Resume'

    expect(current_path).to eq(candidate_resumes_path)
    expect(page).to have_link 'Programmatore'
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

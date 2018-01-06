require 'acceptance/acceptance_helper'

feature 'Candidate makes resume' do

    given(:candidate) { create(:candidate)}

    scenario 'add resume'do
      sign_in(candidate)

      visit root_path

      click_on 'Оставить резюме'

      fill_in 'Желаемая должность'
      fill_in 'Желаемая зарплата'

      click_on 'Сохранить'
    end

end

require 'acceptance/acceptance_helper'

feature 'User can sign in with facebook', '
  In order to be in my app
  As an authenticated or non-authenticated user
  I want to sign in with facebook
' do

  given(:candidate) { create(:candidate) }
  given(:employer) { create(:employer) }

  scenario 'Candidate tries to register with facebook' do
    visit registrations_candidates_path
    mock_facebook_auth_hash
    click_on 'Sign in with Facebook'

    expect(current_path).to eq candidate_root_path
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end

  scenario 'Employer tries to register with facebook' do
    visit registrations_employers_path

    expect(page).to_not have_content 'Sign in with Facebook'
  end

  scenario 'Candidate tries to sign in with facebook' do
    candidate.identities.create(
                                    provider: mock_facebook_auth_hash.provider,
                                    uid: mock_facebook_auth_hash.uid)

    visit new_user_session_path
    mock_facebook_auth_hash
    click_on 'Sign in with Facebook'

    expect(current_path).to eq candidate_root_path
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end

  scenario 'Employer tries to sign in with facebook' do
    employer.identities.create(
                                    provider: mock_facebook_auth_hash.provider,
                                    uid: mock_facebook_auth_hash.uid)

    visit new_user_session_path
    mock_facebook_auth_hash
    click_on 'Sign in with Facebook'

    expect(current_path).to eq employer_root_path
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end

end

require "rails_helper"

describe "User following another user" do
  it "allows a user to follow and unfollow another user" do
    other_user = create_user(:first_name => "Follow", :last_name => "Me")
    create_rant(:author => other_user)

    login_user(create_user)

    expect(page).to have_content("Follow Me")
    click_on "Follow"

    expect(page).to have_content("You are now following Follow Me")
    click_on "Following"
  end
end

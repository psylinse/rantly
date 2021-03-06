require "rails_helper"

describe "A user searching for rants" do
  def search(query)
    user = create_user(:first_name => "Jeff",
                       :last_name  => "Taggart",
                       :username   => "psylinse")

    create_rant(:author => user,
                :title => "Find me! Please!",
                :body => "Some text. This is text in the middle. Other text that gets it over the limit. Gah this long. Really, it needs to be longer?? Ahhh whattt???")

    create_rant(:title => "Don't find me")

    login_user(user)

    within("nav") do
      click_on "Search"
    end

    expect(page).to have_no_content("Find me!")
    expect(page).to have_no_content("Don't find me")

    within("section.search") do
      fill_in "query", :with => query
      click_on "Search"
    end

    expect(page).to have_content("Find me! Please!")
    expect(page).to have_no_content("Don't find me")
  end

  it "allows a user to search by last name" do
    search("Taggart")
  end

  it "allows a user to search by first name" do
    search("Jeff")
  end

  it "allows a user to search by first name" do
    search("psylinse")
  end

  it "allows a user to search by the body" do
    search("This is text in the middle")
  end

  it "allows a user to search by the title" do
    search("Please")
  end

  it "allows a user to search by hashtag" do
    create_rant(:title => "Search by this rant", :body => "this has a #hashtag "*50)
    create_rant(:title => "Find this rant", :body => "this also has a #hashtag "*50)

    login_user(create_user)

    click_on "Search by this rant"

    click_link("#hashtag", :match => :first)
    
    expect(page).to have_content("Search")
    expect(page).to have_content("Search by this rant")
    expect(page).to have_content("Find this rant")
  end

end

Feature: User can manually manage movie


Scenario: Add a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  And I should see "Details about Men In Black"
  When I follow "Back to movie list"
  Then I should see "Men In Black"


Scenario: Edit movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page

  When I follow "Edit info"
  Then I should see "Edit Movie"
  When I fill in "Title" with "Men In Black 2"
  And I fill in "Description" with "2 men vs alien"
  And I press "Save Changes"
  Then I should see "Men In Black 2 was successfully updated"
  And I should see "2 men vs alien"

Scenario: Delete movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  When I follow "Delete"
  Then I should see "Movie ’Men In Black’ deleted."
  And I should not see "More about Men In Black"

Scenario: see details
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on Men In Black page
  And I should see "Details about Men In Black"
  When I follow "Back to movie list"
  Then I should be on the RottenPotatoes home page

  When I click "More about Men In Black"
  Then I should see "Details about Men In Black"
  And I should see "Rating: PG-13"

  
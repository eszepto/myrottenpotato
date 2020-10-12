Feature: User can search movie

    Scenario: search movie
        Given I am on the RottenPotatoes home page
        When I fill in "search_terms" with "harry"
        And I press "Search TMDb"
        Then I should see "Search Results for harry"
        And I should see "Harry Potter and the Philosopher's Stone"
        And I should see "Harry Potter and the Goblet of Fire"
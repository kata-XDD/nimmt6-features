Feature: Game session preparation

  Scenario Outline: From 2 to 10 player can participate
    Given a game session
    And <nbrOfPlayer> player are already in the game session
    When <nbrOfJoiningPlayer> player join the game session
    Then there is now <newNbrOfPlayer> player in the game session
    And there <isOrNot> an error telling the number of player is too high
    Examples:
      | nbrOfPlayer | nbrOfJoiningPlayer | newNbrOfPlayer | isOrNot |
      |           0 |                  1 |              1 |  is not |
      |           1 |                  2 |              3 |  is not |
      |           5 |                  2 |              7 |  is not |
      |          10 |                  1 |             10 |      is |
      |           0 |                 10 |             10 |  is not |
      |           0 |                 11 |              0 |      is |
      |           1 |                 10 |              1 |      is |
      |           5 |                  6 |              5 |      is |

  Scenario: Each player are unique in a game session
    Given a game session
    And a player join the game session
    When the same player try to join the game session
    Then the number of player does not change
    And there is a warning telling a player can't participate multiple time in the same game session

  Scenario: Each player must be at least 8 years old
    When a player is younger than 8 years old
    Then there is an error telling that a player can't be younger than 8 years old

  Scenario: Each player receive exactly 10 different cards at the beginning of the game session
    Given a startable game session
    When the game session starts
    Then each player have 10 cards
    And each distributed cards are different

  Scenario: A game session can start only if there is at least 2 players
    Given a game session
    And <nbrOfPlayer> player are already in the game session
    When the game start
    Then there <isOrNot> an error telling there is not enough members to start
    Examples:
      | nbrOfPlayer | isOrNot |
      |           0 |      is |
      |           1 |      is |
      |           2 |  is not |
      |           3 |  is not |
      |           4 |  is not |
      |           5 |  is not |
      |           6 |  is not |
      |           7 |  is not |
      |           8 |  is not |
      |           9 |  is not |
      |          10 |  is not |

  Scenario: At the start of a game session there is 4 lines arranged on the table
    Given a startable game session
    When the game session starts
    Then there is 4 lines with 1 cards each
    And those cards are different from the users' cards

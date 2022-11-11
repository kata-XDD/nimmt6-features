Feature: Deck preparation

  Scenario: Before the game session start, there is exactly 104 cards
    When the deck is built
    Then there is 104 cards
    And each card has at least one cattle head

  Scenario: Before the game session start, the card 55 contains 7 cattles heads
    When the deck is built
    Then the card 55 has 7 cattle heads

  Scenario: Before the game session start, the cards multiple of 11, execpt 55 contain 5 cattle heads
    When the deck is built
    Then there is 8 cards with 5 cattle heads
    And all cards multiple of 11 have 5 cattle heads, except 55
    And the cards 55 has 7 cattle heads

  Scenario: Before the game session start, the cards multiple of 10 contain 3 cattle heads
    When the deck is built
    Then there is 10 cards with 3 cattle heads
    And all cards multiple of 10 have 3 cattle heads

  Scenario: Before the game session start, the cards multiple of 5, execpts multiple of 10 and 11, have 2 cattle heads
    When the deck is built
    Then there is 9 cards with 2 cattle heads
    And all cards multiple of 5 but not 10 have 2 cattle heads
    And the cards 55 has 7 cattle heads

  Scenario: Before the game session start, all other cards have 1 cattle head
    When the deck is built
    Then there is 76 cards with 1 cattle head

  Scenario: Random distribution of cards
    When a first game session start
    And a second game session start
    Then the deck in each game session have a different order



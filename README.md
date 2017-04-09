Codebreaker
===========

A BDD command-line game built for *The RSpec Book*.

```feature
Feature: code-breaker starts game
  As a code-breaker
  I want to start a game
  So that I can break the code

  Scenario: start game                          # features/codebreaker_starts_game.feature:7
    Given I am not yet playing                  # features/step_definitions/codebreaker_starts_game_steps.rb:1
    When I start a new game                     # features/step_definitions/codebreaker_starts_game_steps.rb:4
    Then I should see "Welcome to Codebreaker!" # features/step_definitions/codebreaker_starts_game_steps.rb:9
    And I should see "Enter guess:"             # features/step_definitions/codebreaker_starts_game_steps.rb:9

Feature: code-breaker submits guess
  The code-breaker submits a guess of four numbers.  The game marks the guess
  with + and - signs.

  For each number in the guess that matches the number and position of a number
  in the secret code, the mark includes one + sign. For each number in the guess
  that matches the number but not the position of a number in the secret code,
  the mark includes one - sign.

  Each position in the secret code can only be matched once. For example, a
  guess of 1134 against a secret code of 1234 would get three plus signs: one
  for each of the exact matches in the first, third, and fourth positions. The
  number match in the second position would be ignored.

  Scenario Outline: submit guess      # features/codebreaker_submits_guess.feature:16
    Given the secret code is "<code>" # features/codebreaker_submits_guess.feature:17
    When I guess "<guess>"            # features/codebreaker_submits_guess.feature:18
    Then the mark should be "<mark>"  # features/codebreaker_submits_guess.feature:19

    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1555  | +    |
      | 1234 | 2555  | -    |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 5254  | ++   |
      | 1234 | 5154  | +-   |
      | 1234 | 2545  | --   |

    Scenarios: 3 numbers correct
      | code | guess | mark |
      | 1234 | 5234  | +++  |
      | 1234 | 5134  | ++-  |
      | 1234 | 5124  | +--  |
      | 1234 | 5123  | ---  |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |

    Scenarios: matches with duplicates
      | code | guess | mark |
      | 1234 | 1155  | +    |
      | 1234 | 5115  | -    |
      | 1134 | 1155  | ++   |
      | 1134 | 5115  | +-   |
      | 1134 | 5511  | --   |
      | 1134 | 1115  | ++   |
      | 1134 | 5111  | +-   |

22 scenarios (22 passed)
67 steps (67 passed)
0m0.038s
```

```
Codebreaker::Game
  #guess
    sends the mark to output
  #start
    prompts for the first guess
    sends a welcome message

Codebreaker::Marker
  #exact_match_count
    with 1 number match
      returns 0
    with 1 exact match and 1 number match
      returns 1
    with 1 exact match
      returns 1
    with no matches
      returns 0
  #number_match_count
    with 1 exact match and 1 number match
      returns 1
    with 1 number match
      returns 1
    with no matches
      returns 0
    with 1 exact match
      returns 0
    with 1 exact match duplicated in guess
      returns 0

Finished in 0.00962 seconds (files took 0.08525 seconds to load)
12 examples, 0 failures

Randomized with seed 54686
```

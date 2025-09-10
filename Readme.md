# PokerR 🎲♠️

**PokerR** is an R package that lets you **play Texas Hold'em poker** in your console and **estimate your winning chances** using Monte Carlo simulation.  
It’s designed to be simple, educational, and modular — perfect for poker enthusiasts, statisticians, and R learners.

---

## 📌 Features
- **Play Poker**: Simulate a Texas Hold'em game with `play_poker()`.
- **Win Probability Estimation**: Calculate your chances of winning using `estimate_win_prob()` and Monte Carlo simulations.
- **Hand Evaluation**: Detects all standard poker hands — from High Card to Royal Flush.
- **Unit-Tested**: Built with `testthat` to ensure correct and reliable results.
- **Modular Functions**: Includes card creation, dealing, parsing, scoring, and winner determination.

---

## 🛠 Core Functions
- `create_deck()` : Creates a standard 52-card deck.
- `deal()` : Deals hole cards to players and community cards.
- `parse_cards()` : Splits cards into rank and suit for analysis.
- `is_*()` : Checks for specific poker hands (pair, flush, straight, etc.).
- `evaluate_hand()` : Returns the best 5-card hand for given hole + community cards.
- `get_score()` : Assigns a numeric score to a hand for comparison.
- `get_winner()` : Determines the winner(s) among multiple players.
- `estimate_win_prob()` : Runs Monte Carlo simulations to calculate win probability.

---

## 🧪 Testing
All functions are tested with the `testthat` framework.
<br>
To run the tests:
```
library(testthat)
test_dir("tests")
```
---

## 📂 Package Structure
```
PokerR/
├── R/                  # Core R functions
├── man/                # Documentation
├── tests/              # Unit tests
├── DESCRIPTION         # Package metadata
├── NAMESPACE           # Function exports
└── README.md           # This file
```
---

## Documentation
Once installed, you can view the help files for any function:
- `?play_poker`
- `?estimate_win_prob`
- `?create_deck`



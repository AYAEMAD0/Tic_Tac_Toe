# 🎮 Tic Tac Toe (XO Game)

**Tic Tac Toe** is a Flutter-based game that lets you play **with AI 🤖** or **with a Friend 👥**.  
It follows the **MVVC architecture**, uses **Cubit (flutter_bloc)** for state management, and features a **beautiful animated UI** using **Lottie** and **flutter_screenutil** for responsiveness.

---

## ✨ Features

* **Main Menu**:
    * Choose between *Play with AI* or *Play with Friend*.

* **Setup (Play with Friend)**:
    * Enter **Player 1** and **Player 2** names.
    * Select the number of rounds (**3**, **5**, or **10**).
    * Choose **shape** (X or O) for Player 1 via radio buttons.
    * Random button to decide who starts first.

* **Setup (Play with AI)**:
    * Enter **Player 1** name (Player 2 defaults to “Computer”).
    * Select number of rounds (**3**, **5**, or **10**).
    * Choose shape (**X** or **O**) for Player 1.
    * Player 1 always starts first (not the computer).

* **Game Screen**:
    * Play and track your moves.
    * Displays turn indicators and winner highlight.
    * Round-based scoring system.

* **Score Screen**:
    * Shows both players’ names, scores, and rounds.
    * Displays **Lottie animations** depending on result:
        * 🥳 **Happy animation** when the player wins.
        * 😢 **Sad animation** when losing vs AI.
        * 🤝 **Handshake animation** on draw.
    * Two buttons:
        * **Play Again** → navigate to setup.
        * **Main Menu** → navigate to mode selection.

---

## 🛠️ Tech Stack

* **Framework**: Flutter
* **Architecture**: MVVC
* **State Management**: Cubit (flutter_bloc)
* **Animations**: Lottie
* **Routing**: Named Routes
* **Responsive UI**: flutter_screenutil
* **UI Design**: Material Design with Gradient backgrounds

---

## 📦 Packages

* `flutter_bloc` – State management
* `lottie` – Animated result screens
* `flutter_screenutil` – Responsive UI
* `google_fonts` – Custom typography

---

## 🕹️ Game Flow

1. **Menu Screen** → Choose mode *(Friend or AI)*
2. **Setup Screen** → Enter names, choose shape, and select rounds
3. **Game Screen** → Play Tic Tac Toe
4. **Score Screen** → View winner animation and replay options

---
## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/AYAEMAD0/Tic_Tac_Toe/
   cd Tic_Tac_Toe
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```
---
## 🔄 App Flow Diagram

![App Flow Diagram](assets/images/screenshots/tic_tac_toe.png)

---

## 📸 Screenshots
## 🚀 Launcher & Splash
| Launcher                                    | Splash                                   |
|---------------------------------------------|------------------------------------------|
| ![Launcher](assets/images/screenshots/lanucher.png) | ![Splash](assets/images/screenshots/splash.png) |


## 🎮 Menu
| Menu |
|------|
| ![Menu](assets/images/screenshots/menu.png) |

## ⚙️ Setup (Play with Friend)
| Setup 1 | Setup 2 | Setup 3 |
|---------|---------|---------|
| ![Setup Friend 1](assets/images/screenshots/setupFriend.png) | ![Setup Friend 2](assets/images/screenshots/setupFriendError.png) | ![Setup Friend 3](assets/images/screenshots/setupFriendErrorRandom.png) |

| Setup 4 | Setup 5                                                      |
|---------|--------------------------------------------------------------|
| ![Setup Friend 4](assets/images/screenshots/openRandom.png) | ![Setup Friend 5](assets/images/screenshots/setupFriendRound.png) |

## ⚙️ Setup (Play with AI)
| Setup 1 | Setup 2 |
|---------|---------|
| ![Setup AI 1](assets/images/screenshots/setupAi.png) | ![Setup AI 2](assets/images/screenshots/setupAiName.png) |

## 🕹️ Game (Friend Mode)
| Game 1 | Game 2 | Game 3 |
|--------|--------|--------|
| ![Game Friend 1](assets/images/screenshots/gameFriendTurnPlay1.png) | ![Game Friend 2](assets/images/screenshots/gameFriendTurnPlay2.png) | ![Game Friend 3](assets/images/screenshots/gameFriendNone.png) |

| Game 4 | Game 5 |
|--------|--------|
| ![Game Friend 4](assets/images/screenshots/gameFriendWinPlay1.png) | ![Game Friend 5](assets/images/screenshots/gameFriendWinPlay2.png) |


## 🕹️ Game (AI Mode)
| Game 1 | Game 2 | Game 3 |
|--------|--------|--------|
| ![Game AI 1](assets/images/screenshots/gameAiTurnPlay1.png) | ![Game AI 2](assets/images/screenshots/gameAiTurnPlay2.png) | ![Game AI 3](assets/images/screenshots/gameAiNone.png) |

| Game 4 | Game 5         |
|--------|----------------|
| ![Game AI 4](assets/images/screenshots/gameAiWinPlay1.png) | ![Game AI 5](assets/images/screenshots/gameAiWinPlay2.png) |


## 🏆 Score (Friend Mode)
| Score 1 | Score 2 | Score 3 |
|---------|---------|---------|
| ![Score Friend 1](assets/images/screenshots/scoreFriendWinPlay1.png) | ![Score Friend 2](assets/images/screenshots/scoreFriendWinPlay2.png) | ![Score Friend 3](assets/images/screenshots/scoreFriendNone.png) |

## 🏆 Score (AI Mode)
| Score 1 | Score 2 | Score 3 |
|---------|---------|---------|
| ![Score AI 1](assets/images/screenshots/scoreAiWin.png) | ![Score AI 2](assets/images/screenshots/scoreAiLose.png) | ![Score AI 3](assets/images/screenshots/scoreAiNone.png) |

---

## 👩‍💻 Author

Developed by **Aya Emad**

* [GitHub](https://github.com/AYAEMAD0)
* [LinkedIn](https://www.linkedin.com/in/aya-emad1/)

---

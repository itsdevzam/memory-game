# 🧠 Memory Game - Flutter

A modern and interactive memory card game built with Flutter.  
Match pairs, manage lives, earn coins, and challenge your memory skills!

---

## 🎮 Features

- 🔢 Multiple Grid Sizes (3x2, 4x3, 6x4)
- 🎯 Custom Grid Mode
- ❤️ Dynamic Life System
- ⭐ Coin Reward System
- 🔊 Sound Effects (Toggle On/Off)
- 🏆 Win & Game Over Dialog
- 🎨 Smooth UI & Animated Card Flip
- 📱 Responsive Layout

---

## 🖼️ Screenshots

### 1️⃣ Home Screen
![Home](https://github.com/itsdevzam/memory-game/blob/main/assets/images/1.png)

---

### 2️⃣ Game Screen
![Game](https://github.com/itsdevzam/memory-game/blob/main/assets/images/2.png)

---

### 3️⃣ Win Dialog
![Win](https://github.com/itsdevzam/memory-game/blob/main/assets/images/3.png)

---

### 4️⃣ Settings Dialog
![Settings](https://github.com/itsdevzam/memory-game/blob/main/assets/images/4.png)

---

### 5️⃣ Custom Mode
![Custom](https://github.com/itsdevzam/memory-game/blob/main/assets/images/5.png)

---

## 🛠️ Tech Stack

- Flutter
- Provider (State Management)
- Audioplayers
- Custom Animations
- Clean Architecture

---

## 🧠 Game Logic

- Cards are generated dynamically based on selected grid size.
- Total pairs = (rows × columns) / 2
- Lives scale according to grid difficulty.
- Coins are rewarded for correct matches.
- Game ends when:
  - All cards matched (Win)
  - Lives reach 0 (Game Over)

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run

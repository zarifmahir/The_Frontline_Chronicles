# The Frontline Chronicles

**The Frontline Chronicles** is a top-down 2D story-driven game developed for the **BUET CSE Fest GameJam 2024**. The game weaves an emotional narrative set against the backdrop of student protests—honoring the sacrifices made by individuals fighting for justice. It blends engaging top-down exploration, melee combat, and classic logic puzzles.

## 🎮 Features

- **Story-Driven Narrative:** Experience an emotional and gripping story involving protests, kidnappings, and heroic sacrifices. Interact with various characters to uncover the truth and save your friends.
- **Interactive Dialogue System:** Powered by [Nathan Hoad's Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager) for Godot, enabling branching conversations, quest solving, and narrative progress.
- **Logic Puzzles:** Engage your brain with integrated logic puzzles, such as the classic "Knight and Knave" riddle, seamlessly built into the NPC dialogue.
- **Melee Combat Action:** Fight a variety of enemies using a polished top-down combat system. Features include hitboxes, hurtboxes, knockback, an animated sword attack, and a health vital (Hearts) tracking system.
- **Multi-Level Exploration:** Explore a variety of rich, tile-based scenes ranging from an open world map (`world.tscn`) to inside buildings, garages, police stations, and a somber final grave setting.
- **Enemy AI:** Enemies feature patrol pathing, tracking mechanics, taking damage, and dropping.
- **Complete UI & Options:** Fully functional Main Menu, Pause Menu, Options Menu, and customizable Audio Sliders.

## 📁 Project Structure

This project is built using the **Godot Engine 4.3**. The main directory structure is as follows:

```
├── addons/
│   └── dialogue_manager/   # Nathan Hoad's Dialogue Manager plugin used for branching conversations.
├── assets/                 # All game assets including sprites, tilesets, background images, fonts, and audio (BGM/SFX).
├── Dialogue/               # Contains the `.dialogue` scripts defining NPC interactions and puzzle logic.
├── enemy/                  # Holds specific sprite assets and imports dedicated to enemy variations.
├── scenes/                 # Contains all the Godot scene files (.tscn)
│   ├── Level Maps        # e.g., world.tscn, garage.tscn, police.tscn, insidebuilding_1.tscn
│   ├── Characters        # e.g., Player_2.tscn, detective.tscn, enemy_1.tscn, npc.tscn
│   ├── UI & Menus        # e.g., main_menu.tscn, options_menu.tscn, pause_menu.tscn, hearts.tscn
│   └── Mechanics         # e.g., actionables.tscn, scene_manager.tscn, sword.tscn
├── scripts/                # Contains all the GDScript (.gd) source code driving the game logic.
│   ├── core/utilities    # e.g., state.gd, scene_manager.gd, base_scene.gd
│   ├── characters/AI     # e.g., player_2.gd, detective.gd, enemy_1.gd, friend.gd
│   ├── mechanics         # e.g., weapon.gd, sword.gd, hearts.gd, actionables.gd
│   └── UI                # e.g., main_menu.gd, audio_slider_settings.gd
├── project.godot           # Core Godot engine configuration file.
└── icon.svg                # Project application icon.
```

## 🛠️ Engine & Requirements

- **Game Engine:** Godot Engine 4.3 (GL Compatibility)
- **Language:** GDScript
- **Addons Required:** [Dialogue Manager by Nathan Hoad](https://godotengine.org/asset-library/asset/2276) (already included in `addons/`).

## 🚀 How to Run

1. Clone or download this repository.
2. Open the **Godot 4.3** Project Manager.
3. Click on **Import** and select the `project.godot` file in the root folder.
4. Open the project in the editor and click the **Run Project** (F5) button, or manually open `res://scenes/main_menu.tscn` to start.

## 📖 Controls 

- **Movement:** `W`, `A`, `S`, `D` / Arrow Keys  
- **Interact/Chat:** `Z`  
- **Attack:** `Left Click` or custom bound interact key
- **Pause:** `Escape`

## 🔗 Links & Demo

- **Game Link:** [https://ishmamzarif.itch.io/the-frontline-chronicles]
- **Gameplay Video:** [https://www.youtube.com/watch?v=Cesvld1aeiE]

## 👥 Team Members

- [Zarif Mahir](https://github.com/zarifmahir)
- [Shafnan Wasif](https://github.com/Rohan15035)
- [Zarif Ishmam](https://github.com/ishmamzarif)

---
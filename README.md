# cub3D - My first RayCaster with miniLibX

**cub3D** is a 42 school project that involves creating a realistic 3D graphical representation of the inside of a maze from a first-person perspective using **RayCasting** principles. The project is built using the **miniLibX** library.

## 🎮 Features

### Mandatory
- **3D Rendering**: Uses raycasting to render a 3D view of a maze.
- **Texture Mapping**: Different wall textures for North, South, East, and West facing walls.
- **Color Customization**: distinct colors for the floor and ceiling.
- **Movement**: Smooth movement (W, A, S, D) and rotation (Left/Right arrows).
- **Map Parsing**: Reads a scene description file (`.cub`) to generate the map.
- **Error Handling**: Validates the map file and configuration, exiting cleanly on errors.

### Bonus (If implemented)
- **Minimap**: A classic 2D view of the maze.
- **Wall Collisions**: Prevents the player from walking through walls.

## 🛠️ Build & Installation

### Requirements
- Linux or macOS system.
- `make`, `gcc`.
- `X11` libraries (for Linux): `libx11-dev`, `libxext-dev`.
- `math` library (usually included).

### Compiling
To compile the project, run:

```bash
make
```

This will generate the executable `cub3D`.

Other make commands:
- `make clean`: Removes object files.
- `make fclean`: Removes object files and the executable.
- `make re`: Recompiles the project from scratch.

## 🚀 Usage

Run the program with a valid `.cub` map file:

```bash
./cub3D maps/valid/subject_map.cub
```

### Controls

| Key | Action |
| :--- | :--- |
| **W** | Move Forward |
| **S** | Move Backward |
| **A** | Strafe Left |
| **D** | Strafe Right |
| **←** | Rotate Left |
| **→** | Rotate Right |
| **ESC** | Quit Game |
| **Close Window** | Quit Game |

## 🗺️ Map Configuration

The `.cub` file format specifies the scene configuration.

### Elements
The file must contain the following elements (in any order, before the map):
- **Textures**: `NO`, `SO`, `WE`, `EA` followed by the texture path.
- **Colors**: `F` (Floor), `C` (Ceiling) followed by RGB values (0-255).

Example:
```
NO ./assets/textures/north.xpm
SO ./assets/textures/south.xpm
WE ./assets/textures/west.xpm
EA ./assets/textures/east.xpm

F 220,100,0
C 225,30,0
```

### Map Layout
The map is defined by:
- `0`: Empty space.
- `1`: Wall.
- `N`, `S`, `E`, `W`: Player start position and orientation.

The map must be closed/surrounded by walls.

Example:
```
111111
100101
101001
1100N1
111111
```

## 📸 Screenshots

screenshots are comming soon !

---
*Created by papacolas for 42 School.*
Do not use this repo for your cursus !

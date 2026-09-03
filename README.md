A small mouse accuracy/aim trainer built in Lua using the [LÖVE2D](https://love2d.org/) framework.\
Inspired by aim trainers like Aimlabs, this was built for practice and to get more comfortable with Lua and LÖVE2D.

<img width="1025" height="801" alt="image" src="https://github.com/user-attachments/assets/9f33f1a7-f080-4cf5-bbbc-2ba592d8c039" />

## Modes

- **Reactivity** - A red circle appears at a random position and turns green when hovered. Clicking it spawns a new circle elsewhere and records your reaction time. Best time is tracked and displayed.
- **Tracking 1** - The circle moves continuously in random directions; keep your cursor on it (it turns green while hovered).
- **Tracking 2** - The circle moves back and forth linearly between the edges of the window. A simple tracking exercise.

## Controls

| Key | Action |
|-----|--------|
| `M` | Switch mode (Reactivity / Tracking 1 / Tracking 2) |
| `SPACE` | Cycle circle size (small / medium / large) |
| `Q` | Quit |

Current mouse coordinates are shown in the top-right corner. The window is resizable (minimum 1024×768).

## Running it

Requires [LÖVE2D](https://love2d.org/) installed.

```bash
love .
```

## Built with

Lua, LÖVE2D, ZeroBrane Studio

## Ideas for later

- Hover-time stopwatch + best time for Tracking 1
- Score history or session stats

# mplay

Command-Line Music Player

## Usage

```sh
mplay </path/to/music/file>
```

## Building

Requires SDL2 and SDL2\_mixer
Zig version: 0.15.0-dev.471+369177f0b

```sh
zig build -Doptimize=ReleaseFast
```

### Installation

```sh
sudo install -Dm755 ./zig-out/bin/mplay /usr/bin/
```


# mplay
Command Line Music Player


## Usage
```sh
mplay </path/to/music/file>
```

## Building
Requires SDL2 and SDL2_mixer
And zig version is 0.15.0-dev.471+369177f0b

```sh
zig build -Doptimize=ReleaseFast
```
### install
```sh
sudo install -Dm755 ./zig-out/bin/mplay /usr/bin/
```




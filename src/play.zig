const std = @import("std");
const c = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_mixer.h");
});

pub fn play(path: []const u8) !void {
    const stderr = std.io.getStdErr().writer();

    if (c.SDL_Init(c.SDL_INIT_AUDIO) != 0) {
        try stderr.print("Failed to initialize SDL: {s}\n", .{c.SDL_GetError()});
        std.process.exit(1);
    }

    if (c.Mix_OpenAudio(44100, c.AUDIO_S16SYS, 2, 1024) == -1) {
        try stderr.print("Failed to Open Audio: {s}\n", .{c.SDL_GetError()});
        std.process.exit(1);
    }

    const music = c.Mix_LoadMUS(path.ptr);
    if (c.Mix_PlayMusic(music, 0) == -1) {
        try stderr.print("Failed to Play music: {s}\n", .{c.SDL_GetError()});
        std.process.exit(1);
    }

    while (c.Mix_PlayingMusic() != 0) {}

    c.Mix_FreeMusic(music);
    c.Mix_CloseAudio();
}

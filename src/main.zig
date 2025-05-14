const std = @import("std");
const play = @import("play.zig");

pub fn main() !void {
    const alc = std.heap.page_allocator;
    const stderr = std.io.getStdErr().writer();
    const args = try std.process.argsAlloc(alc);

    if (args.len == 1) {
        try stderr.print("Usage: {s} </path/to/music/file>\n", .{args[0]});
        std.process.exit(1);
    }

    for (args[1..]) |arg| {
        try play.play(arg);
    }
}

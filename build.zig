const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "mplay",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // libcをリンク
    exe.linkLibC();
 
    // SDL2をシステムライブラリとしてリンク
    exe.linkSystemLibrary("SDL2");

    // SDL_mixerをシステムライブラリとしてリンク
    exe.linkSystemLibrary("SDL2_mixer");

    // システムのデフォルトパスでSDL2とSDL_mixerを探す
    // 多くの場合、/usr/include/SDL2 や /usr/local/include/SDL2 が自動的に見つかります

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}


const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "stb_image",
        .target = target,
        .optimize = optimize,
    });

    lib.linkLibC();
    lib.addIncludePath(.{ .path = "include" });
    lib.addCSourceFile(.{ .file = .{ .path = "stb_image_impl.c" }, .flags = &.{} });

    b.installArtifact(lib);
    lib.installHeader("include/stb_image.h", "stb_image.h");
}

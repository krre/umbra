const std = @import("std");
const print = @import("print.zig");
const fmt = std.fmt;

pub fn create(io: std.Io, name: []const u8) !void {
    var dir: std.Io.Dir = try std.Io.Dir.cwd().openDir(io, ".", .{ .iterate = true });
    defer dir.close(io);

    try dir.createDir(io, name, std.Io.File.Permissions.default_dir);
    const app_dir = try dir.openDir(io, name, .{ .iterate = true });

    const file = try app_dir.createFile(io, "app.umbra", .{ .read = true, .truncate = true });
    defer file.close(io);

    try file.writeStreamingAll(io, "@app");

    print.printlnf("init source `{s}`", .{name});
}

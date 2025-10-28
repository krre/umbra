const std = @import("std");
const print = @import("print.zig");
const fmt = std.fmt;

pub fn create(name: []u8) !void {
    const cwd = std.fs.cwd();
    try cwd.makeDir(name);
    const dir = try cwd.openDir(name, .{ .iterate = true });

    const file = try dir.createFile("app.umbra", .{ .read = true, .truncate = true });
    defer file.close();

    try file.writeAll("@app");

    print.printlnf("init source `{s}`", .{name});
}

const std = @import("std");
const source = @import("source.zig");

pub fn init(io: std.Io, name: []const u8) !void {
    try source.create(io, name);
}

pub fn build() !void {
    std.log.info("build", .{});
}

pub fn run() !void {
    std.log.info("run", .{});
}

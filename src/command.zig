const std = @import("std");
const print = @import("print.zig");
const source = @import("source.zig");

pub fn init(io: std.Io, name: []const u8) !void {
    try source.create(io, name);
}

pub fn build() !void {
    print.println("build");
}

pub fn run() !void {
    print.println("run");
}

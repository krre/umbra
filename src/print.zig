const std = @import("std");

pub inline fn print(msg: []const u8) void {
    std.debug.print("{s}", .{msg});
}

pub inline fn println(msg: []const u8) void {
    std.debug.print("{s}\n", .{msg});
}

pub inline fn printf(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt, args);
}

pub inline fn printlnf(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt ++ "\n", args);
}

const std = @import("std");
const umbra = @import("umbra");
const print = @import("print.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len == 1) {
        print.println("Umbra");
        return;
    }

    const command = args[1];

    if (std.mem.eql(u8, command, "init")) {
        print.println("init");
    } else if (std.mem.eql(u8, command, "build")) {
        print.println("build");
    } else if (std.mem.eql(u8, command, "run")) {
        print.println("run");
    } else {
        print.println("Unknown command");
    }
}

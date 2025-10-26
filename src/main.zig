const std = @import("std");
const umbra = @import("umbra");
const print = @import("print.zig");
const command = @import("command.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len == 1) {
        print.println("Umbra");
        return;
    }

    const command_name = args[1];

    if (std.mem.eql(u8, command_name, "init")) {
        try command.init();
    } else if (std.mem.eql(u8, command_name, "build")) {
        try command.build();
    } else if (std.mem.eql(u8, command_name, "run")) {
        try command.run();
    } else {
        print.println("Unknown command");
    }
}

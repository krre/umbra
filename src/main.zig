const std = @import("std");
const umbra = @import("umbra");
const print = @import("print.zig");
const command = @import("command.zig");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    const arena: std.mem.Allocator = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    if (args.len == 1) {
        print.printlnf("Umbra {s}", .{umbra.build_options.version});
        return;
    }

    const command_name = args[1];

    if (std.mem.eql(u8, command_name, "init")) {
        if (args.len < 3) {
            print.println("Project name is empty");
        } else {
            try command.init(io, args[2]);
        }
    } else if (std.mem.eql(u8, command_name, "build")) {
        try command.build();
    } else if (std.mem.eql(u8, command_name, "run")) {
        try command.run();
    } else {
        print.println("Unknown command");
    }
}

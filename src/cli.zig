const std = @import("std");
const build_options = @import("build_options");
const print = @import("print.zig");
const command = @import("command.zig");

pub fn run(io: std.Io, args: []const []const u8) !void {
    if (args.len == 0) {
        print.printlnf("Umbra {s}", .{build_options.version});
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

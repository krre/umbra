const std = @import("std");
const build_options = @import("build_options");
const print = @import("print.zig");
const command = @import("command.zig");
const fatal = std.process.fatal;

const usage =
    \\Usage: umbra [options] [file]
    \\
    \\Options:
    \\  -h, --help     Print help and exit
    \\  -v, --version  Print version information and exit
    \\
;

pub fn run(io: std.Io, args: []const []const u8) !void {
    if (args.len == 0) {
        print.print(usage);
        return;
    }

    const arg = args[0];

    if (std.mem.startsWith(u8, arg, "-")) {
        if (std.mem.eql(u8, arg, "-v") or std.mem.eql(u8, arg, "--version")) {
            print.printlnf("{s}", .{build_options.version});
            return;
        } else if (std.mem.eql(u8, arg, "-h") or std.mem.eql(u8, arg, "--help")) {
            print.print(usage);
            return;
        } else {
            fatal("unrecognized option: '{s}'", .{arg});
        }
    }

    const command_name = arg;

    if (std.mem.eql(u8, command_name, "init")) {
        if (args.len < 2) {
            print.println("Project name is empty");
        } else {
            try command.init(io, args[1]);
        }
    } else if (std.mem.eql(u8, command_name, "build")) {
        try command.build();
    } else if (std.mem.eql(u8, command_name, "run")) {
        try command.run();
    } else {
        print.println("Unknown command");
    }
}

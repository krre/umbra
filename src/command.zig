const print = @import("print.zig");
const source = @import("source.zig");

pub fn init(name: []u8) !void {
    try source.create(name);
}

pub fn build() !void {
    print.println("build");
}

pub fn run() !void {
    print.println("run");
}

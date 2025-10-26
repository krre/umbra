const print = @import("print.zig");

pub fn init(name: []u8) !void {
    print.printlnf("init project `{s}`", .{name});
}

pub fn build() !void {
    print.println("build");
}

pub fn run() !void {
    print.println("run");
}

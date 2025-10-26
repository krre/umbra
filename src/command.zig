const print = @import("print.zig");

pub fn init() !void {
    print.println("init");
}

pub fn build() !void {
    print.println("build");
}

pub fn run() !void {
    print.println("run");
}

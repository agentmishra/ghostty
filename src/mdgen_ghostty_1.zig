const std = @import("std");
const gen = @import("build/mdgen/mdgen.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const alloc = gpa.allocator();

    const writer = std.io.getStdOut().writer();
    try gen.substitute(alloc, @embedFile("build/mdgen/ghostty_1_header.md"), writer);
    try gen.genActions(writer);
    try gen.genConfig(writer, true);
    try gen.substitute(alloc, @embedFile("build/mdgen/ghostty_1_footer.md"), writer);
}
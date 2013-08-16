import gumbo.node, gumbo.capi, gumbo.parse;

import std.stdio;

string[] findLinks(Node node) {
    string[] links;

    if (node.type != Node.Type.ELEMENT) {
        return links;
    }

    Element element = cast(Element) node;

    if (element.tag == Element.Tag.A) {
        if(Attribute href = element.getAttribute("href")) {
            links ~= href.value;
        }
    }

    foreach(child; element.children) {
        links ~= findLinks(child);
    }

    return links;
}

void usage() {
    stderr.writeln("Usage: find_links <html filename>");
}

int main(string[] argv) {
    if (argv.length != 2) {
        usage();
        return 1;
    }

    string filename = argv[1];

    scope(failure) {
        stderr.writeln("Error: ", filename, " is not a file");
        usage();
        return 1;
    }

    gumbo.parse.Output output = gumbo.parse.Output.fromFile(filename);
    foreach(link; findLinks(output.root)) {
        writeln(link);
    }
    output.destroy();

    return 0;
}

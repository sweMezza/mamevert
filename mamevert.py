#!/usr/bin/env python3

import sys
import xml.sax

class MameFilter(xml.sax.ContentHandler):
    def __init__(self):
        self.current_machine = None

    def startElement(self, name, attrs):
        if name == 'machine':
            self.current_machine = attrs['name']
        elif name == 'display' and self.current_machine:
            if attrs.get('tag', '').startswith('screen') and attrs.get('rotate') in ['90', '270']:
                print(self.current_machine)

    def endElement(self, name):
        if name == 'machine':
            self.current_machine = None

if __name__ == "__main__":
    parser = xml.sax.make_parser()
    handler = MameFilter()
    parser.setContentHandler(handler)
    input_stream = open(sys.argv[1], 'r') if len(sys.argv) > 1 else sys.stdin
    parser.parse(input_stream)

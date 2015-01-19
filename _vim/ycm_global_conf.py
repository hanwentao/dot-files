# This configuration file is default for C++ source files.

flags = [
    '-x', 'c++',
    '-std=c++1y',
    '-stdlib=libc++',
    '-Wall',
    '-I.',
    '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
    '-isystem', '/usr/local/include',
    '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include',
    '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
    '-isystem', '/usr/include',
]

def FlagsForFile(filename, **kwargs):
    return {'flags': flags, 'do_cache': True}

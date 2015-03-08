# atom-te

Universal test running either synchronously or asynchronously. Atom interface to [te](https://github.com/jetaggart/te). Only asynchronous running is supported.

# Supported Frameworks:
* rspec
* minitest


# Installation

The `te` executable must be on your PATH. Please visit [te](https://github.com/jetaggart/te) and follow the instructions there.

Install the using atom.


## Usage

`ctrl-c f` or `ctrl-c ctrl-f` => `atom-te:runFile`
`ctrl-c l` or `ctrl-c ctrl-l` => `atom-te:runLine`
`ctrl-c a` or `ctrl-c ctrl-a` => `atom-te:runAll`
`ctrl-c l` or `ctrl-c ctrl-l` => `atom-te:runLast`

You cannot run synchronously right now. Please use `te listen`

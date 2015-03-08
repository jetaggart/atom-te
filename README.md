# atom-te

Universal test running either synchronously or asynchronously. Atom interface to [te](https://github.com/jetaggart/te). Only asynchronous running is supported.

# Supported Frameworks:
* rspec
* minitest


# Installation

The `te` executable must be on your PATH. Please visit [te](https://github.com/jetaggart/te) and follow the instructions there.

Install with atom package manager: `apm install te`.


## Usage

| Keybinding | Alternate | Command |
|:----------:|:---------:|:-------:|
| ctrl-c f | ctrl-c ctrl-f | atom-te:runFile |
| ctrl-c l | ctrl-c ctrl-l | atom-te:runLine |
| ctrl-c a | ctrl-c ctrl-a | atom-te:runAll |
| ctrl-c c | ctrl-c ctrl-c | atom-te:runLast |


You cannot run synchronously right now. Please use `te listen`

# Autovenv
This little script is yet another implementation of a "autovenv" tool. Aka. a tool used to automatically activate and deactivate virtual environments for python.

I made it to fit my personal needs and preferences. it is intended to be lightweight and not overly complicated. I wanted to *manually* control where autovenv becomes active and where not and also avoid determining virtual environments automatically.

# How it works
In essence it is just a wrapper around the shell built-in command `cd`. Whenever `cd` is called, starting from the target directory the directory is recursively searched for a `.autovenv` file. If a `.autovenv` file is found, the corresponding virtual environment is activated.

# Usage
## Installation
To install `autovenv` simply clone the repo, or download `autovenv.sh`. To activate autovenv you have to source autovenv. To have it permanently active you can add the following to your `.bashrc` and you're done.

```
source ~/path/to/autovenv.sh
```
## Activate autovenv
TODO

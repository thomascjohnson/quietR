# quietR

[![Travis build status](https://travis-ci.org/thomascjohnson/quietR.svg?branch=master)](https://travis-ci.org/thomascjohnson/quietR)

## Overview

quietR is an extremely simple package that masks the `print`, `cat` and `message` functions to allow them to be toggled with a consistent set of functions so that you don't have to write your own verbose handling logic in your code.

## Example

The principle of this package is extremely simple. Allow console output functions to be suppressed in a simplistic way so that it isn't necessary to implement logic throughout a package. Consider the following example:

```
library(quietR)

# You can see all of these:
print("Hello!")
message("Oi!")
cat("¡Hola!\n")

disable_verbose()
# Now you can't see these:
print("Hi")
message("Olá!")
cat("¡Aló!\n")

enable_verbose("print")
# Outputs
print("Hi there!") 
 # Doesn't output
cat("I won't output")```

## Getting Help/Helping

If you need help, send me an email or create an issue. If you have a better idea for how to do this, feel free to send a pull request or create an issue.
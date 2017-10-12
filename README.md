# Uhlarm

Do you have a long-running script and want to get other things done but want to know exactly when your script finishes? Then Uhlarm is the package for you!

The `@uhlarm` macro encourages good programming by playing an affirming sound when the expression completes without error and a disparaging sound when it encounters an uncaught exception :P.

## Installation

In Julia:
```julia
Pkg.clone("https://github.com/zsunberg/Uhlarm.jl")
```

## Examples

```julia
@uhlarm sleep(1.0)
```
plays a good sound;

```julia
@uhlarm begin
    sleep(1.0)
    error("the foos weren't properly barred")
end
```
plays a bad sound.

## Custom sounds

The default sounds are clips from Top Gun, Star Wars, and other movies I like. You can add your own sounds to the `sounds/good` or `sounds/bad` directories (the full paths on your machine can be found by running `Pkg.dir("Uhlarm","sounds")` in Julia). The sounds must be compatible with [LibSndFile.jl](https://github.com/JuliaAudio/LibSndFile.jl) to work.

## Bash script

If you like this package and want a shell script that does not require Julia, use [smake](https://github.com/zsunberg/smake/tree/master).

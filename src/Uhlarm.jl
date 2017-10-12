module Uhlarm

using PortAudio
using LibSndFile

export @uhlarm

const SOUNDPATH = joinpath(dirname(@__FILE__()), "..", "sounds")
const SPEAKERS = PortAudioStream()

macro uhlarm(expr)
    quote
        output = try
            $(esc(expr))
        catch ex
            playrand("bad")
            rethrow(ex)
        end
        playrand("good")
        return output
    end
end

function playrand(dir="good")
    absdir = joinpath(SOUNDPATH, dir)
    files = readdir(absdir)
    path = joinpath(absdir, rand(files))
    write(SPEAKERS, load(path))
end



end # module

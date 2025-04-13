JULIA_PREFIX = abspath(joinpath(Base.source_path(), "..", "..", ".."))

if !("JULIA_PKGDIR" in keys(ENV))
    ENV["JULIA_PKGDIR"] = joinpath(JULIA_PREFIX, "share", "julia", "site")
    pushfirst!(Base.LOAD_PATH, joinpath(ENV["JULIA_PKGDIR"], "lib", string("v", join(split(string(VERSION), ".")[1:2], "."))) )
    pushfirst!(Base.DEPOT_PATH, ENV["JULIA_PKGDIR"])
end

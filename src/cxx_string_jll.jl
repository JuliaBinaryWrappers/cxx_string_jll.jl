module cxx_string_jll
using Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl

platforms = Platform[
    Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    FreeBSD(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Windows(:i686, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Windows(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:aarch64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Windows(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:aarch64, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:powerpc64le, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    MacOS(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:i686, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    FreeBSD(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:i686, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:aarch64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:i686, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Windows(:i686, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    Linux(:powerpc64le, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:i686, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:x86_64, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:aarch64, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
    Linux(:x86_64, libc=:musl, compiler_abi=CompilerABI(cxxstring_abi=:cxx11)),
    MacOS(:x86_64, compiler_abi=CompilerABI(cxxstring_abi=:cxx03)),
]

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Load the appropriate wrappers
include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))

end  # module cxx_string_jll

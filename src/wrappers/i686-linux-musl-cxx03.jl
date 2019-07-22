# Autogenerated wrapper script for cxx_string_jll for i686-linux-musl-cxx03
export libcxx_string

## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libcxx_string`
const libcxx_string_splitpath = ["lib", "libcxx_string.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcxx_string_path = ""

# libcxx_string-specific global declaration
# This will be filled out by __init__()
libcxx_string_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcxx_string = "libcxx_string.so"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    global libcxx_string_path = abspath(joinpath(artifact"cxx_string", libcxx_string_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcxx_string_handle = dlopen(libcxx_string_path)
    push!(LIBPATH_list, dirname(libcxx_string_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()


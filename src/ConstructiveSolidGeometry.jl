module ConstructiveSolidGeometry

include("types.jl")
include("util.jl")
include("ray_trace.jl")
include("region_operators.jl")
include("cell_utils.jl")
include("plotting.jl")

export Coord
export Ray
export Surface
export Plane
export Cone
export Sphere
export InfCylinder
export Box
export Region
export Cell
export Geometry
export +,-,*,^,|,~
export reflect
export generate_random_ray
export raytrace
export find_intersection
export halfspace
export is_in_cell
export find_cell_id
export plot_geometry_2D
export plot_cell_2D
export dot
export magnitude
export unitize
export cross

using Plots

end # module

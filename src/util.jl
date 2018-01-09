import Base: +, -, *, ^, |, ~, dot, cross
+(a::Coord, b::Coord)     = Coord(a.x+b.x, a.y+b.y, a.z+b.z)
-(a::Coord, b::Coord)     = Coord(a.x-b.x, a.y-b.y, a.z-b.z)
*(a::Float64, b::Coord)   = Coord(a*b.x, a*b.y, a*b.z)
*(b::Coord, a::Float64,)  = Coord(a*b.x, a*b.y, a*b.z)
*(a::Int, b::Coord)       = Coord(a*b.x, a*b.y, a*b.z)
*(b::Coord, a::Int)       = Coord(a*b.x, a*b.y, a*b.z)
dot(a::Coord, b::Coord)   = (a.x*b.x + a.y*b.y + a.z*b.z)
"""
    magnitude(a::Coord)

A utility function to determine the magnitude of a `Coord` object. Typical use case is to subtract two Coord objects and check the resulting Coord object's magnitude to determine the distance between the two Coords.
"""
magnitude(a::Coord)       = sqrt(dot(a,a))
"""
    unitize(a::Coord)

A utility function to unitize a `Coord`
"""
unitize(a::Coord)         = (1. / magnitude(a) * a)
cross(a::Coord, b::Coord) = Coord(a.y*b.z - a.z*b.y, a.z*b.x - a.x*b.z, a.x*b.y - a.y*b.x)

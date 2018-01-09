# The halfpsace functions are private methods, and all take a coordinate and a surface to determine which halfspace the coordinate is in.

# Plane halfspace determination
function halfspace(c::Coord, plane::Plane)
    d::Float64 = -dot(plane.normal, plane.point)
    half::Float64 = dot(plane.normal, c) + d
    if half <= 0
        return -1
    else
        return 1
    end
end

# Cone halfspace determination
function halfspace(c::Coord, cone::Cone)
	p_minus_c::Coord = c - cone.tip
    half::Float64 = dot(p_minus_c,cone.axis)^2 - dot(p_minus_c,p_minus_c) * (cos(cone.theta))^2
    if half <= 0
        return -1
    else
        return 1
    end
end

# Sphere halfspace determination
function halfspace(c::Coord, sphere::Sphere)
    half::Float64 = (c.x - sphere.center.x)^2 + (c.y - sphere.center.y)^2 + (c.z - sphere.center.z)^2 - sphere.radius^2
    if half <= 0
        return -1
    else
        return 1
    end
end

# Infinite cylinder halfspace
function halfspace(c::Coord, cyl::InfCylinder)
    tmp::Coord = cross((c-cyl.center), cyl.normal)
    half::Float64 = dot(tmp, tmp) - cyl.radius^2
    if half <= 0
        return -1
    else
        return 1
    end
end


function ^(a::Region, b::Region)
    if halfspace(_p, a.surface) == a.halfspace
        if halfspace(_p, b.surface) == b.halfspace
            return true
        end
    end
    return false
end

function ^(a::Region, b::Bool)
    if halfspace(_p, a.surface) == a.halfspace
        if b == true
            return true
        end
    end
    return false
end

function ^(b::Bool, a::Region)
    if halfspace(_p, a.surface) == a.halfspace
        if b == true
            return true
        end
    end
    return false
end

function |(a::Region, b::Region)
    if halfspace(_p, a.surface) == a.halfspace
        return true
    end
    if halfspace(_p, b.surface) == b.halfspace
        return true
    end
    return false
end

function |(a::Region, b::Bool)
    if halfspace(_p, a.surface) == a.halfspace
        return true
    end
    if b == true
        return true
    end
    return false
end

function |(b::Bool, a::Region)
    if halfspace(_p, a.surface) == a.halfspace
        return true
    end
    if b == true
        return true
    end
    return false
end

function ~(a::Region)
    b::Region = Region(a.surface, a.halfspace)
    if a.halfspace == -1
        b.halfspace = 1
    else
        b.halfspace = -1
    end
    return b
end

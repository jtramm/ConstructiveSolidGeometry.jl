# Ray - 3D Plane Intersection
# Returns: hit, distance
# hit: a boolean indicating if an intersection occurred
# distance: the distance to intersection
# Edge case policies:
#    1. Ray is inside the plane: Returns (true, NaN)
#    2. Ray is parallel to the plan, but not inside: Returns (false, NaN)
#    3. Ray never hits plane: Returns (false, NaN)
"""
    function raytrace(ray::Ray, surface::Surface)

Determines if a `Ray` and a `Surface` intersect, and the distance to that intersection.

# Returns
* `Bool`: Indicates if the ray intersects the surface or not
* `Float64`: The distance between the ray's origin and the point of intersection
"""
function raytrace(ray::Ray, plane::Plane)
    dist::Float64 = dot( plane.point - ray.origin, plane.normal) / dot( ray.direction, plane.normal)
    # Check if parallel
    if dist < 0 || dist == Inf
        return false, NaN
    end
    return true, dist
end

# Ray - 3D Cone Intersection
# Returns hit, distance
# hit: a boolean indicating if an intersection occurred (false if parallel or negative)
# dist: distance to closest intersection point
function raytrace(ray::Ray, cone::Cone)

	cos_theta_squared::Float64 = (cos(cone.theta))^2
	CO::Coord = ray.origin - cone.tip

	a::Float64 = dot(ray.direction, cone.axis)^2 - cos_theta_squared
	b::Float64 = 2.0 * (dot(ray.direction, cone.axis) * dot(CO, cone.axis) - dot(ray.direction, CO) * cos_theta_squared)
	c::Float64 = dot(CO, cone.axis)^2 - dot(CO, CO) * cos_theta_squared

	determinant::Float64 = b^2 - 4.0*a*c

	if determinant < 0
		return false, NaN
	elseif determinant == 0
		return true, -b/(2*a)
	end

	# Now we need to verify we are not intersecting with the shadow cone
	one_over_two_a::Float64 = 1.0 / (2.0 * a)
	t1::Float64 = (-b - sqrt(determinant)) * one_over_two_a
	t2::Float64 = (-b + sqrt(determinant)) * one_over_two_a

	p1::Coord = ray.origin + ray.direction * t1
	p2::Coord = ray.origin + ray.direction * t2

	valid1::Bool = false
	valid2::Bool = false

	# Check against shadow cone & ensure intersection is in front of ray
	if t1 >= 0 && dot((p1-cone.tip),cone.axis) > 0
		valid1 = true
	end
	if t2 >= 0 && dot((p2-cone.tip),cone.axis) > 0
		valid2 = true
	end

	# If both points hit real cone, return closer one
	if valid1 && valid2
		if t1 < t2
			return true, t1
		else
			return true, t2
		end
	end

	if valid1 && !valid2
		return true, t1
	end

	if !valid1 && valid2
		return true, t2
	end

	return false, NaN
end

# Ray - 3D Sphere Intersection
# Returns hit, distance
# hit: a boolean indicating if an intersection occurred (false if parallel or negative)
# dist: distance to closest intersection point
function raytrace(ray::Ray, sphere::Sphere)
    d::Coord = ray.origin - sphere.center
    t::Float64 = -dot(ray.direction, d)
    discriminant::Float64 = t^2
    discriminant -= magnitude(d)^2
    discriminant += sphere.radius^2

    # If the discriminant is less than zero, they don't hit
    if discriminant < 0
        return false, Inf
    end
    sqrt_val::Float64 = sqrt(discriminant)
    pos::Float64 = t - sqrt_val
    neg::Float64 = t + sqrt_val

    if pos < 0  && neg < 0
        return false, NaN
    end
    if pos < 0 && neg > 0
        return true, neg
    end
    if pos < neg && pos > 0
        return true, pos
    end

    return true, neg
end

# Ray - 3D Infinite Cylinder Intersection (works for cylinder direction)
# Returns hit, distance
# hit: a boolean indicating if an intersection occurred (false if parallel or negative)
# dist: distance to closest intersection point
function raytrace(ray::Ray, infcylinder::InfCylinder)
    A = infcylinder.center
    # Generate point new point in cylinder for math
    B = infcylinder.center + infcylinder.normal
    O = ray.origin
    r = infcylinder.radius
    AB = B - A
    AO = O - A
    AOxAB = cross(AO, AB)
    VxAB = cross(ray.direction, AB)
    ab2::Float64 = dot(AB, AB)
    a::Float64 = dot(VxAB, VxAB)
    b::Float64 = 2.0 * dot(VxAB, AOxAB)
    c::Float64 = dot(AOxAB, AOxAB) - (r*r * ab2)

    # Check Determininant
    det::Float64 = b^2 - 4.0 * a * c
    if det < 0
        return false, Inf
    end

    pos::Float64 = (-b + sqrt(det)) / (2.0 * a)
    neg::Float64 = (-b - sqrt(det)) / (2.0 * a)

    if pos < 0
        if neg < 0
            return false, NaN
        end
        return true, neg
    end
    if neg < 0
        return true, pos
    end
    if pos < neg
        return true, pos
    else
        return true, neg
    end
end

"""
    reflect(ray::Ray, plane::Plane)

Reflects a ray off a plane.

# Return
* `Ray`: A new ray with the same origin as input, but with the new reflected direction
"""
function reflect(ray::Ray, plane::Plane)
    a = dot(ray.direction, plane.normal)
    b = plane.normal * (2.0 * a)
    c = ray.direction - b
    reflected_ray::Ray = Ray(ray.origin, c)
    return reflected_ray
end

"""
    generate_random_ray(box::Box)

Returns a randomly sampled ray from within an axis aligned bounding box.
"""
function generate_random_ray(box::Box)
    ray = Ray(Coord(0.0, 0.0, 0.0), Coord(0.0, 0.0, 0.0))

    # Sample Origin
    width = Coord(box.upper_right.x - box.lower_left.x, box.upper_right.y - box.lower_left.y, box.upper_right.z - box.lower_left.z)
    ray.origin.x = box.lower_left.x + rand(Float64)*width.x
    ray.origin.y = box.lower_left.y + rand(Float64)*width.y
    ray.origin.z = box.lower_left.z + rand(Float64)*width.z

    # Sample Direction From Sphere
    theta::Float64 = rand(Float64) * 2.0 * pi
    z::Float64 = -1.0 + 2.0 * rand(Float64)
    zo::Float64 = sqrt(1.0 - z*z)
    ray.direction.x = zo * cos(theta);
    ray.direction.y = zo * sin(theta);
    ray.direction.z = z;

    # Normalize Direction
    ray.direction = unitize(ray.direction)

    return ray
end

"""
    find_intersection(ray::Ray, regions::Array{Region})

Performs ray tracing on an array of regions.

# Return
* `Ray`: A new Ray that has been moved just accross the point of intersection.
* `Int64`: The surface id that was hit.
* `String`: The boundary condition of the surface that was hit.
"""
function find_intersection(ray::Ray, regions::Array{Region})
    BUMP::Float64 = 1.0e-9
    min::Float64 = 1e30
    id::Int64 = -1
    for i = 1:length(regions)
        hit, dist = raytrace(ray, regions[i].surface)
        if hit == true
            if dist < min
                min = dist
                id = i
            end
        end
    end

    new_ray::Ray = Ray(ray.origin + ray.direction * (min + BUMP), ray.direction)

    if regions[id].surface.reflective == true
        new_ray = reflect(new_ray, regions[id].surface)
        new_ray.origin = new_ray.origin + new_ray.direction * (2.0 * BUMP)
		return new_ray, id, "reflective"
    end

	if regions[id].surface.vacuum == true
		return new_ray, id, "vacuum"
    end

    return new_ray, id, "transmission"

end

"""
    find_intersection(ray::Ray, geometry::Geometry)

Performs ray tracing on a Geometry

# Return
* `Ray`: A new Ray that has been moved just accross the point of intersection.
* `Int64`: The surface id that was hit.
* `String`: The boundary condition of the surface that was hit.
"""
function find_intersection(ray::Ray, geometry::Geometry)
	cell_id = find_cell_id(ray.origin, geometry)
	regions::Array{Region} = geometry.cells[cell_id].regions
	return find_intersection(ray, regions)
end

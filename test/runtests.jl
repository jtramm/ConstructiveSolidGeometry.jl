using ConstructiveSolidGeometry
using Base.Test

# Unit tests for ray <-> plane intersection

# Parallel
test_ray = Ray(Coord(0.0, 0.0, 0.0), Coord(0.0, 1.0, 0.0) )
test_plane = Plane(Coord(1.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0))
@test raytrace(test_ray, test_plane)[1] == false

# Hit
test_ray = Ray(Coord(0.0, 0.0, 0.0), unitize(Coord(1.0, 1.0, 0.0)) )
test_plane = Plane(Coord(1.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0))
@test raytrace(test_ray, test_plane) == (true, sqrt(2))

# Miss
test_ray = Ray(Coord(0.0, 0.0, 0.0), unitize(Coord(-1.0, -1.0, 0.0)) )
test_plane = Plane(Coord(1.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0))
@test raytrace(test_ray, test_plane)[1] == false

# Inside Plane
test_ray = Ray(Coord(0.0, 0.0, 0.0), Coord(0.0, 1.0, 0.0) )
test_plane = Plane(Coord(0.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0))
@test raytrace(test_ray, test_plane)[1] == true

# Unit tests for ray <-> sphere intersection

# Hit from outside
test_ray = Ray(Coord(-2.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test raytrace(test_ray, test_sphere) == (true, 1.0)

# Hit from inside (backwards is closer)
test_ray = Ray(Coord(-0.9, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test raytrace(test_ray, test_sphere) == (true, 1.9)

# Hit from inside (backwards is farther)
test_ray = Ray(Coord(-0.5, 0.0, 0.0), Coord(-1.0, 0.0, 0.0) )
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test raytrace(test_ray, test_sphere) == (true, 0.5)

# Miss from outside
test_ray = Ray(Coord(-2.0, 0.0, 0.0), Coord(-1.0, 0.0, 0.0) )
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test raytrace(test_ray, test_sphere)[1] == false

# Ray origin is on sphere
test_ray = Ray(Coord(-1.0, 0.0, 0.0), Coord(0.0, 1.0, 0.0) )
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test raytrace(test_ray, test_sphere) == (true, 0.0)


# Unit tests for ray <-> Cone intersection

# Hit from inside
test_ray = Ray(Coord(0.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 1.0

# Hit from inside
test_ray = Ray(Coord(-0.5, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 1.5

# Hit from outside
test_ray = Ray(Coord(-5.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 4.0

# Hit at angle from outside
test_ray = Ray(Coord(-5.0, 1.0, 1.0), unitize(Coord(1.0, 0.0, -1.0)) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.1, -1.0)), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 3.5511721769144815

# Hit at 45 at angle from outside, for rotated cylinder
test_ray = Ray(Coord(1.0, 1.0, 2.0), unitize(Coord(1.0, 1.0, 0.0)) )
test_cone = Cone(Coord(1.0, 1.0, 1.0), unitize(Coord(1.0, 1.0, 0.0)), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 1.0

# Hit of shadow of cone
test_ray = Ray(Coord(0.0, 0.0, 2.0), Coord(1.0, 0.0, 0.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == false

# Valid hit after shadow of cone
test_ray = Ray(Coord(0.5, 0.0, 2.0), Coord(0.0, 0.0, -1.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 1.5

# Valid hit before shadow of cone
test_ray = Ray(Coord(0.5, 0.0, 0.0), Coord(0.0, 0.0, 1.0) )
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0), pi/4.0 )
@test raytrace(test_ray, test_cone)[1] == true
@test raytrace(test_ray, test_cone)[2] ≈ 0.5



# Unit tests for ray <-> Infinite Cylinder intersection
# Z Cylinder Tests

test_cylinder = InfCylinder(Coord(-2.0, 0.0, 0.0), Coord(0.0, 0.0, 1.0), 1.0)

# Hit from outside
test_ray = Ray(Coord(0, 0.0, 0.0), Coord(-1.0, 0.0, 0.0) )
@test raytrace(test_ray, test_cylinder) == (true, 1.0)

# Hit from inside (backwards is closer)
test_ray = Ray(Coord(-1.5, 0.0, 0.0), Coord(-1.0, 0.0, 0.0) )
@test raytrace(test_ray, test_cylinder) == (true, 1.5)

# Hit from inside (forwards is closer)
test_ray = Ray(Coord(-2.5, 0.0, 0.0), Coord(-1.0, 0.0, 0.0) )
@test raytrace(test_ray, test_cylinder) == (true, 0.5)

# Miss from outside
test_ray = Ray(Coord(0.0, 2.5, 0.0), Coord(-1.0, 0.0, 0.0) )
@test raytrace(test_ray, test_cylinder)[1] == false

# Tilted Cylinder tests
test_cylinder = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(1.0, 0.0, 1.0)), 1.0)

# Hit from outside
test_ray = Ray(Coord(-2.0, 0.0, 2.0), unitize(Coord(1.0, 0.0, -1.0)) )
@test raytrace(test_ray, test_cylinder)[1] == true
@test raytrace(test_ray, test_cylinder)[2] ≈ sqrt(8)-1.0

# Hit from inside (backwards is closer)
test_ray = Ray(Coord(-.5, 0.0, 0.5), unitize(Coord(1.0, 0.0, -1.0)) )
@test raytrace(test_ray, test_cylinder)[1] == true
@test raytrace(test_ray, test_cylinder)[2] ≈ sqrt(0.5^2+0.5^2) + 1

# Hit from inside (forwards is closer)
test_ray = Ray(Coord(0.5, 0.0, -.5), unitize(Coord(1.0, 0.0, -1.0)) )
@test raytrace(test_ray, test_cylinder)[2] ≈ 1 - sqrt(0.5^2+0.5^2)

# Miss from outside
test_ray = Ray(Coord(0.0, 2.5, 0.0), Coord(-1.0, 0.0, 0.0) )
@test raytrace(test_ray, test_cylinder)[1] == false


# Reflection testing
test_plane = Plane(Coord(1, 0, 0), Coord(-1, 0, 0), "reflective")

# Straight on
test_ray = Ray(Coord(0, 0, 0), Coord(1, 0, 0))
@test reflect(test_ray, test_plane).direction.x ≈ -1.0
@test reflect(test_ray, test_plane).direction.y ≈ 0.0
@test reflect(test_ray, test_plane).direction.z ≈ 0.0

# 45 degree angle
test_ray = Ray(Coord(0, 0, 0), unitize(Coord(1, 1, 0)))
@test reflect(test_ray, test_plane).direction.x ≈ -1.0/sqrt(2.0)
@test reflect(test_ray, test_plane).direction.y ≈ 1.0/sqrt(2.0)
@test reflect(test_ray, test_plane).direction.z ≈ 0.0

# 45 degree plane
test_plane = Plane(Coord(1, 1, 0), unitize(Coord(-1, -1, 0)), "reflective")

# Straight on
test_ray = Ray(Coord(0, 0, 0), unitize(Coord(1, 1, 0)))
@test reflect(test_ray, test_plane).direction.x ≈ -1.0/sqrt(2.0)
@test reflect(test_ray, test_plane).direction.y ≈ -1.0/sqrt(2.0)
@test reflect(test_ray, test_plane).direction.z ≈ 0.0

# At an angle
test_ray = Ray(Coord(0, 0, 0), Coord(1, 0, 0))
@test reflect(test_ray, test_plane).direction.x <= 1e-10
@test reflect(test_ray, test_plane).direction.y ≈ -1.0
@test reflect(test_ray, test_plane).direction.z ≈ 0.0

# Test plane halfspace

# Point is below a z-plane with normal pointing up
test_coord = Coord(0.0, 0.0, 0.0)
test_plane = Plane(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.0, 1.0)))
@test halfspace(test_coord, test_plane) == -1

# Point is below a z-plane with normal pointing down
test_coord = Coord(0.0, 0.0, 0.0)
test_plane = Plane(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.0, -1.0)))
@test halfspace(test_coord, test_plane) == 1

# Point is above a z-plane with normal pointing up
test_coord = Coord(0.0, 0.0, 2.0)
test_plane = Plane(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.0, 1.0)))
@test halfspace(test_coord, test_plane) == 1

# Point is above a z-plane with normal pointing down
test_coord = Coord(0.0, 0.0, 2.0)
test_plane = Plane(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.0, -1.0)))
@test halfspace(test_coord, test_plane) == -1

# Point is on a z-plane
test_coord = Coord(0.0, 0.0, 1.0)
test_plane = Plane(Coord(0.0, 0.0, 1.0), unitize(Coord(0.0, 0.0, -1.0)))
@test halfspace(test_coord, test_plane) == -1

# Test sphere halfspace

# Point is inside a sphere
test_coord = Coord(-1.9, -1.9, -2.5)
test_sphere = Sphere(Coord(-2.0, -2.0, -2.0), 1.0)
@test halfspace(test_coord, test_sphere) == -1

# Point is outside a sphere
test_coord = Coord(-1.9, -1.9, -2.5)
test_sphere = Sphere(Coord(-2.0, -2.0, -2.0), 0.1)
@test halfspace(test_coord, test_sphere) == 1

# Point on a sphere
test_coord = Coord(1.0, 0.0, 0.0)
test_sphere = Sphere(Coord(0.0, 0.0, 0.0), 1.0)
@test halfspace(test_coord, test_sphere) == -1

# Test Cone halfspace

# Inside cone
test_coord = Coord(0.0, 0.0, 0.0)
test_cone = Cone(Coord(0.0, 0.0, 1.0), Coord(0.0, 0.0, -1.0),  pi/8.0)
@test halfspace(test_coord, test_cone) == 1

# outside cone
test_coord = Coord(5.0, 0.0, 0.0)
@test halfspace(test_coord, test_cone) == -1

# outside cone (but inside shadow)
#test_coord = Coord(0.0, 0.0, 2.0)
@test halfspace(test_coord, test_cone) == -1

# Inside rotated cylinder
test_coord = Coord(1.5, 1.5, 1.1)
test_cone = Cone(Coord(1.0, 1.0, 1.0), unitize(Coord(1.0, 1.0, 0.0)), pi/4.0 )
@test halfspace(test_coord, test_cone) == 1

# Outside rotated cylinder
test_coord = Coord(1.5, 1.5, 2.1)
test_cone = Cone(Coord(1.0, 1.0, 1.0), unitize(Coord(1.0, 1.0, 0.0)), pi/4.0 )
@test halfspace(test_coord, test_cone) == -1

# Test InfCylinder Halfspace

# Inside cylinder
test_coord = Coord(2.0, 2.0, 2.0)
test_cylinder = InfCylinder(Coord(1.9, 1.9, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 1.0)
@test halfspace(test_coord, test_cylinder) == -1

# Outside cylinder
test_coord = Coord(-2.0, 2.0, 2.0)
test_cylinder = InfCylinder(Coord(1.9, 1.9, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 1.0)
@test halfspace(test_coord, test_cylinder) == 1

# On cylinder
test_coord = Coord(2.9, 1.9, 10.0)
test_cylinder = InfCylinder(Coord(1.9, 1.9, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 1.0)
@test halfspace(test_coord, test_cylinder) == -1

# Bounding Box for the Problem
bounding_box = Box(Coord(-.63, -.63, -150), Coord(.63, .63, 150))

# Containers to store cells as we make them
cells = Array{Cell}(0)

# Define all the surfaces we will use up front
# Box
top = Plane(Coord(0.0, 0.0, 150.0), unitize(Coord(0.0, 0.0, 1.0)),   "reflective")
bot = Plane(Coord(0.0, 0.0, -150.0), unitize(Coord(0.0, 0.0, -1.0)), "reflective")
left = Plane(Coord(-.63, 0.0, 0.0), unitize(Coord(-1.0, 0.0, 0.0)),  "reflective")
right = Plane(Coord(0.63, 0.0, 0.0), unitize(Coord(1.0, 0.0, 0.0)),  "reflective")
up = Plane(Coord(0.0, 0.63, 0.0), unitize(Coord(0.0, 1.0, 0.0)),     "reflective")
down = Plane(Coord(0.0, -0.63, 0.0), unitize(Coord(0.0, -1.0, 0.0)), "reflective")
clad_outer = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4750)
clad_inner = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4180)
fuel = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4096)

# Make the Water Region
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(left, -1))
push!(regions, Region(right, -1))
push!(regions, Region(up, -1))
push!(regions, Region(down, -1))
push!(regions, Region(clad_outer, 1))

ex = :(1 ^ 2 ^ 3 ^ 4 ^ 5 ^ 6 ^ 7)

push!(cells, Cell(regions, ex))

# Make the Cladding
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(clad_outer, -1))
push!(regions, Region(clad_inner, 1))

ex = :(1 ^ 2 ^ 3 ^ 4)

push!(cells, Cell(regions, ex))

# Make the Gap
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(clad_inner, -1))
push!(regions, Region(fuel, 1))

ex = :(1 ^ 2 ^ 3 ^ 4)

push!(cells, Cell(regions, ex))

# Make the Fuel
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(fuel, -1))

ex = :(1 ^ 2 ^ 3)

push!(cells, Cell(regions, ex))

geometry = Geometry(cells, bounding_box)

# Some tests for our test geometry
@test find_cell_id(Coord(0.0,0.1,0), geometry) == 4
@test find_cell_id(Coord(0.0,0.41,0), geometry) == 3
@test find_cell_id(Coord(0.0,0.42,0), geometry) == 2
@test find_cell_id(Coord(0.0,0.55,0), geometry) == 1

# Some tests for weirder definitions
# Bounding Box for the Problem
bounding_box = Box(Coord(-.63, -.63, -150), Coord(.63, .63, 150))

# Containers to store cells as we make them
cells = Array{Cell}(0)

# Define all the surfaces we will use up front
# Box
top = Plane(Coord(0.0, 0.0, 150.0), unitize(Coord(0.0, 0.0, 1.0)), "reflective")
bot = Plane(Coord(0.0, 0.0, -150.0), unitize(Coord(0.0, 0.0, -1.0)), "reflective")
left = Plane(Coord(-.63, 0.0, 0.0), unitize(Coord(-1.0, 0.0, 0.0)), "reflective")
right = Plane(Coord(0.63, 0.0, 0.0), unitize(Coord(1.0, 0.0, 0.0)), "reflective")
up = Plane(Coord(0.0, 0.63, 0.0), unitize(Coord(0.0, 1.0, 0.0)), "reflective")
down = Plane(Coord(0.0, -0.63, 0.0), unitize(Coord(0.0, -1.0, 0.0)), "reflective")
left_cyl = InfCylinder(Coord(-0.175, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.3 )
right_cyl = InfCylinder(Coord(0.1, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.2)

# Make the outer Region
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(left, -1))
push!(regions, Region(right, -1))
push!(regions, Region(up, -1))
push!(regions, Region(down, -1))
push!(regions, Region(left_cyl, -1))
push!(regions, Region(right_cyl, -1))

ex = :(1 ^ 2 ^ 3 ^ 4 ^ 5 ^ (~(7 | 8)) ^ 6 )

push!(cells, Cell(regions, ex))

# Make the inner Region
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(left_cyl, -1))
push!(regions, Region(right_cyl, -1))

ex = :(1 ^ 2 ^ (3 | 4))

push!(cells, Cell(regions, ex))

geometry = Geometry(cells, bounding_box)

@test find_cell_id(Coord(0.41,0.0,0), geometry) == 1
@test find_cell_id(Coord(0.05,0.0,0), geometry) == 2

# Test random ray generation
ray = generate_random_ray(geometry.bounding_box)
@test ray.origin.x >= geometry.bounding_box.lower_left.x
@test ray.origin.y >= geometry.bounding_box.lower_left.y
@test ray.origin.z >= geometry.bounding_box.lower_left.z
@test ray.origin.x <= geometry.bounding_box.upper_right.x
@test ray.origin.y <= geometry.bounding_box.upper_right.y
@test ray.origin.z <= geometry.bounding_box.upper_right.z
ray2 = generate_random_ray(geometry.bounding_box)
@test ray.origin != ray2.origin
@test ray.direction != ray2.direction

# Test intersection routines
ray = Ray(Coord(0.0, 0.0, 0.0), Coord(1.0, 0.0, 0.0) )
new_ray, id, bc_type = find_intersection(ray, geometry)
@test new_ray.origin.x ≈ 0.125
@test new_ray.origin.y ≈ 0.0
@test new_ray.origin.z ≈ 0.0
@test new_ray.direction.x ≈ 1.0
@test new_ray.direction.y ≈ 0.0
@test new_ray.direction.z ≈ 0.0
@test id == 3
@test bc_type == "transmission"

println("Tests complete")

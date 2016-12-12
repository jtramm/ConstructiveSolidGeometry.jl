# In this example, we create a generic heterogeneous 3D pincell 
# that is commonly found in nuclear reactors
# with the following dimensions:
# Height = 300 cm
# Pitch = 1.26 cm
# Fuel Radius = 0.4096 cm
# Inner Clad Radius = 0.4180 cm
# Outer Clad Radius = 0.4750 cm

using ConstructiveSolidGeometry

##################################################################
# Create the Pincell
##################################################################

# Define a Bounding Box for the Problem
# The first coordinate is the lower left (min) corner
# The second coordinate is the upper right (max) corner
bounding_box = Box(Coord(-.63, -.63, -150), Coord(.63, .63, 150))

# Make an array to store cells as we make them
cells = Array{Cell}(0)

# Define all the surfaces we will use up front

# Box

# To make a plane, we define any point on the plane and its unit normal vector
# We also specify a boundary condition of "reflective", "vacuum", or "transmission"
# By default, if nothing is specified, "transmission" will be used
top =   Plane(Coord(0.0, 0.0, 150.0),  unitize(Coord(0.0, 0.0, 1.0)),  "reflective")
bot =   Plane(Coord(0.0, 0.0, -150.0), unitize(Coord(0.0, 0.0, -1.0)), "reflective")
left =  Plane(Coord(-.63, 0.0, 0.0),   unitize(Coord(-1.0, 0.0, 0.0)), "reflective")
right = Plane(Coord(0.63, 0.0, 0.0),   unitize(Coord(1.0, 0.0, 0.0)),  "reflective")
up =    Plane(Coord(0.0, 0.63, 0.0),   unitize(Coord(0.0, 1.0, 0.0)),  "reflective")
down =  Plane(Coord(0.0, -0.63, 0.0),  unitize(Coord(0.0, -1.0, 0.0)), "reflective")

# Define Fuel / Gap / Clad infinite cylinders
# A cylinder is defined by a point along the central axis, the axial direction unit vector, and a radius
# A boundary condition can also be specified similar to a plane, with "transmission" as default
clad_outer = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4750)
clad_inner = InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4180)
fuel =       InfCylinder(Coord(0.0, 0.0, 0.0), unitize(Coord(0.0, 0.0, 1.0)), 0.4096)

# Create each cell within the pincell using these surfaces

# Make the Water Cell

# Make an array to store the regions as we define them
regions = Array{Region}(0)

# Each "region" is defined as the halfspace of a surface
push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(left, -1))
push!(regions, Region(right, -1))
push!(regions, Region(up, -1))
push!(regions, Region(down, -1))
push!(regions, Region(clad_outer, 1))

# Define a Julia expression to define the logical space.
# Each number is a region index from the regions vector.
# ^ defines intersection, | defines union, and ~ defines complement
ex = :(1 ^ 2 ^ 3 ^ 4 ^ 5 ^ 6 ^ 7)

# Finally, create the water cell and push it into our cells vector
push!(cells, Cell(regions, ex))

# Make the Cladding Cell
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(clad_outer, -1))
push!(regions, Region(clad_inner, 1))

ex = :(1 ^ 2 ^ 3 ^ 4)

push!(cells, Cell(regions, ex))

# Make the Gap Cell
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(clad_inner, -1))
push!(regions, Region(fuel, 1))

ex = :(1 ^ 2 ^ 3 ^ 4)

push!(cells, Cell(regions, ex))

# Make the Fuel Cell
regions = Array{Region}(0)

push!(regions, Region(top, -1))
push!(regions, Region(bot, -1))
push!(regions, Region(fuel, -1))

ex = :(1 ^ 2 ^ 3)

push!(cells, Cell(regions, ex))

# Finally, we create a new Geometry object to store the problem we have created
geometry = Geometry(cells, bounding_box)

##################################################################
# Perform a single ray trace on the pincell
##################################################################

# Generate a new ray randomly inside the problem domain
ray = generate_random_ray(geometry.bounding_box)

# Perform a single step of ray tracing on the geometry
new_ray, id, boundary_type = find_intersection(ray, geometry)

# Compute distance travelled by the ray
distance = magnitude( new_ray.origin - ray.origin )

println("Ray moved ", distance, " [cm] before hitting a ", boundary_type, " boundary")

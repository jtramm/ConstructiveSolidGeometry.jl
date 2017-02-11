# ConstructiveSolidGeometry.jl Documentation

This is the full API for this package. A more thorough description of how to actually use the package can be found in the examples directory.

```@contents
```

## Types

```@docs
Coord
Surface
Ray
Plane
Sphere
InfCylinder
Cone
Box
Region
Cell
Geometry
```

## Functions

```@docs
magnitude
unitize
raytrace(ray::Ray, plane::Plane)
reflect(ray::Ray, plane::Plane)
generate_random_ray
find_intersection(ray::Ray, geometry::Geometry)
find_intersection(ray::Ray, regions::Array{Region})
is_in_cell
find_cell_id
plot_geometry_2D
plot_cell_2D
```

## Index

```@index
```

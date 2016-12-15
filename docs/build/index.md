
<a id='ConstructiveSolidGeometry.jl-Documentation-1'></a>

# ConstructiveSolidGeometry.jl Documentation


This is the full API for this package. A more thorough description of how to actually use the package can be found in the examples directory.

- [ConstructiveSolidGeometry.jl Documentation](index.md#ConstructiveSolidGeometry.jl-Documentation-1)
    - [Types](index.md#Types-1)
    - [Functions](index.md#Functions-1)
    - [Index](index.md#Index-1)


<a id='Types-1'></a>

## Types

<a id='ConstructiveSolidGeometry.Coord' href='#ConstructiveSolidGeometry.Coord'>#</a>
**`ConstructiveSolidGeometry.Coord`** &mdash; *Type*.



An {x,y,z} coordinate type. Used throughout the ConstructiveSolidGeometry.jl package for speed.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L30' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Surface' href='#ConstructiveSolidGeometry.Surface'>#</a>
**`ConstructiveSolidGeometry.Surface`** &mdash; *Type*.



An abstract class that all surfaces (Sphere, Plane, InfCylinder) inherit from. Implementation of new shapes should inherit from this


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L43' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Ray' href='#ConstructiveSolidGeometry.Ray'>#</a>
**`ConstructiveSolidGeometry.Ray`** &mdash; *Type*.



A ray is defined by its origin (Coord) and a unitized direction vector (Coord)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L37' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Plane' href='#ConstructiveSolidGeometry.Plane'>#</a>
**`ConstructiveSolidGeometry.Plane`** &mdash; *Type*.



A plane is defined by a point Coord on the surface of the plane, its unit normal vector Coord, and a boundary condition. Boundary conditions are transmission (default), reflective, and vacuum


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L46-L48' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Sphere' href='#ConstructiveSolidGeometry.Sphere'>#</a>
**`ConstructiveSolidGeometry.Sphere`** &mdash; *Type*.



A sphere is defined by its center Coord, its radius, and a boundary condition (transmission or vacuum)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L66' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.InfCylinder' href='#ConstructiveSolidGeometry.InfCylinder'>#</a>
**`ConstructiveSolidGeometry.InfCylinder`** &mdash; *Type*.



An Infinite Cylinder is defined by a Coord on its central axis, a unit direction vector Coord along its axis, its radius, and a boundary condition (transmission or vacuum)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L85' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Box' href='#ConstructiveSolidGeometry.Box'>#</a>
**`ConstructiveSolidGeometry.Box`** &mdash; *Type*.



A box is axis aligned and is defined by the minimum Coord and maximum Coord of the box


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L105' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Region' href='#ConstructiveSolidGeometry.Region'>#</a>
**`ConstructiveSolidGeometry.Region`** &mdash; *Type*.



Defined by a surface and a halfspace (+1 or -1)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L111' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Cell' href='#ConstructiveSolidGeometry.Cell'>#</a>
**`ConstructiveSolidGeometry.Cell`** &mdash; *Type*.



Defined by an array of Regions and a Julia expression indicating the logical combination of regions that define the cell


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L117' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Geometry' href='#ConstructiveSolidGeometry.Geometry'>#</a>
**`ConstructiveSolidGeometry.Geometry`** &mdash; *Type*.



The top level object that holds all the cells in the problem. This is used as input for the ray tracer


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L123' class='documenter-source'>source</a><br>


<a id='Functions-1'></a>

## Functions

<a id='ConstructiveSolidGeometry.magnitude' href='#ConstructiveSolidGeometry.magnitude'>#</a>
**`ConstructiveSolidGeometry.magnitude`** &mdash; *Function*.



A utility function to determine the magnitude of a Coord object. Typical use case is to subtract two Coord objects and check the resulting Coord object's magnitude to determine the distance between the two Coords.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L139' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.unitize' href='#ConstructiveSolidGeometry.unitize'>#</a>
**`ConstructiveSolidGeometry.unitize`** &mdash; *Function*.



A utility function to unitize a Coord object


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L141' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}' href='#ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}'>#</a>
**`ConstructiveSolidGeometry.raytrace`** &mdash; *Method*.



```
function raytrace(ray::Ray, surface::Surface)
```

Returns a tuple representing if an intersection occurs (Bool) between a Ray and a Surface, and the distance (Float64) the intersection occurs at.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L154-L158' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}' href='#ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}'>#</a>
**`ConstructiveSolidGeometry.reflect`** &mdash; *Method*.



```
reflect(ray::Ray, plane::Plane)
```

Reflects a ray off a plane and returns a new ray with the same origin but different direction.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L244-L248' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.generate_random_ray' href='#ConstructiveSolidGeometry.generate_random_ray'>#</a>
**`ConstructiveSolidGeometry.generate_random_ray`** &mdash; *Function*.



```
generate_random_ray(box::Box)
```

Returns a randomly sampled ray from within an axis aligned bounding box.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L257-L261' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry}' href='#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry}'>#</a>
**`ConstructiveSolidGeometry.find_intersection`** &mdash; *Method*.



```
find_intersection(ray::Ray, geometry::Geometry)
```

Takes a Ray and a Geometry and performs ray tracing. It returns a new Ray that has been moved just accross the point of closest intersection, the surface id that was hit, and the boundary condition of the surface that was hit


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L320-L324' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}}' href='#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}}'>#</a>
**`ConstructiveSolidGeometry.find_intersection`** &mdash; *Method*.



```
find_intersection(ray::Ray, regions::Array{Region})
```

Takes a Ray and an array of Regions and performs ray tracing. It returns a new Ray that has been moved just accross the point of intersection, the surface id that was hit, and the boundary condition of the surface that was hit


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L285-L289' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.is_in_cell' href='#ConstructiveSolidGeometry.is_in_cell'>#</a>
**`ConstructiveSolidGeometry.is_in_cell`** &mdash; *Function*.



```
is_in_cell(p::Coord, cell::Cell)
```

Determines if a point (such as a Ray origin) is inside a given cell

**Arguments**

  * `p::Coord`: the point we want to test
  * `cell::Cell`: the cell we want to see if p is within


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L434-L442' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_cell_id' href='#ConstructiveSolidGeometry.find_cell_id'>#</a>
**`ConstructiveSolidGeometry.find_cell_id`** &mdash; *Function*.



```
find_cell_id(p::Coord, geometry::Geometry)
```

Finds the cell id that a point resides within

**Arguments**

  * `p::Coord': the point we are testing
  * `geometry::Geometry': the geometry that we are checking the point within


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L503-L512' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.plot_geometry_2D' href='#ConstructiveSolidGeometry.plot_geometry_2D'>#</a>
**`ConstructiveSolidGeometry.plot_geometry_2D`** &mdash; *Function*.



```
plot_geometry_2D(geometry::Geometry, view::Box, dim::Int64)
```

Plots a 2D x-y slice of a geometry.

**Arguments**

  * `geometry::Geometry`: the geometry we want to plot
  * `view::Box``: The view box is an axis aligned box that defines where the picture will be taken, with both min and max z dimensions indicating the single z elevation the slice is taken at.
  * `dim::Int64`: The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L522-L531' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.plot_cell_2D' href='#ConstructiveSolidGeometry.plot_cell_2D'>#</a>
**`ConstructiveSolidGeometry.plot_cell_2D`** &mdash; *Function*.



```
plot_cell_2D(geometry::Geometry, view::Box, dim::Int64, cell_id::Int64)
```

Plots a 2D x-y slice of a geometry, highlighting a specific cell in black.

**Arguments**

  * `geometry::Geometry`: the geometry we want to plot
  * `view::Box``: The view box is an axis aligned box that defines where the picture will be taken, with both min and max z dimensions indicating the single z elevation the slice is taken at.
  * `dim::Int64`: The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture.
  * `cell_id::Int64`: The index of the cell we wish to view


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/d1d6df296c9bcec18e33c4bc60ff5afd5a66fe0b/src/ConstructiveSolidGeometry.jl#L564-L574' class='documenter-source'>source</a><br>


<a id='Index-1'></a>

## Index

- [`ConstructiveSolidGeometry.Box`](index.md#ConstructiveSolidGeometry.Box)
- [`ConstructiveSolidGeometry.Cell`](index.md#ConstructiveSolidGeometry.Cell)
- [`ConstructiveSolidGeometry.Coord`](index.md#ConstructiveSolidGeometry.Coord)
- [`ConstructiveSolidGeometry.Geometry`](index.md#ConstructiveSolidGeometry.Geometry)
- [`ConstructiveSolidGeometry.InfCylinder`](index.md#ConstructiveSolidGeometry.InfCylinder)
- [`ConstructiveSolidGeometry.Plane`](index.md#ConstructiveSolidGeometry.Plane)
- [`ConstructiveSolidGeometry.Ray`](index.md#ConstructiveSolidGeometry.Ray)
- [`ConstructiveSolidGeometry.Region`](index.md#ConstructiveSolidGeometry.Region)
- [`ConstructiveSolidGeometry.Sphere`](index.md#ConstructiveSolidGeometry.Sphere)
- [`ConstructiveSolidGeometry.Surface`](index.md#ConstructiveSolidGeometry.Surface)
- [`ConstructiveSolidGeometry.find_cell_id`](index.md#ConstructiveSolidGeometry.find_cell_id)
- [`ConstructiveSolidGeometry.find_intersection`](index.md#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry})
- [`ConstructiveSolidGeometry.find_intersection`](index.md#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}})
- [`ConstructiveSolidGeometry.generate_random_ray`](index.md#ConstructiveSolidGeometry.generate_random_ray)
- [`ConstructiveSolidGeometry.is_in_cell`](index.md#ConstructiveSolidGeometry.is_in_cell)
- [`ConstructiveSolidGeometry.magnitude`](index.md#ConstructiveSolidGeometry.magnitude)
- [`ConstructiveSolidGeometry.plot_cell_2D`](index.md#ConstructiveSolidGeometry.plot_cell_2D)
- [`ConstructiveSolidGeometry.plot_geometry_2D`](index.md#ConstructiveSolidGeometry.plot_geometry_2D)
- [`ConstructiveSolidGeometry.raytrace`](index.md#ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane})
- [`ConstructiveSolidGeometry.reflect`](index.md#ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane})
- [`ConstructiveSolidGeometry.unitize`](index.md#ConstructiveSolidGeometry.unitize)


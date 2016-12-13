
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



An {x,y,z} coordinate type.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L30' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Ray' href='#ConstructiveSolidGeometry.Ray'>#</a>
**`ConstructiveSolidGeometry.Ray`** &mdash; *Type*.



A ray is defined by its origin (Coord) and a unitized direction vector (Coord)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L37' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Plane' href='#ConstructiveSolidGeometry.Plane'>#</a>
**`ConstructiveSolidGeometry.Plane`** &mdash; *Type*.



A plane is defined by a point Coord on the surface of the plane, its unit normal vector Coord, and a boundary condition. Boundary conditions are transmission (default), reflective, and vacuum


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L45-L47' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Sphere' href='#ConstructiveSolidGeometry.Sphere'>#</a>
**`ConstructiveSolidGeometry.Sphere`** &mdash; *Type*.



A sphere is defined by its center Coord, its radius, and a boundary condition (transmission or vacuum)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L65' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.InfCylinder' href='#ConstructiveSolidGeometry.InfCylinder'>#</a>
**`ConstructiveSolidGeometry.InfCylinder`** &mdash; *Type*.



An Infinite Cylinder is defined by a Coord on its central axis, a unit direction vector Coord along its axis, its radius, and a boundary condition (transmission or vacuum)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L84' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Box' href='#ConstructiveSolidGeometry.Box'>#</a>
**`ConstructiveSolidGeometry.Box`** &mdash; *Type*.



A box is axis aligned and is defined by the minimum Coord and maximum Coord of the box


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L104' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Region' href='#ConstructiveSolidGeometry.Region'>#</a>
**`ConstructiveSolidGeometry.Region`** &mdash; *Type*.



Defined by a surface and a halfspace (+1 or -1)


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L110' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Cell' href='#ConstructiveSolidGeometry.Cell'>#</a>
**`ConstructiveSolidGeometry.Cell`** &mdash; *Type*.



Defined by an array of Regions and a Julia expression indicating the logical combination of regions that define the cell


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L116' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.Geometry' href='#ConstructiveSolidGeometry.Geometry'>#</a>
**`ConstructiveSolidGeometry.Geometry`** &mdash; *Type*.



The top level object that holds all the cells in the problem. This is used as input for the ray tracer


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L122' class='documenter-source'>source</a><br>


<a id='Functions-1'></a>

## Functions

<a id='ConstructiveSolidGeometry.magnitude' href='#ConstructiveSolidGeometry.magnitude'>#</a>
**`ConstructiveSolidGeometry.magnitude`** &mdash; *Function*.



A utility function to determine the magnitude of a Coord object. Typical use case is to subtract two Coord objects and check the resulting Coord object's magnitude to determine the distance between the two Coords.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L138' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.unitize' href='#ConstructiveSolidGeometry.unitize'>#</a>
**`ConstructiveSolidGeometry.unitize`** &mdash; *Function*.



A utility function to unitize a Coord object


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L140' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}' href='#ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}'>#</a>
**`ConstructiveSolidGeometry.raytrace`** &mdash; *Method*.



Returns a tuple representing if an intersection occurs (Bool) between a Ray and a Surface, and the distance (Float64) the intersection occurs at.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L153' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}' href='#ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane}'>#</a>
**`ConstructiveSolidGeometry.reflect`** &mdash; *Method*.



Reflects a ray off a plane and returns a new ray with the same origin but different direction.


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L239' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.generate_random_ray' href='#ConstructiveSolidGeometry.generate_random_ray'>#</a>
**`ConstructiveSolidGeometry.generate_random_ray`** &mdash; *Function*.



Returns a randomly sampled ray from within an axis aligned bounding box


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L248' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry}' href='#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry}'>#</a>
**`ConstructiveSolidGeometry.find_intersection`** &mdash; *Method*.



This version of the function takes a Ray and a Geometry and performs ray tracing. It returns a new Ray that has been moved just accross the point of intersection, the surface id that was hit, and the boundary condition of the surface that was hit


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L306' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}}' href='#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}}'>#</a>
**`ConstructiveSolidGeometry.find_intersection`** &mdash; *Method*.



This version of the function takes a Ray and an array of Regions and performs ray tracing. It returns a new Ray that has been moved just accross the point of intersection, the surface id that was hit, and the boundary condition of the surface that was hit


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L275' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.is_in_cell' href='#ConstructiveSolidGeometry.is_in_cell'>#</a>
**`ConstructiveSolidGeometry.is_in_cell`** &mdash; *Function*.



Determines if a Coord (such as a Ray origin) is inside a given Cell


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L415' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.find_cell_id' href='#ConstructiveSolidGeometry.find_cell_id'>#</a>
**`ConstructiveSolidGeometry.find_cell_id`** &mdash; *Function*.



Finds the cell id given a Coord and a Geometry object


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L476' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.plot_geometry_2D' href='#ConstructiveSolidGeometry.plot_geometry_2D'>#</a>
**`ConstructiveSolidGeometry.plot_geometry_2D`** &mdash; *Function*.



Plots a 2D slice given a Geometry, a view box, and a dimension. The view box is an axis aligned box that defines where the picture will be taken, with both z dimensions indicating the single z elevation the slice is taken at. The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L491' class='documenter-source'>source</a><br>

<a id='ConstructiveSolidGeometry.plot_cell_2D' href='#ConstructiveSolidGeometry.plot_cell_2D'>#</a>
**`ConstructiveSolidGeometry.plot_cell_2D`** &mdash; *Function*.



Plots a 2D slice highlighting a single Cell, given a Geometry, a view box, a dimension, and the cell id. The view box is an axis aligned box that defines where the picture will be taken, with both z dimensions indicating the single z elevation the slice is taken at. The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture


<a target='_blank' href='https://github.com/jtramm/ConstructiveSolidGeometry.jl/tree/c6ade5fbf67981d8964befbc2fad3d4dcf34b0a2/src/ConstructiveSolidGeometry.jl#L528' class='documenter-source'>source</a><br>


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
- [`ConstructiveSolidGeometry.find_cell_id`](index.md#ConstructiveSolidGeometry.find_cell_id)
- [`ConstructiveSolidGeometry.find_intersection`](index.md#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,Array{ConstructiveSolidGeometry.Region,N}})
- [`ConstructiveSolidGeometry.find_intersection`](index.md#ConstructiveSolidGeometry.find_intersection-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Geometry})
- [`ConstructiveSolidGeometry.generate_random_ray`](index.md#ConstructiveSolidGeometry.generate_random_ray)
- [`ConstructiveSolidGeometry.is_in_cell`](index.md#ConstructiveSolidGeometry.is_in_cell)
- [`ConstructiveSolidGeometry.magnitude`](index.md#ConstructiveSolidGeometry.magnitude)
- [`ConstructiveSolidGeometry.plot_cell_2D`](index.md#ConstructiveSolidGeometry.plot_cell_2D)
- [`ConstructiveSolidGeometry.plot_geometry_2D`](index.md#ConstructiveSolidGeometry.plot_geometry_2D)
- [`ConstructiveSolidGeometry.raytrace`](index.md#ConstructiveSolidGeometry.raytrace-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane})
- [`ConstructiveSolidGeometry.reflect`](index.md#ConstructiveSolidGeometry.reflect-Tuple{ConstructiveSolidGeometry.Ray,ConstructiveSolidGeometry.Plane})
- [`ConstructiveSolidGeometry.unitize`](index.md#ConstructiveSolidGeometry.unitize)


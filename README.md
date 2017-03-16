[![Build Status](https://travis-ci.org/jtramm/ConstructiveSolidGeometry.jl.svg?branch=master)](https://travis-ci.org/jtramm/ConstructiveSolidGeometry.jl)
[![Coverage Status](https://coveralls.io/repos/github/jtramm/ConstructiveSolidGeometry.jl/badge.svg?branch=master)](https://coveralls.io/github/jtramm/ConstructiveSolidGeometry.jl?branch=master)
[![codecov.io](http://codecov.io/github/jtramm/ConstructiveSolidGeometry.jl/coverage.svg?branch=master)](http://codecov.io/github/jtramm/ConstructiveSolidGeometry.jl?branch=master)
# ConstructiveSolidGeometry.jl

A lightweight constructive solid geometry and ray tracing package for scientific computing in Julia.

## Installation

You can install this package with the following Julia command:

```julia
Pkg.add("ConstructiveSolidGeometry")
```

The package can then be loaded and used in a Julia script or a Jupyter Notebook by:

```julia
using ConstructiveSolidGeometry
```

Note that plotting functionality for this package is dependent on Plots package and the PyPlot backend. If you don't have these already, install them by:

```julia
Pkg.add("Plots")
Pkg.add("PyPlot")
```

The PyPlot package requires that matplotlib (a python package) be installed on your system, which can be done using apt-get, pip, or by following the full instructions [here](http://matplotlib.org/faq/installing_faq.html#python-org-python).

## Documentation

A full explanation of the package, its design and methodology is given in the examples directory:

[Introduction](https://github.com/jtramm/ConstructiveSolidGeometry.jl/blob/master/examples/1-Introduction.ipynb)

A number of examples are also provided in that directory:

[CSG Logical Operators](https://github.com/jtramm/ConstructiveSolidGeometry.jl/blob/master/examples/2-CSG_Logical_Operators.ipynb)

[Simple Geometry Example: Pincell](https://github.com/jtramm/ConstructiveSolidGeometry.jl/blob/master/examples/3-Pincell.ipynb)

[Monte Carlo Particle Random Walk Example](https://github.com/jtramm/ConstructiveSolidGeometry.jl/blob/master/examples/4-Monte_Carlo_Particle_Simulation.ipynb)

The full public API is also available:

[API](https://github.com/jtramm/ConstructiveSolidGeometry.jl/blob/master/docs/build/index.md)

Created by John Tramm (jtramm@mit.edu).

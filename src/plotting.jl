"""
    plot_geometry_2D(geometry::Geometry, view::Box, dim::Int64)

Plots a 2D x-y slice of a geometry.

# Arguments
* `geometry::Geometry`: the geometry we want to plot
* `view::Box`: The view box is an axis aligned box that defines where the picture will be taken, with both min and max z dimensions indicating the single z elevation the slice is taken at.
* `dim::Int64`: The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture.
"""
function plot_geometry_2D(geometry::Geometry, view::Box, dim::Int64)
    delta_x = (view.upper_right.x - view.lower_left.x) / (dim)
    delta_y = (view.upper_right.y - view.lower_left.y) / (dim)

    x_coords = collect(view.lower_left.x + delta_x/2.0:delta_x:view.upper_right.x - delta_x/2.0)
    y_coords = collect(view.lower_left.y + delta_y/2.0:delta_y:view.upper_right.y - delta_y/2.0)

    pixels = Array{Int64, 2}(dim, dim)

    for i=1:dim
        for j=1:dim
            pixels[i,j] = find_cell_id(Coord(x_coords[i], y_coords[j], view.lower_left.z), geometry)
        end
    end
    pixels = rotl90(pixels)
    colors = Array{RGBA}(0)
    for i=1:length(geometry.cells)
        if (i-1)%4 == 0
            push!(colors, RGBA(1.0, 0.0, 0.0, 1.0))
        elseif (i-1)%4 == 1
            push!(colors, RGBA(0, 1.0, 0, 1.0))
        elseif (i-1)%4 == 2
            push!(colors, RGBA(1.0, 0.0, 1.0, 1.0))
        elseif (i-1)%4 == 3
            push!(colors, RGBA(0, 0, 1.0, 1.0))
        end
        #push!(colors, RGBA(rand(),rand(),rand(),1.0) )
    end
    gradient = ColorGradient(colors)
    heatmap(x_coords,y_coords,pixels,aspect_ratio=1, color=gradient, leg=false)
end

"""
    plot_cell_2D(geometry::Geometry, view::Box, dim::Int64, cell_id::Int64)

Plots a 2D x-y slice of a geometry, highlighting a specific cell in black.

# Arguments
* `geometry::Geometry`: the geometry we want to plot
* `view::Box`: The view box is an axis aligned box that defines where the picture will be taken, with both min and max z dimensions indicating the single z elevation the slice is taken at.
* `dim::Int64`: The dimension is the number of pixels along the x and y axis to use, which determines the resolution of the picture.
* `cell_id::Int64`: The index of the cell we wish to view
"""
function plot_cell_2D(geometry::Geometry, view::Box, dim::Int64, cell_id::Int64)
    delta_x = (view.upper_right.x - view.lower_left.x) / (dim)
    delta_y = (view.upper_right.y - view.lower_left.y) / (dim)

    x_coords = collect(view.lower_left.x + delta_x/2.0:delta_x:view.upper_right.x - delta_x/2.0)
    y_coords = collect(view.lower_left.y + delta_y/2.0:delta_y:view.upper_right.y - delta_y/2.0)

    pixels = Array{Int64, 2}(dim, dim)

    for i=1:dim
        for j=1:dim
            pixels[i,j] = find_cell_id(Coord(x_coords[i], y_coords[j], view.lower_left.z), geometry)
            if pixels[i, j] == cell_id
                pixels[i, j] = 0
            else
                pixels[i, j] = 1
            end
        end
    end
    pixels = rotl90(pixels)
    colors = Array{RGBA}(0)
    push!(colors, RGBA(0.0, 0.0, 0.0, 1.0))
    push!(colors, RGBA(1.0, 1.0, 1.0, 1.0))
    gradient = ColorGradient(colors)
    heatmap(x_coords,y_coords,pixels,aspect_ratio=1, color=gradient, leg=false)
end

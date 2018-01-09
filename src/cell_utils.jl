"""
    is_in_cell(p::Coord, cell::Cell)

Determines if a point (such as a Ray origin) is inside a given cell
"""
function is_in_cell(p::Coord, cell::Cell)
    result = navigate_tree(p, cell.regions, cell.definition)
    return result
end

function navigate_tree(p::Coord, r::Array{Region}, ex::Expr)
    global _p = Coord(p.x, p.y, p.z)

	# Check if Complement
	if ex.args[1] == :~
		if typeof(ex.args[2]) == typeof(1)
			return ~ r[ex.args[2]]
		else
			return ~ navigate_tree(p, r, ex.args[2])
		end
	end

	if typeof(ex.args[2]) == typeof(1)
		# Case 1 - Both operands are leaves
		if typeof(ex.args[3]) == typeof(1)
			if ex.args[1] == :^
            	return r[ex.args[2]] ^ r[ex.args[3]]
			end
			if ex.args[1] == :|
            	return r[ex.args[2]] | r[ex.args[3]]
			end
		end
		# Case 2 - Left operand is leaf, right is not
		if typeof(ex.args[3]) != typeof(1)
			if ex.args[1] == :^
            	return r[ex.args[2]] ^ navigate_tree(p, r, ex.args[3])
			end
			if ex.args[1] == :|
            	return r[ex.args[2]] | navigate_tree(p, r, ex.args[3])
			end
		end
	end

	if typeof(ex.args[2]) != typeof(1)
		# Case 3 - left operand is not leaf, but right is
		if typeof(ex.args[3]) == typeof(1)
			if ex.args[1] == :^
            	return navigate_tree(p, r, ex.args[2]) ^ r[ex.args[3]]
			end
			if ex.args[1] == :|
            	return navigate_tree(p, r, ex.args[2]) | r[ex.args[3]]
			end
		end
		# Case 4 - Neither operand is a leaf
		if typeof(ex.args[3]) != typeof(1)
			if ex.args[1] == :^
            	return navigate_tree(p, r, ex.args[2]) ^ navigate_tree(p, r, ex.args[3])
			end
			if ex.args[1] == :|
            	return navigate_tree(p, r, ex.args[2]) | navigate_tree(p, r, ex.args[3])
			end
		end
	end
end

"""
    find_cell_id(p::Coord, geometry::Geometry)

Finds the cell id that a point resides within
"""
function find_cell_id(p::Coord, geometry::Geometry)
    for i = 1:length(geometry.cells)
        if is_in_cell(p, geometry.cells[i]) == true
            return i
        end
    end
    return -1
end

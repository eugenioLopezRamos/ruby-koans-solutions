# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  parameters = [a, b, c]
  uniques = parameters.uniq.length

  if parameters.select {|value| value < 1 }.length > 0
    raise TriangleError.new("Invalid Triangle Values: #{parameters.select {|value| value < 1}}")
  end

  if uniques == 1
    sides = parameters.reduce(&:+)
  else
    if parameters.count(parameters.max) > 1
      sides = parameters.select { |val| val == parameters.max }.reduce(&:+)
    else
      sides = parameters.select { |val| val < parameters.max }.reduce(&:+)
    end
  end

  if parameters.max >= sides
    raise TriangleError.new("Invalid triangle size")
  end

  case uniques
  when 1
    return :equilateral
  when 2
    return :isosceles
  when 3
    return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

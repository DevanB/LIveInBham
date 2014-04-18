collection @units

extends "api/v1/units/index"

node :catId do |units|
	units.category.catBegin
end
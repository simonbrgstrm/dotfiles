#!/bin/bash
exec > my_image.ppm    # All echo statements will write here
echo "P3 250 250 255"  # magic, width, height, max component value
for ((y=0; y<250; y++)) {
  for ((x=0; x<250; x++)) {
    echo "$((y^x)) $((x|y)) $((x^y))" # r, g, b
  }
}

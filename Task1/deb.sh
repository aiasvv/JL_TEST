#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 package.deb"
    exit 1
fi

# Path to the .deb file
deb_file="$1"

# Check if the file exists
if [ ! -f "$deb_file" ]; then
    echo "Error: '$deb_file' not found!"
    exit 1
fi

# Create a temporary directory
temp_dir=$(mktemp -d)

# Extract the contents of the .deb file
dpkg-deb -x "$deb_file" "$temp_dir" > /dev/null 2>&1
dpkg-deb -e "$deb_file" "$temp_dir/DEBIAN" > /dev/null 2>&1

# Extract the package name and dependencies
control_file="$temp_dir/DEBIAN/control"
if [ -f "$control_file" ]; then
    package_name=$(grep "^Package:" "$control_file" | awk '{print $2}')
    dependencies=$(grep "^Depends:" "$control_file" | sed 's/^Depends: //' | tr ',' '\n' | sed 's/|/\n/g' | awk '{$1=$1; print}')
    
    echo "Package Name: $package_name"
    echo "Dependencies:"
    if [ -n "$dependencies" ]; then
        echo "$dependencies" | sed 's/^/  - /'
    else
        echo "  - None"
    fi
else
    echo "Error: Control file not found in the .deb package!"
    exit 1
fi

# Clean up the temporary directory
rm -rf "$temp_dir"
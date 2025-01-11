# Analyze DEB Script

A Bash script to analyze `.deb` package files, extracting and displaying the package name and its dependencies in a readable format.

## Features

- Accepts a `.deb` file as input.
- Extracts and displays:
  - **Package Name**
  - **Dependencies**
- Cleans up temporary files after execution.

## Requirements

- **Operating System**: Linux
- **Dependencies**: `dpkg` utility

## Usage

### 1. Provide Execute Permission
Ensure the script has execute permission:
```bash
chmod +x analyze-deb.sh

2. Run the Script
Pass the path to the .deb file as an argument:

./analyze-deb.sh <path_to_package.deb>
Example

./analyze-deb.sh curl_7.81.0-1ubuntu1.20_amd64.deb
Output
The script outputs the package name and a list of its dependencies in a structured format:

Package Name: curl
Dependencies:
  - libc6 (>= 2.34)
  - libcurl4 (= 7.81.0-1ubuntu1.20)
  - zlib1g (>= 1:1.1.4)
Error Handling

Missing Argument: If no .deb file is provided, the script will display usage instructions.
File Not Found: If the specified file does not exist, an error message is shown.
Invalid .deb File: If the .deb file lacks the control file, the script will notify you.
Cleanup

The script creates a temporary directory for extracting the .deb file. This directory is automatically deleted after execution.

Notes

Ensure the .deb file is valid and contains a control file in the DEBIAN directory.
This script is designed for educational and debugging purposes.
License

This script is provided under the MIT License. Feel free to use, modify, and distribute it.

Author

[Your Name]


Feel free to replace `[Your Name]` with your actual name or GitHub username. Let me know if you need any additional modifications!
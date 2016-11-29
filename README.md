# SwiftGMP

[![Build Status](https://travis-ci.org/rfdickerson/SwiftGMP.svg?branch=master)](https://travis-ci.org/rfdickerson/SwiftGMP)

Swift wrapper around the [GMP arbitrary precision arithmetic library](https://gmplib.org/).

## Features:

 - Integer multiplication, addition, subtraction, and division with natural Swift operators

## Quickstart:

  1. Install GMP developer library
  
  `brew install gmp`
  `sudo apt install libgmp-dev`


  2. Include the library in your project
  
  ```swift
  import PackageDescription

  let package = Package(
    name: "ProjectName",
    dependencies: [
      .Package(url: "https://github.com/rfdickerson/SwiftGMP", majorVersion: 0)
    ]
  )
  ```
  
## Examples:


  

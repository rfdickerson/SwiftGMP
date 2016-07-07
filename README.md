# SwiftGMP

> Swift wrapper around the [GMP arbitrary precision arithmetic library](https://gmplib.org/).

Contains an example of using BigInts for calculating digits of Pi using the [Unbounded Spigot Algorithm](http://web.comlab.ox.ac.uk/oucl/work/jeremy.gibbons/publications/spigot.pdf)

## Features:

 - Integer multiplication, addition, subtraction, and division with natural Swift operators

## Quickstart:

- [Install the Swift Development 6-20 snapshots](https://swift.org/download/)
- Compile from source the [GMP library](https://gmplib.org/)
  
  It is important to compile from source because Homebrew or apt-get do not employ the Assembly optimizations and the speed of arithmetic is noticeably slower.

  ```bash
  ./configure
  make 
  make check
  sudo make install
  ```

- Make sure the Swift toolchain is in your path

  i.e. `export PATH=$PATH:/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a.xctoolchain/usr/bin/swift`
  
- Compile the project:

  `swift build`
  
- Test the library:

  `swift test`

- Calculate digits of pi:

  `./.build/release/CalculatePi`
  

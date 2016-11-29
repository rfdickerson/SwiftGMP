import PackageDescription

let package = Package(
    name: "SwiftGMP",
    dependencies: [
    	.Package(url: "https://github.com/rfdickerson/CGMP", majorVersion: 0, minor: 0)
    ]
)

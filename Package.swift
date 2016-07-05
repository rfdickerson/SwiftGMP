import PackageDescription

let package = Package(
    name: "Pidigits",
    targets: [Target(name: "Pidigits", dependencies: [.Target(name: "SwiftGmp")]),
              Target(name: "SwiftGmp")]
)

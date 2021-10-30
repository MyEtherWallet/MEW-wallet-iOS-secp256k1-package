// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MEW-wallet-iOS-secp256k1-package",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MEW-wallet-iOS-secp256k1-package",
            targets: ["MEW-wallet-iOS-secp256k1-package"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MEW-wallet-iOS-secp256k1-package",
            path: "Sources/MEW-wallet-iOS-secp256k1",
            exclude: [
                "contrib/travis.sh",
                
                "src/asm",

                // exclude benchmarks
                "src/bench_ecdh.c",
                "src/bench_ecmult.c",
                "src/bench_internal.c",
                "src/bench_recover.c",
                "src/bench_sign.c",
                "src/bench_verify.c",
                "src/bench_internal.c",
                "src/bench_ecdh.c",
                "src/bench.h",

                // already manually added ecmult_static_context.h
                "src/gen_context.c",

                // exclude tests
                "src/testrand.h",
                "src/testrand_impl.h",
                "src/tests.c",
                "src/tests_exhaustive.c",
                "src/valgrind_ctime_test.c",

                // exclude module tests and makefiles
                "src/modules/ecdh/tests_impl.h",
                "src/modules/recovery/tests_impl.h",
                "src/modules/recovery/Makefile.am.include",
                "src/modules/ecdh/Makefile.am.include",

                // exclude docs and autotools related files
                "build-aux",
                "obj",
                "sage",
                "autogen.sh",
                "configure.ac",
                "COPYING",
                "libsecp256k1.pc.in",
                "Makefile.am",
                "README.md",
                "SECURITY.md",
                "TODO",
            ],
            sources: [
                "src",
                "contrib",
                "include",
            ],
            publicHeadersPath: "include",
            cSettings: [
                // speficy availability of libsecp256k1-config.h
                .define("HAVE_CONFIG_H"),

                // header paths are relative to target's dir
                .headerSearchPath("./"),
                .headerSearchPath("./src"),
                .headerSearchPath("./spm-compat"),

                // disable unnecessary value conversion warnings
                // .unsafeFlags(["-w"]),
            ]),
        .testTarget(
            name: "MEW-wallet-iOS-secp256k1-packageTests",
            dependencies: ["MEW-wallet-iOS-secp256k1-package"]),
    ]
)

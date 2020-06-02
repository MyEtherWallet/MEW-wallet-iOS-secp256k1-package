import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MEW_wallet_iOS_secp256k1_packageTests.allTests),
    ]
}
#endif

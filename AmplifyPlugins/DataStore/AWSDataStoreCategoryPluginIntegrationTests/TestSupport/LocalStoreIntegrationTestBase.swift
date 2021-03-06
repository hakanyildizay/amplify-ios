//
// Copyright 2018-2020 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest

import AmplifyPlugins

@testable import Amplify
@testable import AmplifyTestCommon
@testable import AWSDataStoreCategoryPlugin

class LocalStoreIntegrationTestBase: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        Amplify.reset()
        Amplify.Logging.logLevel = .verbose

        do {
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: TestModelRegistration()))
            try Amplify.configure(AmplifyConfiguration(dataStore: nil))
        } catch {
            XCTFail(String(describing: error))
            return
        }
    }

    override func tearDown() {
        Amplify.DataStore.clear(completion: { _ in })
    }

}

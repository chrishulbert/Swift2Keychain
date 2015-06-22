//
//  Swift2KeychainTests.swift
//  Swift2KeychainTests
//
//  Created by Chris Hulbert on 22/06/2015.
//  Copyright © 2015 Chris Hulbert. All rights reserved.
//

import XCTest
import Swift2Keychain

class Swift2KeychainTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        Keychain.deleteAccount("Account")
    }
    
    func testSyncBackgroundCombinations() {
        Keychain.setString("TestPasswordTT", forAccount: "Account", synchronizable: true, background: true)
        let resultTT = Keychain.stringForAccount("Account")
        XCTAssertEqual(resultTT!, "TestPasswordTT")

        Keychain.deleteAccount("Account")
        XCTAssertNil(Keychain.stringForAccount("Account"))

        
        Keychain.setString("TestPasswordFT", forAccount: "Account", synchronizable: false, background: true)
        let resultFT = Keychain.stringForAccount("Account")
        XCTAssertEqual(resultFT!, "TestPasswordFT")

        Keychain.deleteAccount("Account")
        XCTAssertNil(Keychain.stringForAccount("Account"))
        

        Keychain.setString("TestPasswordTF", forAccount: "Account", synchronizable: true, background: false)
        let resultTF = Keychain.stringForAccount("Account")
        XCTAssertEqual(resultTF!, "TestPasswordTF")

        Keychain.deleteAccount("Account")
        XCTAssertNil(Keychain.stringForAccount("Account"))
        

        Keychain.setString("TestPasswordFF", forAccount: "Account", synchronizable: false, background: false)
        let resultFF = Keychain.stringForAccount("Account")
        XCTAssertEqual(resultFF!, "TestPasswordFF")

        Keychain.deleteAccount("Account")
        XCTAssertNil(Keychain.stringForAccount("Account"))
    }
    
    func testSetAndDelete() {
        let blank = Keychain.stringForAccount("Account")
        XCTAssertNil(blank)
        
        Keychain.setString("Password", forAccount: "Account", synchronizable: false, background: false)
        let password = Keychain.stringForAccount("Account")
        XCTAssertNotNil(password)
        
        Keychain.deleteAccount("Account")
        let blankAgain = Keychain.stringForAccount("Account")
        XCTAssertNil(blankAgain)
    }
    
}

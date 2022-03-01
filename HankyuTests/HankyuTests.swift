//
//  HankyuTests.swift
//  HankyuTests
//
//  Created by 田中大地 on 2022/02/22.
//

import XCTest
@testable import Hankyu

class HankyuTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testGetNextStation() throws {
        var count = 0
        let stations = ModelData().stations
        
        stations.map { station in
            print("\(count) : \(station)")
            count += 1
        }
        
        let takarazukaOsakaUmeda = stations[0]
        let takarazukaNakatsu = takarazukaOsakaUmeda.getNextStation()
        XCTAssertEqual(takarazukaNakatsu?.id, "takarazuka02")
        
        let takarazukaTakarazuka = stations[18]
        XCTAssertEqual(takarazukaTakarazuka.getNextStation()?.id, nil)
        
        let kobeOsakaUmeda = stations[19]
        let kobeNakatsu = kobeOsakaUmeda.getNextStation()
        XCTAssertEqual(kobeNakatsu?.id, "kobe02")
        
        let kobeKobeSannomiya = stations[34]
        XCTAssertEqual(kobeKobeSannomiya.getNextStation()?.id, nil)
        
        let kyotoOsakaUmeda = stations[35]
        let kyotoJuso = kyotoOsakaUmeda.getNextStation()
        XCTAssertEqual(kyotoJuso?.id, "kyoto03")
        
        let kyotoKyotoKawaramachi = stations[62]
        XCTAssertEqual(kyotoKyotoKawaramachi.getNextStation()?.id, nil)

    }
    
    func testGetPreviousStation() throws {
        let stations = ModelData().stations
        
        let takarazukaOsakaUmeda = stations[0]
        XCTAssertEqual(takarazukaOsakaUmeda.getPreviousStation()?.id, nil)
        
        let takarazukaNakatsu = stations[1]
        XCTAssertEqual(takarazukaNakatsu.getPreviousStation()?.id, takarazukaOsakaUmeda.id)
        
        let takarazukaTakarazuka = stations[18]
        XCTAssertEqual(takarazukaTakarazuka.getPreviousStation()?.id, "takarazuka55")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

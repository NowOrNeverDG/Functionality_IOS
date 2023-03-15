//
//  LululemonAssessmentTests.swift
//  LululemonAssessmentTests
//
//  Created by Ge Ding on 2/19/23.
//

import XCTest
@testable import LululemonAssessment

class LululemonAssessmentTests: XCTestCase {
    var coreDataManager: CoreDataManager?
    override func setUpWithError() throws {
        coreDataManager = CoreDataManager(container: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)
    }

    override func tearDownWithError() throws {
        coreDataManager = nil
        
    }
    
    func testFetchData() {
        coreDataManager?.fetchItem()
        XCTAssertNil(coreDataManager?.items.count)
        
    }
    
    func testSortData() {
    }
    
    func testAddData() {
        
    }
    
    func testDeleteData() {
        
    }
    
    func testUpdateData() {
        
    }
}

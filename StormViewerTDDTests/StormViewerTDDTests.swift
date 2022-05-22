//
//  StormViewerTDDTests.swift
//  StormViewerTDDTests
//
//  Created by Fabio Tiberio on 22/05/22.
//

import XCTest
@testable import StormViewerTDD

class StormViewerTDDTests: XCTestCase {

    func testLoadingImages() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }
    
    func testTableExists() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sut.tableView)
    }

    func test_TableView_HasCorrectRowCount() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        // then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(sut.pictures.count, rowCount)
    }
    
    func test_TableView_testEachCellHasTheCorrectText() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func test_TableView_CellsHaveDisclosureIndicators() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func test_ViewController_UsesLargeTitles() {
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    func test_NavigationBar_HasStormViewerTitle() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }
}

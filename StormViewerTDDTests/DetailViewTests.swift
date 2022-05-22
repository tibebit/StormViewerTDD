//
//  DetailViewTests.swift
//  StormViewerTDDTests
//
//  Created by Fabio Tiberio on 22/05/22.
//


import XCTest
@testable import StormViewerTDD

class DetailViewTests: XCTestCase {
    
    func testDetailImageViewExists() {
        //given
        let sut = DetailViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView() {
        //given
        let sut = DetailViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailViewImageHasWhiteBackground() {
        let sut = DetailViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func testDetailViewImageUsesScaleAspectFit() {
        let sut  = DetailViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.view.contentMode, .scaleAspectFit)
    }
    
    func testDetailLoadsImage() {
        //given
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    //MARK: - IntegrationTest
    func testSelectingImageShowsDetail() {
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        //when
        sut.pictureSelectAction = {
            selectedImage = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        //then
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }
    
    func testSelectingImageShowsDetailImage() {
        //given
        let sut = ViewController()
        let testIndexPath  = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        //when
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()
            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }
}


//
//  MovieStructTest.swift
//  FilmFestTests
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieStructTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Init
    func testInit_movieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Ghostbusters", releaseDate: "1984")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1984")
    }
    
    // Equatable
    func testEquatable_ReturnsTrue() {
        let movie1 = Movie(title: "Star Wars")
        let movie2 = Movie(title: "Star Wars")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotTrueForDifferentTitles() {
        let movie1 = Movie(title: "Star Wars")
        let movie2 = Movie(title: "Empire Strikes Back")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotTrueForDifferentReleaseDates() {
        let movie1 = Movie(title: "King Kong", releaseDate: "1933")
        let movie2 = Movie(title: "King Kong", releaseDate: "2013")
        
        XCTAssertNotEqual(movie1, movie2)
    }
}

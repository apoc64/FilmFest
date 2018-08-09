//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager! // system under test
    let pulpFiction = Movie(title: "Pulp Fiction")
    let killBill = Movie(title: "Kill Bill")
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: pulpFiction)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: killBill)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(killBill.title, movieQueried.title)
    }
    
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: pulpFiction)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: pulpFiction)
        sut.addMovie(movie: killBill)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, killBill.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: pulpFiction)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(pulpFiction.title, movieQueried.title)
    }
    
    func testClearArrays_ReturnsArrayCountZero() {
        sut.addMovie(movie: pulpFiction)
        sut.addMovie(movie: killBill)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testDuplicateMovies_ShouldNotBeAdded() {
        sut.addMovie(movie: pulpFiction)
        sut.addMovie(movie: pulpFiction)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}

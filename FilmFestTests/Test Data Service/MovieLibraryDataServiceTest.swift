//
//  MovieLibraryDataServiceTest.swift
//  FilmFestTests
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let pulpFiction = Movie(title: "Pulp Fiction")
    let killBill = Movie(title: "Kill Bill")
    let hatefulEight = Movie(title: "Hateful Eight")
    
    override func setUp() {
        super.setUp()
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Sections
    func testTableViewSections_Count_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        sut.movieManager?.addMovie(movie: killBill)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: hatefulEight)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesToSeeCount() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        sut.movieManager?.addMovie(movie: killBill)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Calls
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCall_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, pulpFiction)
    }
    
    func testCall_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, pulpFiction)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: pulpFiction)
        sut.movieManager?.addMovie(movie: killBill)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectValues() {
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
}











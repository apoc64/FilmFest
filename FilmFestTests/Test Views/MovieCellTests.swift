//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Steven Schwedt on 8/6/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUp() {
        super.setUp()
        let libraryVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Pulp Fiction", releaseDate: "1996"))
        
        XCTAssertEqual(cell.textLabel?.text, "Pulp Fiction")
        XCTAssertEqual(cell.detailTextLabel?.text, "1996")
    }
    
}











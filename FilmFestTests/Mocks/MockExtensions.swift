//
//  MockExtensions.swift
//  FilmFestTests
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import Foundation
import UIKit

@testable import FilmFest

extension MovieLibraryDataServiceTest {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            return mock
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
    //    class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
    //        let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
    //        mock.dataSource = dataSource
    //        mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
    //        return mock
    //    }
}

extension MovieCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}






















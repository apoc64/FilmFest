//
//  Movie.swift
//  FilmFest
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func==(lhs: Movie, rhs:  Movie) -> Bool {
//    if lhs.title != rhs.title {
//        return false
//    }
//    if lhs.releaseDate != rhs.releaseDate {
//        return false
//    }
//    return true
    return (lhs.title == rhs.title) && (lhs.releaseDate == rhs.releaseDate)
}

//
//  ViewController.swift
//  FilmFest
//
//  Created by Steven Schwedt on 8/5/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        print("vdl")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


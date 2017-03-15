//
//  CourseListView.swift
//  TUHub
//
//  Created by Connor Crawford on 3/14/17.
//  Copyright © 2017 Temple University. All rights reserved.
//

import UIKit

class CourseListView: UIView {

    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var courseTableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var terms: [Term]?
    weak var viewController: UIViewController?
    
    
    func setUp(with terms: [Term], from viewController: UIViewController?) {
        self.terms = terms
        self.viewController = viewController
        
        // Set up page control
        pageControl.numberOfPages = terms.count
        
        // Setting tableView delegate
        self.courseTableView.dataSource = self
        
        changeTerm(to: 0)

    }
    
    func changeTerm(to index: Int) {
        if let terms = terms {
            termLabel.text = terms[index].name
            courseTableView.reloadData()
        }
    }
    
    @IBAction func didChangePage(_ sender: UIPageControl) {
        changeTerm(to: sender.currentPage)
    }
    
}

// TODO: Implement UITableViewDataSource

// MARK: - UITableViewDataSource
extension CourseListView: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms?[pageControl.currentPage].courses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseListCell", for: indexPath)
        
        guard let term = terms?[pageControl.currentPage], let courses = term.courses else {
            return cell
        }
        
        // Get all the courses and course description for the term
        let courseName = courses[indexPath.row].name
        let courseDescription = courses[indexPath.row].description
        
        // Set course name label
        cell.textLabel?.text = courseName
        // Set course description label
        cell.detailTextLabel?.text = courseDescription
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CourseListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Handle selection
    }
    
}

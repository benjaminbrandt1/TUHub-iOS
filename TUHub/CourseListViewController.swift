//
//  CourseListViewController.swift
//  TUHub
//
//  Created by Connor Crawford on 3/14/17.
//  Copyright © 2017 Temple University. All rights reserved.
//

import UIKit

class CourseListViewController: UIViewController {

    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var courseTableView: UITableView!
    
    var term: Term?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting tableView delegate
        courseTableView.dataSource = self
        
        // Set term label
        termLabel.text = term?.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return term?.courses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseListCell", for: indexPath)
        
        guard let term = term, let courses = term.courses else {
            return cell
        }
        
        let course = courses[indexPath.row]
        
        // Set course name label
        cell.textLabel?.text = "\(course.name)-\(course.sectionNumber)"
        // Set course description label
        cell.detailTextLabel?.text = courses[indexPath.row].description
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Handle selection
    }
    
}

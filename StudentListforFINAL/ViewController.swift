//
//  ViewController.swift
//  StudentListforFINAL
//
//  Created by Michelle Krameisen on 12/10/17.
//  Copyright © 2017 Krameisen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Matthew A Batsinelas",
    "Kelsey C Bishop",
    "Erin E Boyle",
    "Edward F Burns",
    "Stephen L Casazza",
    "Linda S Chen",
    "Christopher G Chiang",
    "Vlad I Chilom",
    "Joshua Concepcion",
    "Wilberne Dailey",
    "Charles J Gamer",
    "Matthew J Giovanniello",
    "Katherine L Gold",
    "Vincent S Huang",
    "Michelle B Krameisen",
    "Daniel Lu",
    "Marc A Marlotte",
    "Kevin P McCoy",
    "James D McDermott",
    "Patrick R Mulach",
    "Arya K Murthi",
    "Oliver Naser",
    "Duncan E Parrott",
    "Paul J Shalhoub",
    "Kaining Shen",
    "Mia N Tortolani",
    "Kevin Wijendra",
    "Zachary T Wilner",
    "Dingnan Zhou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "EditStudentDetail" {
        let destination = segue.destination as! StudentDetailViewController
        destination.student = students[tableView.indexPathForSelectedRow!.row]
    }
}

    @IBAction func unwindFromStudentDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! StudentDetailViewController
        if let selectedPath = tableView.indexPathForSelectedRow {
            students[selectedPath.row] = source.student
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: students.count, section: 0)
            students.append(source.student)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
}


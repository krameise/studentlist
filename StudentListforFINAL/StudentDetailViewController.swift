//
//  StudentDetailViewController.swift
//  StudentListforFINAL
//
//  Created by Michelle Krameisen on 12/10/17.
//  Copyright © 2017 Krameisen. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    var student: String!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var studentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let student = student {
            studentField.text = student
        }
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            student = studentField.text
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }
    
}



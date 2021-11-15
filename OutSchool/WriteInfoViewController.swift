//
//  WriteInfoViewController.swift
//  OutSchool
//
//  Created by LongDengYu on 2021/11/14.
//

import UIKit

class WriteInfoViewController: UIViewController {
    let name: UITextField = {
        let nameText = UITextField()
        return nameText
    }()
    let button: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        button.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
//        NSLayoutConstraint.activate([
//            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: )
//        ])
        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

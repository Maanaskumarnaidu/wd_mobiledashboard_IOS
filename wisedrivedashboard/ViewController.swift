//
//  ViewController.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 15/07/23.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newotpPageVC.className) as! newotpPageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


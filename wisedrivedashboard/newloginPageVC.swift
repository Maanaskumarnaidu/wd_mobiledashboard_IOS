//
//  newloginPageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 15/07/23.
//

import UIKit

class newloginPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   
    @IBAction func sendotpActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newhomePageVC.className) as! newhomePageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

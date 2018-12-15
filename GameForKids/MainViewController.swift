//
//  ViewController.swift
//  GameForKids
//
//  Created by KHA on 12/10/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func camXuc1BtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(CamXuc1ViewController(), animated: true)
    }

}


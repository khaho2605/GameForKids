//
//  DongVatViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/7/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit
import AVFoundation

class DongVatViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ĐỘNG VẬT"
    }

    @IBAction func dogBtnDidTap(_ sender: Any) {
        self.showVideo(name: "cho", type: "mp4")
    }
    
    @IBAction func chickenBtnDidTap(_ sender: Any) {
        self.showVideo(name: "ga", type: "mp4")
    }
    
    @IBAction func catBtnDidTap(_ sender: Any) {
        self.showVideo(name: "meo", type: "mp4")
    }
    
    @IBAction func pigBtnDidTap(_ sender: Any) {
        self.showVideo(name: "heo", type: "mp4")
    }
    
    @IBAction func cowBtnDidTap(_ sender: Any) {
        self.showVideo(name: "bo", type: "mp4")
    }
}

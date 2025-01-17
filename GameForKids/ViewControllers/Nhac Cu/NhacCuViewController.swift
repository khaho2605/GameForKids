//
//  NhacCuViewController.swift
//  Game4Kids
//
//  Created by KHA on 1/7/18.
//  Copyright © 2018 Kha. All rights reserved.
//

import UIKit

class NhacCuViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NHẠC CỤ"
    }
    @IBAction func violonBtnDidTap(_ sender: Any) {
        self.showVideo(name: "violon", type: "mp4")
    }
    
    @IBAction func trongBtnDidTap(_ sender: Any) {
        self.showVideo(name: "trong", type: "mp4")
    }
    
    @IBAction func danTungBtnDidTap(_ sender: Any) {
        self.showVideo(name: "DanTung", type: "mp4")
    }
    
    @IBAction func kenBtnDidTap(_ sender: Any) {
        self.showVideo(name: "ken", type: "mp4")
    }
    
    @IBAction func danBtnDidTap(_ sender: Any) {
        self.showVideo(name: "dan", type: "mp4")
    }
}

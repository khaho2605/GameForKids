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
    
    @IBAction func dongVatBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(DongVatViewController(), animated: true)
    }
    
    @IBAction func nhacCuBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(NhacCuViewController(), animated: true)
    }
    
    @IBAction func phuongTienBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(PhuongTienViewController(), animated: true)
    }

    @IBAction func bongBongBtnDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(BubbleViewController(), animated: true)
    }
}


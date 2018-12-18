//
//  CamXuc1ViewController.swift
//  Game4Kids
//
//  Created by KHA on 12/24/17.
//  Copyright © 2017 Kha. All rights reserved.
//

import UIKit

class CamXuc1ViewController: BaseViewController {

    @IBOutlet weak var happyView: UIImageView!
    @IBOutlet weak var sadView: UIImageView!
    @IBOutlet weak var angryView: UIImageView!
    @IBOutlet weak var afraidView: UIImageView!

    @IBOutlet weak var playerImg1: UIImageView!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerImg3: UIImageView!
    @IBOutlet weak var playerImg4: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    
    var originPlayer1:CGPoint?
    var originPlayer2:CGPoint?
    var originPlayer3:CGPoint?
    var originPlayer4:CGPoint?
    var arrOrigin: [CGPoint] = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
        
        playerImg1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
        playerImg4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(actionDragView)))
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        arrOrigin = getPos()
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "CẢM XÚC 1"
    }
    
    @IBAction func replayBtnDidTap(_ sender: Any) {
        guard let data = arrOrigin.randomArr() as? [CGPoint]  else { return }
        setPosition(arrData: data)
        playerImg1.isUserInteractionEnabled = true
        playerImg2.isUserInteractionEnabled = true
        playerImg3.isUserInteractionEnabled = true
        playerImg4.isUserInteractionEnabled = true
    }
}

extension CamXuc1ViewController {
    //Get arr posX
    func getPos() -> [CGPoint] {
        var arr = [CGPoint]()
        arr.append(playerImg1.frame.origin)
        arr.append(playerImg2.frame.origin)
        arr.append(playerImg3.frame.origin)
        arr.append(playerImg4.frame.origin)
        return arr
    }
    
    func setPosition(arrData: [CGPoint]) {
        playerImg1.frame.origin = arrData[0]
        playerImg2.frame.origin = arrData[1]
        playerImg3.frame.origin = arrData[2]
        playerImg4.frame.origin = arrData[3]
        originPlayer1 = playerImg1.center
        originPlayer2 = playerImg2.center
        originPlayer3 = playerImg3.center
        originPlayer4 = playerImg4.center
    }
}

extension CamXuc1ViewController {
    
    @objc func actionDragView(recognizer: UIPanGestureRecognizer) {
        var targetView = UIView()
        var posOrigin = CGPoint(x: 0, y: 0)
        
        let tagView: Int = recognizer.view?.tag ?? -1
        let playerView = recognizer.view

        switch tagView {
        case 1:
            targetView = happyView
            posOrigin = originPlayer1 ?? CGPoint.zero
        case 2:
            targetView = sadView
            posOrigin = originPlayer2 ?? CGPoint.zero
        case 3:
            targetView = angryView
            posOrigin = originPlayer3 ?? CGPoint.zero
        case 4:
            targetView = afraidView
            posOrigin = originPlayer4 ?? CGPoint.zero
        default:
            break
        }
        dragView(recognizer: recognizer, target: targetView, posPlayer: posOrigin)
        if recognizer.state == .ended {
            checkFinishGame()
            if endTouch {
                playerView?.isUserInteractionEnabled = false
                endTouch = false
            }
        }
    }
    
    func checkFinishGame() {
        if isFinish == 4 {
            print("Game is finish---------")
            isFinish = 0
            playSound(name: "VoTay", Extension: "mp3")
        }
    }
}

extension CamXuc1ViewController {
    func layout() {
        let topMargin: CGFloat = 0.15 * Constants.Height
        let leftMargin: CGFloat = Constants.Width * 0.04
        let width: CGFloat = Constants.Height*0.25
        let widthPlayer: CGFloat = Constants.Height*0.23
        happyView.frame = CGRect(x: leftMargin, y: topMargin, width: width, height: width)
        angryView.frame = CGRect(x: leftMargin, y: Constants.Height - width - topMargin/2, width: width, height: width)
        sadView.frame = CGRect(x: Constants.Width - width - leftMargin, y: topMargin, width: width, height: width)
        afraidView.frame = CGRect(x: Constants.Width - width - leftMargin, y: Constants.Height - width - topMargin/2, width: width, height: width)
        
        let posXPlayerLeft: CGFloat = Constants.Width/2 - widthPlayer - 40
        let posXPlayerRight: CGFloat = Constants.Width/2 + 40
        let topMarginPlayer: CGFloat = happyView.center.y
        let bottomMarginPlayer: CGFloat = happyView.center.y*2.1
        playerImg1.frame = CGRect(x: posXPlayerLeft, y: topMarginPlayer, width: widthPlayer, height: widthPlayer)
        playerImg3.frame = CGRect(x: posXPlayerLeft, y: bottomMarginPlayer, width: widthPlayer, height: widthPlayer)
        playerImg2.frame = CGRect(x: posXPlayerRight, y: topMarginPlayer, width: widthPlayer, height: widthPlayer)
        playerImg4.frame = CGRect(x: posXPlayerRight, y: bottomMarginPlayer, width: widthPlayer, height: widthPlayer)
        
        let hBtn: CGFloat = Constants.Height*0.1
        let wBtn: CGFloat = Constants.Width*0.3
        replayBtn.frame = CGRect(x: 0, y: Constants.Height-20-hBtn, width: wBtn, height: hBtn)
        replayBtn.center.x = view.center.x
    }
}

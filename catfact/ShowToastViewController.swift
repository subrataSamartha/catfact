//
//  ShowToastViewController.swift
//  catfact
//
//  Created by subrata Samartha on 27/04/23.
//

import UIKit

class ShowToastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     
}

extension UIViewController {
    func showToastMsg(message:String, font:UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height - 100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.black
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3,delay: 1,options: .curveEaseOut,
                       animations: {
            toastLabel.alpha = 0.0
        },completion: {(isCompleted) in toastLabel.removeFromSuperview()})
    }
}
		

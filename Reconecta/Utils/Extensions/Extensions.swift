//
//  Extensions.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}

enum UserKind: String {
    case none
    case alumini
    case ong
    case course
}

extension UIViewController {
    
    func showDefaultAlert(message: String, completeBlock: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: completeBlock)
        alertController.addAction(action)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            effectView.frame = CGRect.init(x: 0, y: 0, width: 70.0, height: 70.0)
            effectView.center = UIApplication.shared.keyWindow?.center ?? CGPoint()
            effectView.layer.cornerRadius = 8
            effectView.clipsToBounds = true
            let backView = UIView(frame: CGRect.init(x: 0,
                                                     y: 0,
                                                     width: UIScreen.main.bounds.width,
                                                     height: UIScreen.main.bounds.height))
            backView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            backView.tag = 111
            let activityIndicator = UIActivityIndicatorView(style: .white)
            activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            effectView.contentView.addSubview(activityIndicator)
            activityIndicator.center = effectView.contentView.center
            backView.addSubview(effectView)
            
            if let keyWindow = UIApplication.shared.keyWindow {
                if let view = keyWindow.viewWithTag(111) {
                    view.removeFromSuperview()
                }
                keyWindow.addSubview(backView)
            }
        }
    }
    
    func dismissLoader() {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                if let view = keyWindow.viewWithTag(111) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}

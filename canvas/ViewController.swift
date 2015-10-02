//
//  ViewController.swift
//  canvas
//
//  Created by Chintan Rita on 10/1/15.
//  Copyright © 2015 Chintan Rita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var trayOriginalCenter: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedImageCenter: CGPoint!

    @IBOutlet weak var downArrow: UIImageView!
    @IBOutlet weak var trayView: UIView!
    
    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)
        let velocity = sender.velocityInView(self.view)
        
        if sender.state == UIGestureRecognizerState.Ended {
            if (velocity.y > 0) {
                // Going down
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                    self.trayView.center = CGPoint(x: self.trayView.center.x, y: self.view.frame.height + 80)
                }, completion:nil)
            }
            else {
                // Going up
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                    self.trayView.center = self.trayOriginalCenter

                }, completion:nil)
            }
    }
    }
    
    
    @IBAction func faceGestureRecognizer(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)

        if sender.state == UIGestureRecognizerState.Began {
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedImageCenter = newlyCreatedFace.center
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            newlyCreatedFace.center = point
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayOriginalCenter = trayView.center

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


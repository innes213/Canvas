//
//  CanvasViewController.swift
//  
//
//  Created by Rob Hislop on 5/7/15.
//
//

import UIKit

var trayOriginalCenter: CGPoint?
var newlyCreatedFace: UIImageView!
var newFaceCenter: CGPoint?
class CanvasViewController: UIViewController {
    
    var trayOriginalCenter: CGPoint!

    @IBOutlet weak var trayView: UIView!
    @IBOutlet var view: UIView!

    @IBAction func onTrayPanGentrure(panGestureRecognizer: UIPanGestureRecognizer) {

        var point = panGestureRecognizer.locationInView(trayView)
        var velocity = panGestureRecognizer.velocityInView(trayView)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
            trayOriginalCenter = trayView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            trayView.center = panGestureRecognizer.translationInView(trayView)
            println("Gesture changed at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
        }
    }

    @IBAction func facePanGesture(sender: UIPanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
            //Create a new face
            var imageView = sender.view as UIImageView
            trayView.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            // Map to main view coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newFaceCenter = newFaceCenter
        } else if sender.state == UIGestureRecognizerState.Changed {
            newlyCreatedFace.center = sender.translationInView(view)
            println("Gesture changed at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayOriginalCenter = trayView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

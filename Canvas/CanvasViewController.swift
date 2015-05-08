//
//  CanvasViewController.swift
//  
//
//  Created by Rob Hislop on 5/7/15.
//
//

import UIKit

var trayOriginalCenter: CGPoint?

class CanvasViewController: UIViewController {
    
    //var trayOriginalCenter: CGPoint!
    var trayUpCenter: CGPoint!
    var trayDownCenter: CGPoint!
    var newlyCreatedFace: UIImageView!
    @IBOutlet weak var trayView: UIView!

    @IBAction func onTrayPanGentrure(panGestureRecognizer: UIPanGestureRecognizer) {

        var point = panGestureRecognizer.locationInView(trayView)
        var velocity = panGestureRecognizer.velocityInView(trayView)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
            //trayOriginalCenter = trayView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            var translation = panGestureRecognizer.translationInView(trayView)
            //trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            println("Gesture changed at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
            if (velocity.y < 0) {
                trayView.center = trayUpCenter
            } else {
                trayView.center = trayDownCenter
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //trayOriginalCenter = trayView.center
        // Do any additional setup after loading the view.
        trayUpCenter = CGPoint(x: 160, y: 480)
        trayDownCenter = CGPoint(x: 160, y: 640)
        trayView.center = trayDownCenter
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

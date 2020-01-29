//
//  FeedbacksViewController.swift
//  NPFoodStallReview
//
//  Created by Zhi Xuan Lee on 28/1/20.
//  Copyright © 2020 Jm San Diego. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class FeedbacksViewController:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        var returnBool = false
//        if identifier == "ToAddUpdateFeedbackPage" {
//            GIDSignIn.sharedInstance()?.presentingViewController = self
//
//            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
//            if (AppDelegate.googleUser == nil) {
//                GIDSignIn.sharedInstance()?.signIn()
//                returnBool = false
//            } else {
//                let destVC:AddUpdateFeedbackViewController = AddUpdateFeedbackViewController()
//                let stall : Stall = Stall(stallId: "stall12", name: "Ban Mian", imageName: "BanMianFC.png", canteenId: "canteen3", feedbacks: [], rating: 4.4)
//                AppDelegate.feedbackStall = stall as? Stall
//                self.present(destVC, animated: true, completion: nil)
//                returnBool = true
//            }
//        }
//        return returnBool
//    }
    
    @IBAction func btnAddUpdateFeedback(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        if (AppDelegate.googleUser == nil) {
            GIDSignIn.sharedInstance()?.signIn()
        } else {
            performSegue(withIdentifier: "ToAddUpdateFeedbackPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToAddUpdateFeedbackPage") {
            let destVC = segue.destination as! AddUpdateFeedbackViewController
            let stall = Stall(stallId: "stall1", name: "Ban Mian", imageName: "BanMianFC.png", canteenId: "canteen3", feedbacks: [], rating: 4.4)
            destVC.feedbackStall = stall as? Stall
        }
    }
}

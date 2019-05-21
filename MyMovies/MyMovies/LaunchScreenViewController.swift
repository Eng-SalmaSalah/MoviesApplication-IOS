//
//  LaunchScreenViewController.swift
//  MyMovies
//
//  Created by Salma on 5/20/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    var currentTime : Float = 0.0
    let MAXTIME : Float = 8.0
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    @IBOutlet weak var movieLogo: UIImageView!
    @IBOutlet weak var appName: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set launch screen duration
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            self.performSegue(withIdentifier: "goToHomeScreen", sender: nil)
        }
        //set the progress view initially
        progressViewOutlet.setProgress(currentTime, animated: false)
        perform(#selector(updateProgress), with: nil, afterDelay: 0.3)
        
        //animate logo
        movieLogo.alpha = 0.5
        appName.alpha = 0.5
        // fade in
        UIView.animate(withDuration: 2, animations: {
            self.movieLogo.alpha = 1.0
            self.appName.alpha = 1.0
        }) { (finished) in
            // fade out
            UIView.animate(withDuration: 2, animations: {
                self.movieLogo.alpha = 0.5
                self.appName.alpha = 0.5
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateProgress(){
        currentTime=currentTime+0.6
        progressViewOutlet.progress = currentTime/MAXTIME
        if currentTime<MAXTIME
        {
            perform(#selector(updateProgress), with: nil, afterDelay: 0.3)
            
        }
    }
    
    
}

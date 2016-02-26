//
//  ViewController.swift
//  PopupAdMob
//
//  Created by Joe Hu on 2/25/16.
//  Copyright © 2016 Joe Hu. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {

    var interstital: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.interstital = createAndLoadInterstitial()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBtn_Pressed(sender: AnyObject) {
        if self.interstital.isReady {
            self.interstital.presentFromRootViewController(self);
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstital = GADInterstitial (adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstital.delegate = self
        let request = GADRequest ()
        request.testDevices = [kGADSimulatorID]
        interstital.loadRequest(request)
        return interstital
    }
    
    func interstitialDidDismissScreen (ad: GADInterstitial!) {
        self.interstital = createAndLoadInterstitial()
    }
}


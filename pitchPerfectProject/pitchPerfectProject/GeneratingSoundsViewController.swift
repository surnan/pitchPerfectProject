//
//  GeneratingSoundsViewController.swift
//  pitchPerfectProject
//
//  Created by admin on 11/7/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class GeneratingSoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    var incomingAudioSelection: String!
    
    
    
    
    
    
    
    //MARK: - UI and Storyboard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    

    override func viewDidAppear(_ animated: Bool) {
        print("recordedAudioURL = \(recordedAudioURL)")
        print("incomingAudioSelection = \(incomingAudioSelection)")
    }
    
    
    //MARK:  Button Action
    
    @IBAction func buttonFunSoundEffects(_ sender: UIButton) {
    }
    
    
    
    @IBAction func buttonPlayBackSpeed(_ sender: UIButton) {
    }
    
}

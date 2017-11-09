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
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    

    override func viewDidAppear(_ animated: Bool) {
        print("recordedAudioURL = \(recordedAudioURL)")
        print("incomingAudioSelection = \(incomingAudioSelection)")
    }
}

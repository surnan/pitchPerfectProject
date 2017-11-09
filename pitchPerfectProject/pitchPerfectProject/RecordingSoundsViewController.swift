//
//  ViewController.swift
//  pitchPerfectProject
//
//  Created by admin on 11/7/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var labelShowingStatus: UILabel!
    
    func setButtonsReadyForRecording(status: Bool){
        if status {
            stopButton.isEnabled = false
            recordButton.isEnabled = true
            labelShowingStatus.text = "Press RECORD to Begin"
        } else {
            labelShowingStatus.text = "Recording currently in Progress"
            stopButton.isEnabled = true
            recordButton.isEnabled = false
        }
    }
    
    
    //MARK: - Functions I've created
    func beginAudioRecording(){
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        //FROM HELP --> You should consider using the FileManager methods urls(for:in:) and url(for:in:appropriateFor:create:). which return URLs, which are the preferred format.
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]  //array consisting of two strings
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print("\nfilePath = ", terminator: " "); print(filePath ?? "ERROR NO PATH FOUND")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopAudioRecording(){
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    //MARK: - AVAudioDelegate Functions
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Finished Record")
            //perform segue
        } else {
            print("Recording Failed")
        }
    }
    
    
    
    
    //MARK: - Views & UI
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setButtonsReadyForRecording(status: true)
    }
    
    @IBAction func recordButtonPressed(_ sender: Any) {
        setButtonsReadyForRecording(status: false)
        beginAudioRecording()
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        setButtonsReadyForRecording(status: true)
        stopAudioRecording()
        performSegue(withIdentifier: "generatingSoundsVCSegue", sender: audioRecorder.url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "generatingSoundsVCSegue" {
            let newVC = segue.destination as! GeneratingSoundsViewController
            let recordedAudioURL = sender as! URL
            newVC.recordedAudioURL = recordedAudioURL
            newVC.incomingAudioSelection = "Just carrying over some data"
        }
    }
    
}


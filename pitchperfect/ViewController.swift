//
//  ViewController.swift
//  pitchperfect
//
//  Created by Seth Singletary on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording button pressed")
        recordingLabel.text = "Recording stopped"
    }
    @IBAction func recordAudio(_ sender: Any) {
        print("record button pressed")
        recordingLabel.text = "Recording in progress"
    }
    
    @IBOutlet weak var recordingLabel: UILabel!
}


//
//  ViewController.swift
//  pitchperfect
//
//  Created by Seth Singletary on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        stopRecordingButton.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Recording stopped"
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
    }
    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in progress"
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true    }
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
}


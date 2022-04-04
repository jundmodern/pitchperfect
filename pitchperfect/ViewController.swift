//
//  RecordSoundsViewController.swift
//  pitchperfect
//
//  Created by Seth Singletary on 3/15/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate{
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        stopRecordingButton.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        configueUI(isRecording: true)

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func configueUI(isRecording: Bool){
        stopRecordingButton.isEnabled = isRecording // to disable the button
        recordButton.isEnabled = !isRecording // to enable the button
        recordingLabel.text = !isRecording ? "Tap to Record" : "Recording in Progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        configueUI(isRecording: false)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
            
        }else{
            print("Recording was not successful")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! playSoundsViewController
            let recordAudioURL = sender as! URL
            
            playSoundsVC.recordedAudioURL = recordAudioURL
        }
            
    }
}


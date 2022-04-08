//
//  ViewController.swift
//  A5-Xylophone
//
//  Created by Lenard Gutierrez on 4/6/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    let sounds:[String:URL?] = [
        "A": Bundle.main.url(forResource: "A", withExtension: "wav", subdirectory: "Sounds"),
        "B": Bundle.main.url(forResource: "B", withExtension: "wav", subdirectory: "Sounds"),
        "C": Bundle.main.url(forResource: "C", withExtension: "wav", subdirectory: "Sounds"),
        "D": Bundle.main.url(forResource: "D", withExtension: "wav", subdirectory: "Sounds"),
        "E": Bundle.main.url(forResource: "E", withExtension: "wav", subdirectory: "Sounds"),
        "F": Bundle.main.url(forResource: "F", withExtension: "wav", subdirectory: "Sounds"),
        "G": Bundle.main.url(forResource: "G", withExtension: "wav", subdirectory: "Sounds"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyTapped(_ sender: UIButton) {
        print("Key: \(sender.titleLabel!.text!) tapped!")
        let key = sender.titleLabel!.text!
        playKey(key: key)
        sender.alpha = 0.5
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            sender.alpha = 1
        }
    }
    
    func playKey(key: String) {
        if let keyPath = sounds[key] {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: keyPath!)
                player?.play()
            } catch {
                print("Error from audio: \(error)")
            }
        }
    }
}

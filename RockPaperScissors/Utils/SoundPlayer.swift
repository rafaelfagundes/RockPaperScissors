//
//  SoundPlayer.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-03.
//

import Foundation
import AVFoundation

class SoundPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    func playAudio(resource: String, withExtension: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: withExtension) else {
            print("Sound file not found")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
            print("Error domain: \(error._domain)")
            print("Error code: \(error._code)")
        }
    }
}

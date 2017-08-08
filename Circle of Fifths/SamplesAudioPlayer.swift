//
//  SamplesAudioPlayer.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 8/3/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation
import AVFoundation

class SamplesAudioPlayer {
    var sound: SystemSoundID = 0
    var player: AVAudioPlayer?
    
    func playSample(for url: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

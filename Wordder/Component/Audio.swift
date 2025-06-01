//
//  Audio.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 5.03.2024.
//

import Foundation
import AVFoundation


var player: AVAudioPlayer!
struct Audio {
    public static func playSound(_ name: String){
        let url = Bundle.main.url(forResource: name , withExtension:"mp3")
        guard url != nil else{
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }catch{
            print("error")
        }
    }
}

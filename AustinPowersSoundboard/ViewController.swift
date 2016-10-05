//
//  ViewController.swift
//  AustinPowersSoundboard
//
//  Created by Shane Noonan on 05/10/2016.
//  Copyright © 2016 Shane Noonan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let soundNames = ["yababy", "smashingbaby", "myself", "groovy-baby", "oh-behave", "i-ate-a-baby"]
    var audioPlayers = [AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup audioplayers
        for sound in soundNames{
            
            do {
                //try do something
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "mp3")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                
                audioPlayers.append(audioPlayer)
            }
                
                
            catch {
                //catch error that is thrown
                audioPlayers.append(AVAudioPlayer())
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //sound button tapped
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //get audioplayer for correct button
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
    
}




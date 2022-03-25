//
//  ViewController.swift
//  ios-display-movie-sample
//
//  Created by Yu Ogasawara on 2022/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var playerView: AVPlayerView!
    
    private var player: AVPlayer? {
        playerView.player
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func playButtonTapped(sender: AnyObject) {
        playerView.playButtonTapped()
    }


}


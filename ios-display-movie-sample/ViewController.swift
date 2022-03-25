//
//  ViewController.swift
//  ios-display-movie-sample
//
//  Created by Yu Ogasawara on 2022/03/24.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    @IBOutlet private weak var playerView: AVPlayerView!
    
    private var player: AVPlayer? {
        playerView.player
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMovie()
    }
    
    private func setUpMovie() {
        let path = Bundle.main.path(forResource: "curvy-road-cropped", ofType: "mov")
        let url = URL(fileURLWithPath: path!)
        playerView.setMovie(url: url)
    }
    
    @IBAction private func playButtonTapped(sender: AnyObject) {
        playerView.playButtonTapped()
    }
}


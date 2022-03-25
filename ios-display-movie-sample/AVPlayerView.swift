//
//  AVPlayerView.swift
//  ios-display-movie-sample
//
//  Created by Yu Ogasawara on 2022/03/24.
//

import UIKit
import AVKit

class AVPlayerView: UIView {
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }
    
    private var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        playerLayer.player
    }
    
    private var playerState = PlayerState.standBy
    private var playToEndTimeObserver: NSObjectProtocol?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    private func setUp() {
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        
        playToEndTimeObserver = NotificationCenter.default
            .addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: nil, queue: .main) { [weak self] _ in
            self?.player?.currentItem?.seek(to: CMTime.zero, completionHandler: nil)
                    self?.playerState = .standBy
        }
    }
    
    func setMovie(url: URL) {
        playerLayer.player = AVPlayer(url: url)
    }
    
    func playButtonTapped() {
        switch playerState {
        case .standBy:
            start()
        case .playing:
            pause()
        case .paused:
            resume()
        }
    }
    
    private func start() {
        player?.play()
        playerState = .playing
    }
    
    private func pause() {
        player?.pause()
        playerState = .paused
    }
    
    private func resume() {
        player?.play()
        playerState = .playing
    }
}

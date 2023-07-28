//
//  AudioViewCiontroller.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 28.07.2023.
//

import UIKit
import AVFoundation

class AudioViewCiontroller: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    var songs:[AudioStruct] = []
    
    var position = 0
    
    private lazy var audioNAmeLable: UILabel = {
        let audioNAmeLable = UILabel()
        audioNAmeLable.textColor = .systemBlue
        audioNAmeLable.textAlignment = .center
        audioNAmeLable.font = .systemFont(ofSize: 16)
        audioNAmeLable.translatesAutoresizingMaskIntoConstraints = false

        return audioNAmeLable
    }()
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        playButton.contentMode = .scaleAspectFit
        playButton.addTarget(self, action: #selector(self.playButtonTap), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    private lazy var nextAudioButton: UIButton = {
        let nextAudioButton = UIButton()
        nextAudioButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        nextAudioButton.contentMode = .scaleAspectFit
        nextAudioButton.addTarget(self, action: #selector(self.nextButtonTap), for: .touchUpInside)
        nextAudioButton.translatesAutoresizingMaskIntoConstraints = false
        return nextAudioButton
    }()
    
    private lazy var backAudioButton: UIButton = {
        let backAudioButton = UIButton()
        backAudioButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        backAudioButton.contentMode = .scaleAspectFit
        backAudioButton.addTarget(self, action: #selector(self.backButtonTap), for: .touchUpInside)
        backAudioButton.translatesAutoresizingMaskIntoConstraints = false
        return backAudioButton
    }()
    
    private lazy var stopButton: UIButton = {
        let stopButton = UIButton()
        stopButton.setBackgroundImage(UIImage(systemName: "stop.fill"), for: .normal)
        stopButton.contentMode = .scaleAspectFit
        stopButton.addTarget(self, action: #selector(self.stopButtonTap), for: .touchUpInside)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        return stopButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = .systemBackground
        
        songs.append(AudioStruct(audioName: "Death Grips - Beware"))
        songs.append(AudioStruct(audioName: "Joy Wants Eternity - From Embrace To Embrace"))
        songs.append(AudioStruct(audioName: "Nils Frahm - You"))
        songs.append(AudioStruct(audioName: "Sleepmakeswaves - It's Dark, It's Cold, It's Winter"))
        songs.append(AudioStruct(audioName: "Sufjan Stevens - I Walked"))
        
        configuratePlayer()
    }
    
    private func setupView() {
        self.view.addSubview(self.audioNAmeLable)
        self.view.addSubview(self.playButton)
        self.view.addSubview(self.stopButton)
        self.view.addSubview(self.nextAudioButton)
        self.view.addSubview(self.backAudioButton)
        
        NSLayoutConstraint.activate([
            
            audioNAmeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            audioNAmeLable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.widthAnchor.constraint(equalToConstant: 50),
            playButton.topAnchor.constraint(equalTo: audioNAmeLable.bottomAnchor, constant: 15),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.widthAnchor.constraint(equalToConstant: 50),
            stopButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 70),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextAudioButton.heightAnchor.constraint(equalToConstant: 50),
            nextAudioButton.widthAnchor.constraint(equalToConstant: 50),
            nextAudioButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            nextAudioButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10),
            
            backAudioButton.heightAnchor.constraint(equalToConstant: 50),
            backAudioButton.widthAnchor.constraint(equalToConstant: 50),
            backAudioButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            backAudioButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10)
            
            
            
            
            
        ])
    }
    
    private func configuratePlayer() {
        
        let song = songs[position]
        
        audioNAmeLable.text = song.audioName
        
        print(song.audioName)
        
        let urlString = Bundle.main.path(forResource: song.audioName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("Url error")
                return
            }
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: urlString))
            
            audioPlayer.play()
            
        } catch {
            
            print("error")
        }
    }
    
    @objc func playButtonTap() {
        if audioPlayer.isPlaying == true {
            audioPlayer.stop()
            playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            audioPlayer.play()
            playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @objc func stopButtonTap() {
        if audioPlayer.currentTime != 0 {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @objc func nextButtonTap() {
        if position < (songs.count - 1) {
            position = position + 1
            audioPlayer.stop()
        }
        configuratePlayer()
        
        playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

    }
    
    @objc func backButtonTap() {
        if position > 0 {
            position = position - 1
            audioPlayer.stop()
        }
        configuratePlayer()
        
        playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

    }
    
}

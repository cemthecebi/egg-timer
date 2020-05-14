import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":20, "Medium":420, "Hard":720]
    var timer = Timer();

    @IBOutlet weak var eggTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!;
        var secondsRemaining = eggTimes[hardness]!
        
        progressBar.progress = 0;
        let progressCount = 1.0/Float(secondsRemaining)
        print(progressCount)
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
                self.progressBar.progress += progressCount
            } else {
                Timer.invalidate()
                self.eggTitle.text = "DONE!"
                self.playSound();
            }
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

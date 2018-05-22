import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func genrebutton1(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status ==  .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func genrebutton2(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status ==  .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func genrebutton3(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status ==  .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func StopButton(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    
    @IBAction func Next(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    


}


//
//  ScoreViewController.swift
//  Freediving_MultipleChoiceQuestions
//
//  Created by Adam Chen on 2024/8/19.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var modelImageView: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var correctCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreTitleLabel.font = UIFont(name: "SetoFont", size: 24)
        scoreTitleLabel.text = "分數："
        
        bubbleLabel.font = UIFont(name: "SetoFont", size: 30)
        bubbleLabel.text = "來和我一起\n自由潛水吧！"
        
        let score = correctCount * 10
        scoreLabel.font = UIFont(name: "SetoFont", size: 40)
        scoreLabel.text = "\(score)"
        
        if score >= 80 {
            modelImageView.image = UIImage(named: "diverwoman")
        }else{
            modelImageView.image = UIImage(named: "diverman")
        }
        modelImageView.layer.cornerRadius = 10
        modelImageView.clipsToBounds = true
        
        var configuration = UIButton.Configuration.plain()
        var title = AttributedString("再玩一次")
        title.font = UIFont(name: "SetoFont", size: 20)
        configuration.attributedTitle = title
        configuration.baseForegroundColor = .white
        configuration.background.backgroundColor = UIColor(red: 33/255, green: 62/255, blue: 134/255, alpha: 0.64)
        restartButton.configuration = configuration
    }
    
    //再玩一次(回首頁)
    @IBAction func playAgain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

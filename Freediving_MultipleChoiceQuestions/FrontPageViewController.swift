//
//  FrontPageViewController.swift
//  Freediving_MultipleChoiceQuestions
//
//  Created by Adam Chen on 2024/8/19.
//

import UIKit

class FrontPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var image = UIImage(named: "ocean01")
        let backgroundImageView = UIImageView(image: image)
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImageView, at: 0)
        
        image = UIImage(named: "diverboy")
        let boyImageView = UIImageView(image: image)
        boyImageView.frame = CGRect(x: view.bounds.midX - 100, y: 230, width: 200, height: 200)
        boyImageView.contentMode = .scaleAspectFill
        view.insertSubview(boyImageView, at: 1)
        
        titleLabel.font = UIFont(name: "SetoFont", size: 36)
        titleLabel.text = "自由潛水小學堂"
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: (view.bounds.width - 260)*0.5, y: 180, width: 260, height: 40)
        
        
        var configuration = UIButton.Configuration.plain()
        var title = AttributedString("開始測驗")
        title.font = UIFont(name: "SetoFont", size: 36)
        configuration.attributedTitle = title
        configuration.baseForegroundColor = .black
        configuration.background.backgroundColor = .clear
        startButton.configuration = configuration
        
        
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

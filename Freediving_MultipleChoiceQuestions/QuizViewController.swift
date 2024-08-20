//
//  QuizViewController.swift
//  Freediving_MultipleChoiceQuestions
//
//  Created by Adam Chen on 2024/8/19.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionNumberSlider: UISlider!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var hintImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    //題庫
    var questions = [
        Question(
            question: "自由潛水的最大深度世界紀錄是多少？",
            answer: "214米",
            options: ["100米", "214米", "300米", "250米"]
        ),
        Question(
            question: "自由潛水主要依賴哪種呼吸技術？",
            answer: "橫膈膜呼吸",
            options: ["胸式呼吸", "腹式呼吸", "橫膈膜呼吸", "口鼻呼吸"]
        ),
        Question(
            question: "自由潛水比賽中，哪一項技術是以不使用任何輔助設備潛水的？",
            answer: "恆重潛水",
            options: ["自由沉降", "恆重潛水", "自由變重", "浮潛"]
        ),
        Question(
            question: "自由潛水時，潛水員應如何避免耳壓不平衡？",
            answer: "耳壓平衡技術",
            options: ["屏住呼吸", "耳壓平衡技術", "快速上升", "緩慢呼吸"]
        ),
        Question(
            question: "自由潛水中常見的失去意識情況稱為什麼？",
            answer: "黑視",
            options: ["白視", "黑視", "暈厥", "高原反應"]
        ),
        Question(
            question: "自由潛水運動中，哪一個因素最影響潛水員的潛水時間？",
            answer: "二氧化碳耐受力",
            options: ["氧氣含量", "心跳速率", "二氧化碳耐受力", "水溫"]
        ),
        Question(
            question: "自由潛水的主要安全風險是什麼？",
            answer: "低氧昏迷",
            options: ["低氧昏迷", "低血糖", "脫水", "疲勞"]
        ),
        Question(
            question: "自由潛水中，哪種設備通常用來測量潛水深度？",
            answer: "潛水電腦",
            options: ["氧氣瓶", "潛水電腦", "壓力錶", "潛水面鏡"]
        ),
        Question(
            question: "自由潛水與水肺潛水的最大區別是什麼？",
            answer: "自由潛水不使用呼吸設備",
            options: ["自由潛水不使用呼吸設備", "自由潛水需要更多設備", "自由潛水更安全", "水肺潛水需要更少訓練"]
        ),
        Question(
            question: "自由潛水中的哪一種比賽項目是比潛水員在水中屏氣靜止的時間長短？",
            answer: "靜態閉氣",
            options: ["動態閉氣", "靜態閉氣", "恆重潛水", "浮潛"]
        ),
        Question(
            question: "自由潛水運動中，哪一種閉氣技術可以讓潛水員下潛更深？",
            answer: "反向打水",
            options: ["正向打水", "反向打水", "擺臂技術", "浮力控制"]
        ),
        Question(
            question: "在自由潛水過程中，為什麼深度越深越危險？",
            answer: "氣體壓縮導致氧氣減少",
            options: ["水壓降低", "體溫下降", "氣體壓縮導致氧氣減少", "能量消耗過多"]
        ),
        Question(
            question: "自由潛水中，哪種潛水技術需要使用滑板？",
            answer: "自由變重潛水",
            options: ["恆重潛水", "自由變重潛水", "自由閉氣", "靜態閉氣"]
        ),
        Question(
            question: "哪一種呼吸法有助於自由潛水員提升屏氣能力？",
            answer: "瑜伽呼吸",
            options: ["快速呼吸", "瑜伽呼吸", "深呼吸", "短促呼吸"]
        ),
        Question(
            question: "自由潛水時，潛水員如何調整浮力以控制下潛速度？",
            answer: "調整呼吸及體積",
            options: ["使用潛水重量", "調整呼吸及體積", "控制擺臂", "利用浮板"]
        ),
        Question(
            question: "自由潛水中，哪個部分最容易受水壓影響？",
            answer: "耳朵",
            options: ["肺部", "耳朵", "鼻子", "眼睛"]
        ),
        Question(
            question: "自由潛水員如何應對潛水過程中的高壓？",
            answer: "進行耳壓平衡",
            options: ["加快呼吸", "進行耳壓平衡", "持續下潛", "減少運動"]
        ),
        Question(
            question: "自由潛水比賽中，動態閉氣的目標是什麼？",
            answer: "潛游最長距離",
            options: ["潛游最長距離", "屏氣最長時間", "潛水最深深度", "潛水最短時間"]
        ),
        Question(
            question: "自由潛水中，為什麼需要夥伴在場？",
            answer: "確保安全，避免事故",
            options: ["增強體能", "提高比賽成績", "確保安全，避免事故", "互相競爭"]
        ),
        Question(
            question: "潛水前，潛水員通常會做什麼準備工作來增加屏氣時間？",
            answer: "深呼吸並放鬆",
            options: ["快速呼吸", "深呼吸並放鬆", "吃大量食物", "持續運動"]
        )
    ]
    var index = 0
    var correctIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        questions.shuffle()
        hintLabel.font = UIFont(name: "SetoFont", size: 20)
        questionLabel.font = UIFont(name: "SetoFont", size: 24)
        questionNumberLabel.font = UIFont(name: "SetoFont", size: 30)
        questionNumberSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
        updateUI()
    }
    
    //點擊選項
    @IBAction func optinClick(_ sender: UIButton) {
        if !hintImageView.isHidden {
            return
        }
        buttonSet(btn: sender, text: (sender.titleLabel?.text)!, type: 1)
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = UIColor.blue.cgColor
        sender.layer.borderWidth = 3
        
        //判斷是否答對
        let selectedAnswer = sender.titleLabel?.text
        let correctAnswer = questions[index].answer
        if selectedAnswer == correctAnswer {
            hintLabel.text = "恭喜答對！"
            correctIndex += 1
            hintImageView.image = UIImage(named: "right")
            hintImageView.isHidden = false
            
            for item in optionButtons where item.titleLabel?.text != correctAnswer{
                item.isEnabled = false
            }
        }else{
            hintLabel.text = "答錯囉..."
            hintImageView.image = UIImage(named: "wrong")
            hintImageView.isHidden = false
            
            for item in optionButtons where item.titleLabel?.text != selectedAnswer{
                if item.titleLabel?.text == correctAnswer{
                    buttonSet(btn: item, text: correctAnswer, type: 2)
                    item.layer.cornerRadius = 5
                    item.layer.borderColor = UIColor.red.cgColor
                    item.layer.borderWidth = 3
                }else{
                    item.isEnabled = false
                }
            }
        }
    }
    
    //下一題
    @IBAction func nextPage(_ sender: Any) {
        if hintImageView.isHidden {
            let controller = UIAlertController(title: "還沒回答問題喔！", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            controller.addAction(okAction)
            present(controller, animated: true)
        }else{
            if index + 1 < 10 {
                index += 1
                updateUI()
            }else{
                performSegue(withIdentifier: "showScore", sender: nil)
            }
        }
    }
    
    //更新畫面
    func updateUI() {
        hintLabel.text = ""
        hintImageView.isHidden = true
        questionNumberLabel.text = "第\(index + 1)題"
        questionNumberSlider.value = Float(index + 1)
        questionLabel.text = questions[index].question
        questions[index].options.shuffle()
        
        for (i, item) in optionButtons.enumerated(){
            buttonSet(btn: item, text: questions[index].options[i], type: 0)
            item.alpha = 0.64
            item.layer.cornerRadius = 0
            item.layer.borderColor = UIColor.clear.cgColor
            item.layer.borderWidth = 0
            item.isEnabled = true
        }
        
        var nextButtonText = ""
        if index == 9 {
            nextButtonText = "看成績"
        }else{
            nextButtonText = "下一題"
        }
        var configuration = UIButton.Configuration.plain()
        var title = AttributedString(nextButtonText)
        title.font = UIFont(name: "SetoFont", size: 20)
        configuration.attributedTitle = title
        configuration.image = UIImage(systemName: "arrowtriangle.forward.fill")
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .trailing
        configuration.background.backgroundColor = UIColor(red: 33/255, green: 62/255, blue: 134/255, alpha: 0.64)
        nextButton.configuration = configuration
    }
    
    //傳成績到下個頁面
    @IBSegueAction func showScore(_ coder: NSCoder) -> ScoreViewController? {
        let controller = ScoreViewController(coder: coder)
        controller?.correctCount = correctIndex
        return controller
    }
    
    //按鈕設定
    func buttonSet(btn: UIButton, text: String, type: Int) {
        var color:UIColor
        switch type {
        case 0:
            color = .black
        case 1:
            color = .blue
        case 2:
            color = .red
        default:
            return
        }
        
        var configuration = UIButton.Configuration.plain()
        var title = AttributedString(text)
        title.font = UIFont(name: "SetoFont", size: 20)
        configuration.attributedTitle = title
        configuration.baseForegroundColor = color
        configuration.background.backgroundColor = .white
        btn.configuration = configuration
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


//
//  ViewController.swift
//  War
//
//  Created by Oleksandr Sofishchenko on 4/10/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    var playerScore:Int = 0
    
    @IBOutlet weak var enemyScoreLabel: UILabel!
    var enemyScore:Int = 0
    
    var cardNamesArray:[String] = ["card2", "card3", "card4", "card5", "card6", "card7",
                                   "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playRoundTapped(sender: UIButton) {
        
        //randomize a number for the first image view
        let firstRandomNumber:Int = Int(arc4random_uniform(13))
        
        //construct a string with the random number
        let firstCardString:String = self.cardNamesArray[firstRandomNumber]
        
        //set the first card image view to the asset corresponding to the randomized number
        self.firstCardImageView.image = UIImage(named: firstCardString)
        
        //randomize a number for the second image view
        let secondRandomNumber = Int(arc4random_uniform(13))
        
        //construct a string with the random number
        let secondCardString:String = self.cardNamesArray[secondRandomNumber]
        
        //set the second card image view to the asset corresponding to the randomized number
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        //determine the higher card
        if firstRandomNumber > secondRandomNumber{
            
            //TODO: first card is larger
            self.playerScore += 1
            self.playerScoreLabel.text = String(self.playerScore)
        }
        else if firstRandomNumber == secondRandomNumber{
            
            //TODO: numbers are equal
        }
        else{
            
            //TODO: second card is larger
            self.enemyScore += 1
            self.enemyScoreLabel.text = String(self.enemyScore)
        }
        
        //end game
        if playerScore == 26 || enemyScore == 26 {
            let alertController = UIAlertController(title: "Game Over", message: "The score has reached 26", preferredStyle: UIAlertControllerStyle.Alert)
            
        alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        //reset the score and labels
        playerScore = 0
        enemyScore = 0
            
        playerScoreLabel.text = String(0)
        enemyScoreLabel.text = String(0)
        }
    }
}


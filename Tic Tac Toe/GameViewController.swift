//
//  GameViewController.swift
//  Tic Tac Toe
//
//  Created by Maha Elrays on 02/06/2021.
//

import UIKit
//import SpriteKit
//import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    var count = 0
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    var flag = 0
    
    
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag-1]==0 && gameIsActive == true){
            gameState[sender.tag-1]=activePlayer
            
            if activePlayer==1 {
                sender.setImage(UIImage(named: "imgX.png"),for:UIControl.State())
                activePlayer=2
                flag = flag+1
                
                
                
            }else{
                sender.setImage(UIImage(named: "imgO.png"),for:UIControl.State())
                activePlayer=1
                flag = flag+1
                
            }
        }
        for combination  in winningCombinations {
            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]]) {
                
                gameIsActive = false
                
                if (gameState[combination[0]]==1) {
                    winnerLabel.isHidden=false
                    winnerLabel.text = " X is winner "
                    playAgainBt.isHidden = false
 
                }else{
                    winnerLabel.isHidden=false
                    winnerLabel.text = " O is winner "
                    playAgainBt.isHidden=false
                    
                }
                if(gameIsActive == true){
                    for i in gameState {
                        
                        count = i * count
                        
                    }
                    if count != 0 {
                        winnerLabel.text = ""
                        winnerLabel.isHidden = false
                        
                    }
                }
                
                
                
            }else{
                if flag >= 9 {
                    playAgainBt.isHidden = false
                }
            }
            
        }
        
    }
    @IBOutlet weak var playAgainBt: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameIsActive = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        playAgainBt.isHidden = true
        winnerLabel.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        if let view = self.view as! SKView? {
        //            // Load the SKScene from 'GameScene.sks'
        //            if let scene = SKScene(fileNamed: "GameScene") {
        //                // Set the scale mode to scale to fit the window
        //                scene.scaleMode = .aspectFill
        //
        //                // Present the scene
        //                view.presentScene(scene)
        //            }
        //
        //            view.ignoresSiblingOrder = true
        //
        //            view.showsFPS = true
        //            view.showsNodeCount = true
        //        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

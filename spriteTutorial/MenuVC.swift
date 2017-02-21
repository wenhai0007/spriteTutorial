//
//  MenuVC.swift
//  spriteTutorial
//
//  Created by Student on 17/1/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
enum gameType{
    case player2
    case easy
    case medium
    case hard
}

class MenuVC: UIViewController {
    
  
    @IBAction func player2(_ sender: UIButton) {
        goToGame(game: .player2)
        
    }

    @IBAction func easy(_ sender: UIButton) {
        goToGame(game: .easy)
    }

    @IBAction func medium(_ sender: UIButton) {
        goToGame(game: .medium)
    }
    
    @IBAction func hard(_ sender: UIButton) {
        goToGame(game: .hard)
    }
    
    func goToGame (game:gameType){
        let rectNav = self.navigationController?.navigationBar.frame
        currentGameType = game
        navigationBarHeight = rectNav!.size.height
        
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC")
        self.navigationController?.pushViewController(gameVC!, animated: false)

    }
}







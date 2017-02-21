//
//  GameScene.swift
//  spriteTutorial
//
//  Created by Student on 16/1/17.
//  Copyright © 2017 Student. All rights reserved.
//

import SpriteKit
import GameplayKit

//public variable
var currentGameType = gameType.medium
var navigationBarHeight = CGFloat()
let statusBarSize = UIApplication.shared.statusBarFrame.size//get the size of status bar

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    var enemyScore = SKLabelNode()
    var mainScore = SKLabelNode()
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        print(statusBarSize.height)
        print(navigationBarHeight)
        let height = self.frame.height
        
        ball = self.childNode(withName:"ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        mainScore = self.childNode(withName: "mainScore") as! SKLabelNode
        enemyScore = self.childNode(withName: "enemyScore") as! SKLabelNode
        enemy.position.y = height/2 - 70 - navigationBarHeight - statusBarSize.height //we can also reduce the status bar height which is 20
        main.position.y = -height/2 + 70
        startGame()
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        
    }
    
    func startGame(){
        switch currentGameType{
        case .easy:
            ball.physicsBody?.applyImpulse(CGVector(dx:15,dy:15))
            break
        case .medium:
            ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
            break
        case .hard:
            ball.physicsBody?.applyImpulse(CGVector(dx:30,dy:30))
            break
        case .player2:
            ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
            break
        }
        
        score = [0,0]
        mainScore.text = "0"
        enemyScore.text = "0"
    }
    
    func addScore(whoWon:SKNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx:0, dy:0)
        if whoWon == enemy{
            score[1] += 1
            enemyScore.text = String(score[1])
            
            switch currentGameType{
            case .easy:
                ball.physicsBody?.applyImpulse(CGVector(dx:15,dy:15))
                break
            case .medium:
                ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
                break
            case .hard:
                ball.physicsBody?.applyImpulse(CGVector(dx:30,dy:30))
                break
            case .player2:
                ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
                break
            }
        }
        if whoWon == main{
            score[0] += 1
            mainScore.text = String(score[0])
            
            switch currentGameType{
            case .easy:
                ball.physicsBody?.applyImpulse(CGVector(dx:15,dy:15))
                break
            case .medium:
                ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
                break
            case .hard:
                ball.physicsBody?.applyImpulse(CGVector(dx:30,dy:30))
                break
            case .player2:
                ball.physicsBody?.applyImpulse(CGVector(dx:20,dy:20))
                break
            }
        }
        
    }
    
    //location updating with the location touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            if currentGameType == .player2{
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    
    //location moving with the touch
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            if currentGameType == .player2{
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
   
    
    //this function is called before each frame is rendered
    override func update(_ currentTime: TimeInterval) {
        
        switch currentGameType{
        case .easy:
                    enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1))
                break
        case .medium:
                    enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
                break
        case .hard:
                    enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.2))
                break
        default:
            break
        }
        
        
        
        if (ball.position.y <= main.position.y - 30){
            addScore(whoWon: enemy)
        }
        if (ball.position.y >= enemy.position.y + 30){
            addScore(whoWon: main)
        }
    }
}




























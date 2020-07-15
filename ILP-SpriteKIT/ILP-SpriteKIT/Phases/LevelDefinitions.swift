//
//  Positions.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 06/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class LevelDefinitions {
    static let shared = LevelDefinitions(levels:
        [
            Level(grounds: [
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: -620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: 620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 200, height: 200)), CGPoint(x: 0, y: 750)),
                (Ground(color: .white, size: CGSize(width: 1242, height: 100)), CGPoint(x: 0, y: -1344)),
                  ],
                  spikes: [],
            playerSpawn: CGPoint(x: -600, y: -1294), safePoint: CGPoint(x: 0, y: -1294)),
            
            Level(grounds: [
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: -620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: 620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 200, height: 200)), CGPoint(x: 0, y: 750)),
                (Ground(color: .white, size: CGSize(width: 1242, height: 100)), CGPoint(x: 0, y: -1344)),
                  ],
                  spikes: [],
            playerSpawn: CGPoint(x: 0, y: 800), safePoint: CGPoint(x: 0, y: -1294)),
            
            Level(grounds: [
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: -620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: 620, y: 0)),
                (Ground(color: .white, size: CGSize(width: 200, height: 200)), CGPoint(x: 0, y: 750)),
                (Ground(color: .white, size: CGSize(width: 1242, height: 100)), CGPoint(x: 0, y: -1344)),
                  ],
                  spikes: [(NoisySpike(imageNamed: "spike"),CGPoint(x: 0, y: 0))],
            playerSpawn: CGPoint(x: 0, y: 800), safePoint: CGPoint(x: 0, y: -1294)),
            
            Level(grounds: [
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: -690, y: 0)),
                (Ground(color: .white, size: CGSize(width: 100, height: 2688)), CGPoint(x: 690, y: 0)),
                (Ground(color: .white, size: CGSize(width: 1242, height: 100)), CGPoint(x: 0, y: -1344))
                ],
                  spikes: [
                    (NoisySpike(imageNamed: "spike"),CGPoint(x: 0, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: 600, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: 450, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: 300, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: -300, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: -450, y: 0)),
                    (StealthSpike(imageNamed: "spike"),CGPoint(x: -600, y: 0)),
                   ],
                 playerSpawn: CGPoint(x: 0, y: 800), safePoint: CGPoint(x: 0, y: -1294)),
            
            Level(grounds: [], spikes: [], playerSpawn: CGPoint.zero, safePoint: CGPoint(x: 0, y: -400))
        ]
    )
    
    private init(levels: [Level]){
        self.levels = levels
    }
    
    var levels : [Level]
}

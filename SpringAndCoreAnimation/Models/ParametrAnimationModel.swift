//
//  ParametrAnimationModel.swift
//  SpringAndCoreAnimation
//
//  Created by BSergio on 12.01.2022.
//



struct ParamerAnimationModel {
    let delay: Float
    let force: Float
    let duration: Float
    
    static func getParametrAnimation() -> ParamerAnimationModel {
        return ParamerAnimationModel(delay: Float.random(in: 0...1),
                                     force: Float.random(in: 0...1),
                                     duration: Float.random(in: 0...1.5))
    }
}

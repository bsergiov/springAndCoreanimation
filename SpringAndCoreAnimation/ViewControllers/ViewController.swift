//
//  ViewController.swift
//  SpringAndCoreAnimation
//
//  Created by BSergio on 11.01.2022.
//

import Spring
import CoreGraphics

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var animationButton: UIButton!
    
    
    @IBOutlet weak var sampleSprinView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    // MARK: - Private Properties
    private let animations = Spring.AnimationPreset.allCases
    private let curves = Spring.AnimationCurve.allCases
    private var nextAnimationIndex = 0
    private var nextCurveIndex = 0
    
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IB Action
    @IBAction func changedAnimation(_ sender: UIButton) {
        let parametrAnimation = ParamerAnimationModel.getParametrAnimation()
        
        sampleSprinView.animation = animations[nextAnimationIndex].rawValue
        sampleSprinView.curve = curves[nextCurveIndex].rawValue
        sampleSprinView.delay = CGFloat(parametrAnimation.delay)
        sampleSprinView.force = CGFloat(parametrAnimation.force)
        sampleSprinView.duration = CGFloat(parametrAnimation.duration)
        
        sampleSprinView.animate()
        setupNextAnimation()
    }
    

}

// MARK: - Private methods
extension ViewController {
    private func setupNextAnimation() {
       
        if nextAnimationIndex < animations.count {
            nextAnimationIndex += 1
        } else {
            nextAnimationIndex = 0
        }
        
        if nextCurveIndex < curves.count {
            nextCurveIndex += 1
        } else {
            nextCurveIndex = 0
        }
        
    }
}


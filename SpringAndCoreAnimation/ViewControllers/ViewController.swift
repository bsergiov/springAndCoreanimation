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
        showParamsOnScreen(animation: sampleSprinView.animation,
                           curve: sampleSprinView.curve,
                           force: sampleSprinView.force,
                           duration: sampleSprinView.duration,
                           delay: sampleSprinView.delay)
        
        
        animationButton.setTitle("Run \(animations[nextAnimationIndex].rawValue)",
                                 for: .normal)
    }
    
    // MARK: - IB Action
    @IBAction func changedAnimation(_ sender: UIButton) {
        let parametrAnimation = ParamerAnimationModel.getParametrAnimation()
        
        let animation = animations[nextAnimationIndex].rawValue
        let curve = curves[nextCurveIndex].rawValue
        
        let delay = CGFloat(parametrAnimation.delay)
        let force = CGFloat(parametrAnimation.force)
        let duration = CGFloat(parametrAnimation.duration)
        
        setupAnimation(delay: delay,
                       force: force,
                       duration: duration)
        
        setupNextAnimation()
        
        showParamsOnScreen(animation: animation,
                           curve: curve,
                           force: force,
                           duration: duration,
                           delay: delay)
        
        sender.setTitle("Run \(animations[nextAnimationIndex].rawValue)",
                        for: .normal)
        
        
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
    
    private func showParamsOnScreen(animation: String, curve: String, force: CGFloat, duration: CGFloat, delay: CGFloat) {
        presetLabel.text = "Preset: \(animation)"
        curveLabel.text = "Curve: \(curve)"
        
        forceLabel.text = "Force: \(Float(round(100 * force) / 100))"
        durationLabel.text = "Duration: \(Float(round(100 * duration) / 100))"
        delayLabel.text = "Delay: \(Float(round(100 * delay) / 100))"
    }
    
    private func setupAnimation(delay: CGFloat, force: CGFloat, duration: CGFloat) {
        sampleSprinView.animation = animations[nextAnimationIndex].rawValue
        sampleSprinView.curve = curves[nextCurveIndex].rawValue
        sampleSprinView.delay = delay
        sampleSprinView.force = force
        sampleSprinView.duration = duration
        
        sampleSprinView.animate()
    }
}


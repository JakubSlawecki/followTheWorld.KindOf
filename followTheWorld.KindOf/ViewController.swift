//
//  ViewController.swift
//  followTheWorld.KindOf
//
//  Created by Jakub Slawecki on 16.07.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    @IBAction func add(_ sender: Any) {
        
        let pyramid = SCNNode()
        pyramid.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        pyramid.position = SCNVector3(0, 0, -0.5)
        pyramid.eulerAngles = SCNVector3(90.degreesToRadians, 0, 45.degreesToRadians)
        
        let pyramid2 = SCNNode()
        pyramid2.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        pyramid2.geometry?.firstMaterial?.specular.contents = UIColor.white
        pyramid2.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        pyramid2.position = SCNVector3(0, 0, 0)
        pyramid2.eulerAngles = SCNVector3(180.degreesToRadians, 0, 0)
        
        self.sceneView.scene.rootNode.addChildNode(pyramid)
        pyramid.addChildNode(pyramid2)
        
//        let node = SCNNode()  // node is simply possition in space, it's not visible by itself
//        node.geometry = SCNPyramid(width: 0.1, height: 0.07, length: 0.1)
//        node.geometry?.firstMaterial?.specular.contents = UIColor.white // reflecting in white collor
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
//        node.position = SCNVector3(0.2, 0.3, -0.2)
//
//        let boxNode = SCNNode()
//        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
//        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.white // reflecting in white collor
//        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
//        boxNode.position = SCNVector3(0, -0.05, 0)
//
//        let dorNode = SCNNode()
//        dorNode.geometry = SCNPlane(width: 0.02, height: 0.05)
//        dorNode.geometry?.firstMaterial?.specular.contents = UIColor.white // reflecting in white collor
//        dorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
//        dorNode.position = SCNVector3(0, -0.025, 0.051)
//
//        self.sceneView.scene.rootNode.addChildNode(node)
//        node.addChildNode(boxNode)
//        boxNode.addChildNode(dorNode)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartTheSession()
    }
    
    func restartTheSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    

}

extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}







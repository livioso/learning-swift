//
//  SceneViewController.swift
//  Cacl
//
//  Created by Livio Bieri on 24/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation
import Cocoa
import SceneKit
import QuartzCore

class SceneViewController: NSObject,NSApplicationDelegate {
    
    @IBOutlet var sceneview: SCNView
    
    @IBOutlet var status: NSTextField
    var statusCounter: Int = 1

    
    @IBAction func paintRectButton (sender: AnyObject) {
        status.stringValue = "Paint (#\(statusCounter++))"
        
        var scene: SCNScene = SCNScene()
        
        var cameraNode: SCNNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 15, 30)
        cameraNode.transform = CATransform3DRotate(cameraNode.transform, -M_PI/7.0, 1, 0, 0)
        scene.rootNode.addChildNode(cameraNode)
        
        var spotlight: SCNLight = SCNLight()
        spotlight.type = SCNLightTypeSpot
        spotlight.color = NSColor.redColor()
        
        var spotlightNode: SCNNode = SCNNode()
        spotlightNode.light = spotlight
        spotlightNode.position = SCNVector3Make(-2, 1, 0)
        
        cameraNode.addChildNode(spotlightNode)
        
        let boxSide = 15.0
        var box: SCNBox =
            SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0)
        
        var boxNode: SCNNode = SCNNode(geometry: box)
        boxNode.transform = CATransform3DMakeRotation(M_PI_2/3, 0, 1, 0)
        
        scene.rootNode.addChildNode(boxNode)
        
        sceneview.scene = scene
        sceneview.showsStatistics = true
        sceneview.allowsCameraControl = true
    }
}
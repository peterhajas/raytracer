//
//  RaytracerView.swift
//  raytracer_app
//
//  Created by Peter Hajas on 5/19/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Cocoa

class RaytracerView : NSView {
    var camera = Vector3D(a: 0, b: 0, c: -1000) {
        didSet {
            needsDisplay = true
        }
    }
    let sampleSphere = Sphere(center: Vector3D(a: 100, b: -100, c: 1000), radius: 200)
    let sampleSphere2 = Sphere(center: Vector3D(a: -100, b: 100, c: 800), radius: 50)
    let light = Vector3D(a: -5000, b: -5000, c: -5000)
    
    var world: World {
        let imagePlane = ImagePlane3D(center: Vector3D(a: camera.a, b: camera.b, c: camera.c + 1000),
                                      width: Double(bounds.width),
                                      height: Double(bounds.height))
        return World(camera: camera,
                     imagePlane: imagePlane,
                     objects: [sampleSphere,  sampleSphere2],
                     lights: [light])
    }
    
    override func updateLayer() {
        let image = imageFromWorld(world, size: bounds.size)
        layer?.contents = image
    }
    
    override func keyDown(with event: NSEvent) {
        let moveAmount: Double = 100
        if let characters = event.characters {
            switch characters {
            case "w":
                camera = camera + Vector3D(a: 0, b: 0, c: moveAmount)
            case "a":
                camera = camera + Vector3D(a: -moveAmount, b: 0, c: 0)
            case "s":
                camera = camera + Vector3D(a: 0, b: 0, c: -moveAmount)
            case "d":
                camera = camera + Vector3D(a: moveAmount, b: 0, c: 0)
            default:
                break
            }
        }
        print(event)
    }
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        becomeFirstResponder()
    }
    
    override var acceptsFirstResponder: Bool { return true }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }
    
    override var wantsUpdateLayer: Bool { return true }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

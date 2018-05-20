//
//  Tracer3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/18/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import CoreGraphics

func imageFromWorld(_ world: World, size: CGSize) -> CGImage {
    // OK, so we're going to start at the camera position and strike towards the
    // image frame a bunch of rays
    
    let bitmapContext = CGContext(data: nil,
                                  width: Int(size.width),
                                  height: Int(size.height),
                                  bitsPerComponent: 8,
                                  bytesPerRow: 4 * Int(size.width),
                                  space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    let bitmapPointer = bitmapContext.data!.assumingMemoryBound(to: UInt8.self)
    
    DispatchQueue.concurrentPerform(iterations: Int(size.width)) { (x) in
        for y in 0..<Int(size.height) {
            var red = UInt8(255)
            var green = UInt8(255)
            var blue = UInt8(255)
            var alpha = UInt8(255)
            
            let percentageIntoX = Double(x) / Double(size.width)
            let percentageIntoY = Double(y) / Double(size.height)
            
            // Find the point on the plane that this ray is pointing to
            let locationXInPlaneCoordianteSpace = percentageIntoX * world.imagePlane.width
            let locationYInPlaneCoordianteSpace = percentageIntoY * world.imagePlane.height
            let pointOnPlane = Vector3D(a: world.imagePlane.origin.a + locationXInPlaneCoordianteSpace,
                                        b: world.imagePlane.origin.b + locationYInPlaneCoordianteSpace,
                                        c: world.imagePlane.origin.c)
            
            // Cast a ray from the camera to the point on the plane
            let ray = Ray3D(origin: world.camera, target: pointOnPlane)
            for object in world.objects {
                let objectsOtherThanThisObject = world.objects
                if let intersectionPoint = object.intersectionPointWithRay(ray) {
                    let intersectionNormal = Ray3D(origin: object.center, target: intersectionPoint).direction.unitVector
                    for light in world.lights {
                        let rayFromIntersectionToLight = Ray3D(origin: intersectionPoint,
                                                               target: light)
                        var shouldApplyLight = true
                        for otherObject in world.objects {
                            if otherObject.center == object.center {
                                continue
                            }
                            if let _ = otherObject.intersectionPointWithRay(rayFromIntersectionToLight) {
                                shouldApplyLight = false
                                break
                            }
                        }
                        
                        let color: UInt8
                        
                        if shouldApplyLight {
                            let lighting = intersectionNormal.dot((light - intersectionPoint).unitVector)
                            color = UInt8(clamping: Int(lighting * 255))
                        }
                        else {
                            color = UInt8(0)
                        }
                        
                        red = color
                        green = color/2
                        blue = color/10
                    }
                }
                else {
                }
                
                bitmapPointer[x*4   + y*Int(size.width)*4] = red
                bitmapPointer[x*4+1 + y*Int(size.width)*4] = green
                bitmapPointer[x*4+2 + y*Int(size.width)*4] = blue
                bitmapPointer[x*4+3 + y*Int(size.width)*4] = alpha
            }
        }
    }
    
    let cgImage = bitmapContext.makeImage()
    return cgImage!
}

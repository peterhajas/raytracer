//
//  Tracer3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/18/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import CoreGraphics

func imageFromWorld(_ world: World, size: CGSize) {
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
    
    for x in 0..<Int(size.width) {
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
            let pointOnPlane = Vector3D(a: imagePlane.origin.a + locationXInPlaneCoordianteSpace,
                                        b: imagePlane.origin.b + locationYInPlaneCoordianteSpace,
                                        c: imagePlane.origin.c)
            
            // Cast a ray from the camera to the point on the plane
            let ray = Ray3D(origin: camera, target: pointOnPlane)
            for object in world.objects {
                if let intersectionPoint = object.intersectionPointWithRay(ray) {
                    red = 0
                    green = 0
                    blue = 0
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
    print(cgImage)
}

//
//  2DExample.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

func run2DExample() {
    // Let us start with our camera, at the origin
    let camera = Point2D(x: 0, y: 0)
    
    // and our image plane, which is farther along the X axis
    let imagePlaneX: Double = 5
    let imagePlaneHeightInWorld: Double = 2
    let imagePlane = Plane2D(startPoint: Point2D(x: imagePlaneX, y: imagePlaneHeightInWorld/2), endPoint: Point2D(x: imagePlaneX, y: -imagePlaneHeightInWorld/2))
    
    // The image plane has some dimension that we're interested in
    let imagePlanePixelDimension: Double = 100
    
    // Next, let's create our object in the world
    let object = Plane2D(startPoint: Point2D(x: imagePlaneX * 2, y: -1), endPoint: Point2D(x: imagePlaneX * 2, y: 1))
    
    // Our 1-bit output array
    var output = [Int]()
    
    // Now, we'll loop through all the pixels in the image plane to do our testing
    for i in 0..<Int(imagePlanePixelDimension) {
        // Find our proportion for i
        let fraction = Double(i) / imagePlanePixelDimension
        
        // Find the point on the plane for this fraction
        let imagePlanePoint = Point2D.valueBetween(start: imagePlane.startPoint, end: imagePlane.endPoint, fraction: fraction)
        
        // We're starting at the camera, and moving towards this point. Make our ray
        let ray = Ray2D(pointAtT0: camera, pointAtT1: imagePlanePoint)
        
        // If this ray intersects the object, we hit. Otherwise, we did not
        if let _ = object.intersectionWithRay(ray) {
            output.append(1)
        }
        else {
            output.append(0)
        }
    }
    
    print(output)
}

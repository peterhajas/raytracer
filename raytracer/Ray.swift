//
//  Ray.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Ray2D {
    let pointAtT0: Point2D
    let pointAtT1: Point2D
    
    func pointAtT(_ t: Double) -> Point2D {
        return Point2D.valueBetween(start: pointAtT0, end: pointAtT1, fraction: t)
    }
    
    var lineRepresentation: Plane2D {
        // Very lazy
        let endPoint = pointAtT(10)
        return Plane2D(startPoint: pointAtT0, endPoint: endPoint)
    }
}

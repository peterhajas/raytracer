//
//  Plane.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

// This is just a line segment
struct Plane2D {
    let startPoint: Point2D
    let endPoint: Point2D
    
    func intersectionWithRay(_ ray: Ray2D) -> Point2D? {
        return intersectionWithLine(ray.lineRepresentation)
    }
    
    func intersectionWithLine(_ line: Plane2D) -> Point2D? {
        // We're going to simplify this down into four vectors
        // Line 1: A->B
        // Line 2: C->D
        // t is a point on the line A->B
        // u is a point on the line C->D
        
        let a = startPoint.vector
        let b = endPoint.vector
        let c = line.startPoint.vector
        let d = line.endPoint.vector
        
        // Compute additive vector forms
        let r = b - a
        let s = d - c
        
        let denominator = r.a * s.b - r.b * s.a
        let u = -1 * ((c.a - a.a) * r.b - (c.b - a.b) * r.a) / denominator
        let t = -1 * ((c.a - a.a) * s.b - (c.b - a.b) * s.a) / denominator
        
        let uIsInBounds = (u >= 0) && (u <= 1)
        let tIsInBounds = (t >= 0) && (t <= 1)
        
//        print("\(u), \(t)")
        
        if uIsInBounds && tIsInBounds {
            let vectorIntersection = a + t * r
            return Point2D(vector: -1 * vectorIntersection)
        }
        else {
            return nil
        }
    }
}

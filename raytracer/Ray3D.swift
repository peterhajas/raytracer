//
//  Ray3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Ray3D {
    let origin: Vector3D
    let direction: Vector3D
    
    init(origin: Vector3D, direction: Vector3D) {
        self.origin = origin
        self.direction = direction
    }
    
    init(origin: Vector3D, target: Vector3D) {
        self.origin = origin
        let vectorToTarget = (target - origin)
        self.direction = vectorToTarget.unitVector
    }
    
    func pointTravelingDistance(_ distance: Double) -> Vector3D {
        let unitDirection = direction.unitVector
        let delta = unitDirection * distance
        
        return origin + delta
    }
    
    func pointAtT(_ t: Double, withPointAtT1: Vector3D) -> Vector3D {
        return Vector3D.valueBetween(start: origin, end: withPointAtT1, fraction: t)
    }
}

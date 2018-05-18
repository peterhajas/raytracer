//
//  Sphere.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

struct Sphere {
    let center: Vector3D
    let radius: Double
}

extension Sphere : RayIntersecting {
    func intersectionPointWithRay(_ ray: Ray3D) -> Vector3D? {
        let vectorToSphereCenter = center - ray.origin
        
        // Compute ray from ray origin to sphere center
        let rayToSphereCenter = Ray3D(origin: ray.origin, target: center)
        
        // Get the dot product of this and ray
        let dot = ray.direction.dot(rayToSphereCenter.direction)
        
        // a•b = ||a|| ||b|| cos (theta)
        let magnitudeRay = ray.direction.length
        let magnitudeRayToSphereCenter = rayToSphereCenter.direction.length
        let magnitudes = magnitudeRay*magnitudeRayToSphereCenter
        
        // dot / magnitudes = cos(theta)
        // acos(dot / magnitudes) = theta
        let dotsOverMagnitudes = dot / magnitudes
        let theta = acos(dotsOverMagnitudes)
        
        print(theta)
        
        return nil
    }
}

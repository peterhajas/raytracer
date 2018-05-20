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
        // Compute ray from ray origin to sphere center
        let rayToSphereCenter = Ray3D(origin: ray.origin, target: center)
        
        // Get the dot product of this and ray
        let dot = ray.direction.dot(rayToSphereCenter.direction)
        
        // a•b = ||a|| ||b|| cos (theta)
        let magnitudeRay = ray.direction.length
        let magnitudeRayToSphereCenter = rayToSphereCenter.direction.length
        let magnitudes = magnitudeRay*magnitudeRayToSphereCenter
        
        // dot / magnitudes = cos(theta)
        let cosTheta = dot / magnitudes
        
        // This is the adjacent to the hypotenuse ratio
        // Hypotenuse in this case is origin to sphere center
        let hypotenuse = Vector3D.distanceBetween(start: ray.origin, end: center)
        
        // cos(theta) = origin to closest point on sphere /
        //              hypotenuse
        
        // origin to closest point on sphere = cos(theta) * hypotenuse
        let lengthFromOriginToClosestPointOnSphere = cosTheta * hypotenuse
        let pointOnRayClosestToSphere = ray.pointTravelingDistance(lengthFromOriginToClosestPointOnSphere)
        
        // The distance between pointOnRayClosestToSphere and center is greater
        // than radius, they don't match
        let distanceToClosestPoint = Vector3D.distanceBetween(start: pointOnRayClosestToSphere, end: center)
        
        if distanceToClosestPoint > radius { return nil }
        
        // Now we need to find the distances to travel from this closest point
        // to find the intersections
        // We have a right triangle that has a hypotenuse equal to the radius
        // of the circle and an edge that is the distance from the closest point
        // to the center
        let distanceFromClosestPointToCenter = Vector3D.distanceBetween(start: pointOnRayClosestToSphere, end: center)
        
        // radius^2 = distanceFromClosestPointToCenter^2 +
        //            distanceFromClosestPointToIntersections^2
        //
        // distanceFromClosestPointToIntersections^2 = radius^2 -
        //                                             distanceFromClosestPointToCenter^2
        let distanceFromClosestPointToIntersectionsSquared = (radius*radius) - (distanceFromClosestPointToCenter*distanceFromClosestPointToCenter)
        
        let distanceFromClosestPointToIntersections = sqrt(distanceFromClosestPointToIntersectionsSquared)
        
        // Now that we have the intersection distances from the closest point,
        // travel along the ray by the distance from the origin to the closest
        // point +/- distanceFromClosestPointToIntersections
        let distanceToIntersection1 = lengthFromOriginToClosestPointOnSphere + distanceFromClosestPointToIntersections
        let distanceToIntersection2 = lengthFromOriginToClosestPointOnSphere - distanceFromClosestPointToIntersections
        
        let intersection1 = ray.pointTravelingDistance(distanceToIntersection1)
        let intersection2 = ray.pointTravelingDistance(distanceToIntersection2)
        
        return intersection2
    }    
}

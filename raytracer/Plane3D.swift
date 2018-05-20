//
//  Plane3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/19/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Plane3D {
    var origin: Vector3D
    var normal: Vector3D
}

extension Plane3D : RayIntersecting {
    func intersectionPointWithRay(_ ray: Ray3D) -> Vector3D? {
        return nil
    }
}

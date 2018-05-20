//
//  Plane3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/19/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Plane3D {
    var center: Vector3D
    var normal: Vector3D
}

extension Plane3D : Object3D {
    func intersectionPointWithRay(_ ray: Ray3D) -> Vector3D? {
        return nil
    }
}

//
//  Object3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

protocol Object3D {
    // Returns nil if it does not intersect
    func intersectionPointWithRay(_ ray: Ray3D) -> Vector3D?
    
    var center: Vector3D { get }
}

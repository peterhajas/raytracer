//
//  World3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/18/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct World {
    let camera: Vector3D
    let imagePlane: ImagePlane3D
    
    let objects: [RayIntersecting]
    let lights: [Vector3D]
}

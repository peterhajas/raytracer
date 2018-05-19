//
//  main.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

let sampleSphere = Sphere(center: Vector3D(a: 10, b: 10, c: 11), radius: 5)
let camera = Vector3D(a: 0, b: 0, c: 0)

// Put the image plane a bit in front of the camera
let imagePlane = Plane3D(center: Vector3D(a: 0, b: 0, c: 1), width: 3, height: 3)

let world = World(camera: camera, imagePlane: imagePlane, objects: [sampleSphere])

imageFromWorld(world, size: CGSize(width: 10, height: 10))

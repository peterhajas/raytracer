//
//  main.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

let sampleSphere = Sphere(center: Vector3D(a: 10, b: 10, c: 10), radius: 5)
let camera = Vector3D(a: 0, b: 0, c: -4)

// Put the image plane a bit in front of the camera
let imagePlane = ImagePlane3D(center: Vector3D(a: 0, b: 0, c: 0), width: 5, height: 5)

let world = World(camera: camera, imagePlane: imagePlane, objects: [sampleSphere])

//imageFromWorld(world, size: CGSize(width: 500, height: 500))

let sampleRay = Ray3D(origin: Vector3D(1), target: sampleSphere.center)
let intersection = sampleSphere.intersectionPointWithRay(sampleRay)
print(intersection)

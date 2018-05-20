//
//  main.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

let sampleSphere = Sphere(center: Vector3D(a: 100, b: -100, c: 1000), radius: 200)
let camera = Vector3D(a: 0, b: 0, c: -1000)
let ground = Plane3D(center: Vector3D(-10), normal: Vector3D(a: 0, b: 1, c: 0))
let light = Vector3D(a: -5000, b: 5000, c: -5000)

// Put the image plane a bit in front of the camera
let imagePlane = ImagePlane3D(center: Vector3D(a: 0, b: 0, c: 0), width: 500, height: 500)

let world = World(camera: camera, imagePlane: imagePlane, objects: [sampleSphere, ground], lights: [light])

let image = imageFromWorld(world, size: CGSize(width: 1000, height: 1000))
print(image)

//let sampleRay = Ray3D(origin: Vector3D(1), target: sampleSphere.center)
//let intersection = sampleSphere.intersectionPointWithRay(sampleRay)
//print(intersection)

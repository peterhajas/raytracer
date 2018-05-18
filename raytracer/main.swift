//
//  main.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

let sampleSphere = Sphere(center: Vector3D(a: 10, b: 10, c: 11), radius: 5)

for i in 1..<10 {
    let t1Location = Double(i) * 10
    let sampleRay = Ray3D(origin: Vector3D(a: 0, b: 0, c: 0), target: Vector3D(t1Location))
    let _ = sampleSphere.intersectionPointWithRay(sampleRay)
}

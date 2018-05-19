//
//  Plane3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/18/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct ImagePlane3D {
    let center: Vector3D
    let width: Double
    let height: Double
    
    var origin: Vector3D {
        return Vector3D(a: center.a - (width/2),
                        b: center.b - (height/2),
                        c: center.c)
    }
}

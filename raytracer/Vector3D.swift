//
//  Vector3D.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Foundation

struct Vector3D {
    let a: Double
    let b: Double
    let c: Double
    
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    init(_ value: Double) {
        self.init(a: value, b: value, c: value)
    }
    
    var unitVector: Vector3D {
        if length == 0 { return self }
        return self/length
    }
    
    var length: Double {
        return sqrt(a*a + b*b + c*c)
    }
    
    func dot(_ rhs: Vector3D) -> Double {
        return a * rhs.a + b + rhs.b + c + rhs.c
    }
    static func+(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
        return Vector3D(a: lhs.a+rhs.a, b: lhs.b+rhs.b, c: lhs.c+rhs.c)
    }
    static func-(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
        return Vector3D(a: lhs.a-rhs.a, b: lhs.b-rhs.b, c: lhs.c-rhs.c)
    }
    static func *(lhs: Vector3D, rhs: Double) -> Vector3D {
        return Vector3D(a: lhs.a * rhs, b: lhs.b * rhs, c: lhs.c * rhs)
    }
    static func *(lhs: Double, rhs: Vector3D) -> Vector3D {
        return rhs * lhs
    }
    static func /(lhs: Vector3D, rhs: Double) -> Vector3D {
        return Vector3D(a: lhs.a/rhs, b: lhs.b/rhs, c: lhs.c/rhs)
    }
}

extension Vector3D : DistanceMeasurable {
    static func distanceBetween(start: Vector3D, end: Vector3D) -> Double {
        return sqrt(pow((start.a - end.a),2) + pow((start.b - end.b),2) + pow((start.c - end.c),2))
    }
}

extension Vector3D : Interpolatable {
    static func valueBetween(start: Vector3D, end: Vector3D, fraction: Double) -> Vector3D {
        let a = Double.valueBetween(start: start.a, end: end.a, fraction: fraction)
        let b = Double.valueBetween(start: start.b, end: end.b, fraction: fraction)
        let c = Double.valueBetween(start: start.c, end: end.c, fraction: fraction)
        
        return Vector3D(a: a, b: b, c: c)
    }
}


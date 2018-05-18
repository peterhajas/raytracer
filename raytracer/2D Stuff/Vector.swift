//
//  Vector.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Vector2D {
    let a: Double
    let b: Double
    
    static func +(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(a: lhs.a + rhs.a, b: lhs.b + rhs.b)
    }
    static func -(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(a: rhs.a - lhs.a, b: rhs.b - lhs.b)
    }
    static func *(lhs: Vector2D, rhs: Double) -> Vector2D {
        return Vector2D(a: lhs.a * rhs, b: lhs.b * rhs)
    }
    static func *(lhs: Double, rhs: Vector2D) -> Vector2D {
        return Vector2D(a: rhs.a * lhs, b: rhs.b * lhs)
    }
}

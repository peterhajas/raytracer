//
//  Point.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

struct Point2D : Equatable {
    let x: Double
    let y: Double
    
    var vector: Vector2D {
        return Vector2D(a: x, b: y)
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(vector: Vector2D) {
        self.x = vector.a
        self.y = vector.b
    }
}

extension Point2D : Interpolatable {
    static func valueBetween(start: Point2D, end: Point2D, fraction: Double) -> Point2D {
        let x = Double.valueBetween(start: start.x, end: end.x, fraction: fraction)
        let y = Double.valueBetween(start: start.y, end: end.y, fraction: fraction)
        return Point2D(x: x, y: y)
    }
}

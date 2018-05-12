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

func pointBetweenPoints(start: Point2D, end: Point2D, fraction: Double) -> Point2D {
    let xInterval = end.x - start.x
    let yInterval = end.y - start.y
    
    let xStep = fraction * xInterval
    let yStep = fraction * yInterval
    
    return Point2D(x: start.x + xStep, y: start.y + yStep)
}

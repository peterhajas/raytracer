//
//  Interpolatable.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

// A handy protocol for tweening
protocol Interpolatable {
    static func valueBetween(start: Self, end: Self, fraction: Double) -> Self
}

extension Double : Interpolatable {
    static func valueBetween(start: Double, end: Double, fraction: Double) -> Double {
        let range = end - start
        let offset = range * fraction
        return start + offset
    }
}

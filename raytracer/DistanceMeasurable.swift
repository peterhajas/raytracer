//
//  DistanceMeasurable.swift
//  raytracer
//
//  Created by Peter Hajas on 5/12/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

protocol DistanceMeasurable {
    static func distanceBetween(start: Self, end: Self) -> Double
}

extension Double : DistanceMeasurable {
    static func distanceBetween(start: Double, end: Double) -> Double {
        return end - start
    }
}

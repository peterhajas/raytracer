//
//  AppDelegate.swift
//  raytracer_app
//
//  Created by Peter Hajas on 5/19/18.
//  Copyright © 2018 Peter Hajas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    let raytracerView = RaytracerView()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentView = raytracerView
    }
}


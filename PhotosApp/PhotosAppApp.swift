//
//  PhotosAppApp.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import SwiftUI

@main
struct PhotosAppApp: App {
    let initialView: TabBarView
    
    init() {
        URLCache.shared.memoryCapacity = 10_000_000
        URLCache.shared.diskCapacity = 1_000_000_000
        initialView = TabBarView()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                initialView
            }
        }
    }
}

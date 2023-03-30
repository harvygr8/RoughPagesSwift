//
//  RoughPagesApp.swift
//  RoughPages
//
//  Created by Harvinder Laliya on 3/20/23.
//

import SwiftUI

import FirebaseCore


@main
struct RoughPagesApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

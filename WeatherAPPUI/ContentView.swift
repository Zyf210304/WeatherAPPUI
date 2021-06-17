//
//  ContentView.swift
//  WeatherAPPUI
//
//  Created by 张亚飞 on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //since window is decrepted in ios 15...
        //getting safe area using geometry reader
        
        GeometryReader { proxy in
            
            let topEdge = proxy.safeAreaInsets.top
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
            
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

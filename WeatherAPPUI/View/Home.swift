//
//  Home.swift
//  WeatherAPPUI
//
//  Created by 张亚飞 on 2021/6/17.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ZStack {
            
            GeometryReader { proxy in
                
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            
            // mianview ..
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    //weather Data...
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text("San Jose")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        
                        Text(" 90° ")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        
                        Text("H:113° L:105°")
                            .foregroundStyle(.primary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                    
                    //custome data view...
                    VStack(spacing: 8) {
                        
                        //custom Stack
                        CustomStackView {
                            
                            // label Here...
                            Label {
                                
                                Text("Hourly Forecast")
                            } icon: {
                                
                                Image(systemName: "clock")
                            }

                            
                        } contentView: {
                            
                            //content...
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                
                            }
                        }
                    }
                }
                .padding(.top, 25)
                .padding([.horizontal, .bottom])
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  Home.swift
//  WeatherAPPUI
//
//  Created by 张亚飞 on 2021/6/17.
//

import SwiftUI

struct Home: View {
    
    @State var offset: CGFloat = 0
    
    var topEdge: CGFloat
    
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
                            .opacity(getTitleOpactiy())
                        
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("H:113° L:105°")
                            .foregroundStyle(.primary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                    }
                    .offset(y: -offset)
                    //For bottom drag effect...
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
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
                                
                                HStack(spacing: 15) {
                                    
                                    ForecastView(time:"12 AM", celcius: 97, image: "sun.min")
                                    
                                    ForecastView(time:"1 PM", celcius: 97, image: "sun.haze")
                                    
                                    ForecastView(time:"2 PM", celcius: 97, image: "sun.min")
                                    
                                    ForecastView(time:"3 PM", celcius: 97, image: "cloud.sun")
                                    
                                    ForecastView(time:"4 PM", celcius: 97, image: "sun.haze")
                                    
                                    ForecastView(time:"5 PM", celcius: 97, image: "sun.haze")
                                    
                                    ForecastView(time:"6 PM", celcius: 97, image: "sun.haze")
                                }
                            }
                        }
                        
                        WeatherDataView()
                        
                    }
                }
                .padding(.top, 25)
                .padding(.top, topEdge)
                .padding([.horizontal, .bottom])
                //getting offset
                .overlay(
                
                    GeometryReader { proxy -> Color in
                    
                        let minY = proxy.frame(in: .global).minY
                    
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return Color.clear
                    }
                )
                
            }
        }
    }
    
    func getTitleOpactiy() -> CGFloat {
        
        let titleOffset = -getTitleOffset()
        
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }

    func  getTitleOffset() -> CGFloat {
        
        //setting one max height for whole title...
        //consider max as 120...
        
        if offset < 0 {
            let progress = -offset / 120
            
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            
            return -newOffset
        }
       
        return 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ForecastView: View {
    
    var time: String
    var celcius: CGFloat
    var image: String
    
    var body: some View {
        VStack(spacing: 15) {
            
            
            Text(time)
                .font(.callout.bold())
                .foregroundStyle(.white)
            
            Image(systemName: image)
                .font(.title2)
            // multicolor
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
                .frame(height: 30)
            
            Text("\(Int(celcius))°")
                .font(.callout.bold())
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
    }
}

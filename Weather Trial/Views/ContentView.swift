//
//  ContentView.swift
//  Weather Trial
//
//  Created by Carter Ewen on 3/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var LocationManager = locationManager()
    var WeatherManager = weatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            
            if let location = LocationManager.location {
                if let weather = weather {
                    weatherView(weather: weather)
                } else {
                    loadingView()
                        .task {
                            do {
                                weather = try await WeatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("error getting weather \(error)")
                            }
                        }
                }
            } else {
                if LocationManager.isLoading {
                    loadingView()
                } else {
                    welcomeView()
                        .environmentObject(LocationManager)
                }
                
            }
        }
        .background(Color(hue: 0.652, saturation: 0.964, brightness: 0.47))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

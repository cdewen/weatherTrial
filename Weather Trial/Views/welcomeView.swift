//
//  welcomeView.swift
//  Weather Trial
//
//  Created by Carter Ewen on 3/14/23.
//

import SwiftUI
import CoreLocationUI

struct welcomeView: View {
    @EnvironmentObject var LocationManager: locationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App").bold().font(.title)
                Text("Please share your current location").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                LocationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
    }
}

//
//  loadingView.swift
//  Weather Trial
//
//  Created by Carter Ewen on 3/14/23.
//

import SwiftUI

struct loadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
    }
}

struct loadingView_Previews: PreviewProvider {
    static var previews: some View {
        loadingView()
    }
}

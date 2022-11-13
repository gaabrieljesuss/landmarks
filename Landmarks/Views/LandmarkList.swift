//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Gabriel Jesus on 11/11/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                List(landmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }.scrollContentBackground(.hidden)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

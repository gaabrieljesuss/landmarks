//
//  CategoryHome.swift
//  Landmarks
//
//  Created by user230124 on 11/14/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                List {
                    Text("Featured")
                        .font(.title)
                        .bold()
                        .listRowInsets(EdgeInsets())
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }.listRowInsets(EdgeInsets())
                    
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

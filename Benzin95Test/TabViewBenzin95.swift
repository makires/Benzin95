//
//  SwiftUIView.swift
//  Benzin95Test
//
//  Created by Tatiana Ilvutikova on 12.11.2020.
//

import SwiftUI

struct TabViewBenzin95: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Image(systemName: "x.squareroot")
                    Text("Калькулятор")
                }
            ListHistory()
                .tabItem { Image(systemName: "text.badge.plus")
                    Text("Журнал") }
        }
       
    }
}

struct TabViewBenzin95_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBenzin95()
    }
}

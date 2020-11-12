//
//  ListHistory.swift
//  Benzin95Test
//
//  Created by Tatiana Ilvutikova on 12.11.2020.
//

import SwiftUI

struct ListHistory: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ListHistory_Previews: PreviewProvider {
    static var previews: some View {
        ListHistory()
    }
}

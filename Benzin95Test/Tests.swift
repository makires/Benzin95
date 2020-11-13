//
//  Tests.swift
//  Benzin95Test
//
//  Created by Tatiana Ilvutikova on 13.11.2020.
//

import SwiftUI

struct Tests: View {
    @State var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            
            Text("Your username: \(username)")
        }.padding()
    }
}

struct Tests_Previews: PreviewProvider {
    static var previews: some View {
        Tests()
    }
}

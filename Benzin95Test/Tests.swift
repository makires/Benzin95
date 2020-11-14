//
//  Tests.swift
//  Benzin95Test
//
//  Created by Tatiana Ilvutikova on 13.11.2020.
//

import SwiftUI

struct Tests: View {
    let array = ["John","Lena","Steve","Chris","Catalina"]

         @State private var searchText = ""

         var body: some View {


             NavigationView{
               List{
                   TextField("Type your search",text: $searchText)
                       .textFieldStyle(RoundedBorderTextFieldStyle())

                   ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self){names in
                     NavigationLink(destination:keyboardDissmis(text: names)){
                         Text(names)
                       }
                   }
               }
               .navigationBarTitle(Text("Search"))
           }
             .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)})
       
}
}

    func keyboardDissmis(text:String)->Text{
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
       
        return Text(text)
    }

struct Tests_Previews: PreviewProvider {
    static var previews: some View {
        Tests()
    }
}

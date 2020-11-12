//
//  ContentView.swift
//  Benzin95Test
//
//  Created by Tatiana Ilvutikova on 08.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var inputDistance = ""
    @State var inputWhereYouDrive = ""
    @State var inputNumberPeople = "" // add functional
    @State var inputNumberPeopleForPicker = 1
    @State var inputConsumption = "" // add functional
    @State var inputConsumptionForPicker = 3
    @State var pricePerLiter = ""
    
    let chooseConsumptionForSubaru = [7,8,9,10,11,12]
    let chooseNumberPeopleForSubaru = [1,2,3,4,5]
    
    var totalPrice: Double {
        let convertInputDistance = Double(inputDistance) ?? 0
        let countPeople = Double(inputNumberPeopleForPicker + 1)
        let convertSelectionConsumption = Double(chooseConsumptionForSubaru[inputConsumptionForPicker])
        let convertPricePerLiter = Double(pricePerLiter) ?? 0
        
        let totalMoney = ( (convertInputDistance*convertSelectionConsumption) / 100 ) * convertPricePerLiter
        return totalMoney
    }
    
    var totalPriceByOne: Double {
        let convertInputDistance = Double(inputDistance) ?? 0
        let countPeople = Double(inputNumberPeopleForPicker + 1)
        let convertSelectionConsumption = Double(chooseConsumptionForSubaru[inputConsumptionForPicker])
        let convertPricePerLiter = Double(pricePerLiter) ?? 0
        
        let totalMoney = ( (convertInputDistance*convertSelectionConsumption) / 100 ) * convertPricePerLiter
        
        let convertSelectionNumberPeopleForPicker = Double(chooseNumberPeopleForSubaru[inputNumberPeopleForPicker])
        let totalMoneyByOne = totalMoney / convertSelectionNumberPeopleForPicker
        return totalMoneyByOne
    }
    
    var body: some View {
        NavigationView {
            
        List {
            Section(header: Text("Всего \(totalPrice, specifier: "%.2f") ₽")) {
                HStack(spacing: 9) {
                    VStack {
                        Text("Сколько проехали ?")
                    }
                    VStack {
                        TextField("🐌 км", text: $inputDistance)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 120, height: 20)
                            .onTapGesture {
                                hideKeyboard()
                            }
                            .keyboardType(.decimalPad)
                    }
                    
                }
            }
            
            HStack(spacing: 40) {
                    VStack {
                        Text("Цена бензина ₽")
                    }
                    VStack {
                        TextField("💰₽", text: $pricePerLiter)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 120, height: 20)
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                        hideKeyboard()
                        }
                    }
                }
               
//                Text("ADD парсинг цен на бенз")
            
//            Section {
//                Text("Куда ездили?")
//                TextField("пункт назначения", text: $inputWhereYouDrive)
//            }
            Section(header: Text("⛽️ Расход ( \(chooseConsumptionForSubaru[inputConsumptionForPicker]) л / 100 км)")) {
                Picker("Расход топлива", selection: $inputConsumptionForPicker) {
                    ForEach(0..<chooseConsumptionForSubaru.count) {
                        Text("\(chooseConsumptionForSubaru[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
//                Text("Ввести вручную")
//                TextField("количество бензина", text: $inputConsumption)
//                    .keyboardType(.decimalPad)
                
            
            }
            Section(header: Text("Сколько человек?")) {

                Picker("Количество человек", selection: $inputNumberPeopleForPicker) {
                    ForEach(0..<chooseNumberPeopleForSubaru.count) {
                        Text("\(chooseNumberPeopleForSubaru[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
//                Text("Ввести вручную")
//
//                TextField("посчитать людей", text: $inputNumberPeople)
//                    .keyboardType(.numberPad)
            }
            
            Text("С каждого \(totalPriceByOne, specifier: "%.2f") ₽")
        }.navigationBarTitle("Benzin95")
        .listStyle(GroupedListStyle())
        }
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

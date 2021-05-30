//
//  ContentView.swift
//  Unit Converter
//
//  Created by Michael Biesheuvel on 13/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 2
    
    let lengthUnits = [
        "mm", "m", "km", "ft", "yd", "mi."
    ]
    
    var baseUnit: Double {
        let input = Double(inputNum) ?? 0
        
        switch lengthUnits[inputUnit] {
        case "mm":
            return input
        case "m":
            return input * 1000
        case "km":
            return input * 1_000_000
        case "ft":
            return input * 304.8
        case "yd":
            return input * 914.4
        case "mi.":
            return input * 1_609_344
        default:
            return 0
        }
    }
    
    var outputNum: Double {
        switch lengthUnits[outputUnit] {
        case "mm":
            return baseUnit
        case "m":
            return baseUnit / 1000
        case "km":
            return baseUnit / 1_000_000
        case "ft":
            return baseUnit / 304.8
        case "yd":
            return baseUnit / 914.4
        case "mi.":
            return baseUnit / 1_609_344
        default:
            return 0
        }
    }
    
    var body: some View {
        VStack {
            Text("Unit Converter")
                .font(.title).bold()
            
            Form {
                Section(header: Text("Input")) {
                    TextField("Input to Convert", text: $inputNum)
                        .keyboardType(.decimalPad)
                    
                    Picker("Select Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Outut")) {
                    Text("\(outputNum, specifier: "%g") \(lengthUnits[outputUnit])")
                    
                    Picker("Select Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

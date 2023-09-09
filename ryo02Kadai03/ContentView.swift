//
//  ContentView.swift
//  ryo02Kadai03
//
//  Created by ryosuke on 2023/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var numText1 = ""
    @State var numText2 = ""
    @State var isChangeToggle1: Bool = false
    @State var isChangeToggle2: Bool = false
    @State var displayNum1 = 0
    @State var displayNum2 = 0
    @State var total = 0
    
    var body: some View {
        VStack {
            HStack {
                numberView(numText: $numText1, isChangeToggle: $isChangeToggle1)
                numberView(numText: $numText2, isChangeToggle: $isChangeToggle2)
            }
            Button("ボタン") {
                calculate()
            }
            .padding()
            HStack {
                Spacer()
                Text("\(displayNum1)")
                Spacer()
                Text("\(displayNum2)")
                Spacer()
            }
            Text("\(total)")
        }
    }
    
    func calculate() {
        var num1 = (Int(numText1)) ?? 0
        var num2 = (Int(numText2)) ?? 0
        
        if isChangeToggle1 {
            num1 = -num1
        }
        if isChangeToggle2 {
            num2 = -num2
        }
        displayNum1 = num1
        displayNum2 = num2
        total = num1 + num2
    }
}

struct numberView: View {
    @Binding var numText: String
    @Binding var isChangeToggle: Bool
    
    var body: some View {
        VStack {
            TextField("入力欄1", text: $numText)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .padding()
            HStack {
                Text("+")
                Toggle("", isOn: $isChangeToggle)
                Text("-")
            }
            .fixedSize()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

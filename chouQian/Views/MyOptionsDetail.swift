//
//  MyOptionsDetail.swift
//  chouQian
//
//  Created by 王珅 on 28/3/20.
//  Copyright © 2020 王珅. All rights reserved.
//

import SwiftUI

struct MyOptionsDetail: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.editMode) var mode
    @State var draftOption = MyOptions.default
    @State private var selectedIndex = 0
    var myOptions: MyOptions
    
    var myOptionsIndex: Int {
        userData.myOptions.firstIndex(where: { $0.id == myOptions.id })!
    }
    
    var body: some View {
        var optionsArray1 = [Options]()
        let optionsArray2 = myOptions.data.components(separatedBy:" ")
        for i in 0..<optionsArray2.count {
            optionsArray1.append(Options(name: optionsArray2[i]))
        }
        return VStack {
            HStack {
                Text(myOptions.name)
                    .font(.title)
                Button(action: {
                    self.userData.myOptions[self.myOptionsIndex].isFavorite.toggle()
                }) {
                    if self.userData.myOptions[self.myOptionsIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                HStack {
                    if self.mode?.wrappedValue == .active {
                        Button("Cancel") {
                            self.draftOption = self.userData.myOptions[self.myOptionsIndex]
                            self.mode?.animation().wrappedValue = .inactive
                        }
                    }
                    Spacer()
                    
                    EditButton()
                        
                }
                
            }
            if self.mode?.wrappedValue == .inactive {
                VStack{
                    Picker(selection: $selectedIndex, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        ForEach(0..<optionsArray1.count) {index in
                            Text(optionsArray1[index].name)
                        }
                    }
                    .frame(width: 300, height: 75)
                    .clipped()
                    
                    Button(action: {
                        let number = Int.random(in: 0 ..< optionsArray1.count)
                        self.selectedIndex=number
                    }) {
                        Text("随机")
                    }
                    
                }
                
            } else {
                OptionEditor(options: $draftOption).onAppear {
                    self.draftOption = self.userData.myOptions[self.myOptionsIndex]
                }
                .onDisappear {
                    self.userData.myOptions[self.myOptionsIndex] = self.draftOption
                }
            }
           
        }
     
    }
}

struct MyOptionsDetail_Previews: PreviewProvider {
    static var previews: some View {       
        MyOptionsDetail(myOptions:myOptionsData[0])
    }
}

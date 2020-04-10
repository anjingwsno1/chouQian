//
//  RowView.swift
//  chouQian
//
//  Created by 王珅 on 30/3/20.
//  Copyright © 2020 王珅. All rights reserved.
//

import SwiftUI

struct MyOptionsRow: View {
    var myOptions: MyOptions
    
    var body: some View {
          HStack {
                  Text(myOptions.name)
                  Spacer()
            
                    if myOptions.isFavorite {
                        Image(systemName: "star.fill")
                            .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
              }
    }
}

struct MyOptionsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           MyOptionsRow(myOptions: myOptionsData[0])
           MyOptionsRow(myOptions: myOptionsData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

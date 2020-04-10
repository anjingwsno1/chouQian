import SwiftUI

struct NewOption: View {
    @EnvironmentObject var userData: UserData
    @State var options: MyOptions

    var body: some View {
        
        return List {
            HStack {
                Text("选项名").bold()
                Divider()
                TextField("选项名", text: $options.name)
            }
            HStack {
                Text("选项").bold()
                Divider()
                TextField("选项(用空格隔开)", text: $options.data)
            }
            HStack {
                Text("*选项请用空格隔开").bold()
            }
            Spacer()
            
            Button(action: {
                self.userData.myOptions.append(self.options)
            }) {
                Text("保存")
            }
        }
    }
}

struct NewOption_Previews: PreviewProvider {
    static var previews: some View {
        Text("Error")
    }
}


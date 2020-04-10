import SwiftUI

struct OptionEditor: View {
    @Binding var options: MyOptions
    
    var body: some View {
        List {
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
        }
    }
}

struct OptionEditor_Previews: PreviewProvider {
    static var previews: some View {
        OptionEditor(options: .constant(.default))
    }
}

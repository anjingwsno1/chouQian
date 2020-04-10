import SwiftUI

struct MyOptionsList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        return NavigationView {
            List{
                NavigationLink(destination: NewOption(options:(.default))) {
                    Text("新建")
                }
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("只显示喜欢")
                }
                ForEach(userData.myOptions) { myOptions in
                    if !self.userData.showFavoritesOnly || myOptions.isFavorite {

                        NavigationLink(destination: MyOptionsDetail(myOptions: myOptions)) {
                            MyOptionsRow(myOptions: myOptions)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("我的"))
            }
    }
}

struct MyOptionsList_Previews: PreviewProvider {
    static var previews: some View {
        MyOptionsList().environmentObject(UserData())
    }
}

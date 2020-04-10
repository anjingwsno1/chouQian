import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack{
            Text("选择困难症福音").font(.title)
            
            TabView{
                Text("社区").tabItem{
                    Image(systemName: "1.circle")
                    Text("社区")
                }.tag(0)
                Text("快捷").tabItem{
                    Image(systemName: "2.circle")
                    Text("快捷")
                }.tag(1)
                MyOptionsList().tabItem{
                    Image(systemName: "3.circle")
                    Text("我的")
                }.tag(2)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

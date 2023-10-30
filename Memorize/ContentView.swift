//Nutchapon Kitkram 6410742156
import SwiftUI

struct ContentView: View {
    let halloween = ["👻", "🎃", "🕷️", "👹", "🧙‍♀️", "🦇", "🍬", "🕯️","👻", "🎃", "🕷️", "👹", "🧙‍♀️", "🦇", "🍬", "🕯️"].shuffled()

    let animals = ["🐶", "🐱", "🐭", "🦊", "🦁", "🦉", "🐨", "🐵","🐶", "🐱", "🐭", "🦊", "🦁", "🦉", "🐨", "🐵"].shuffled()

    let sports = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏓", "🏒", "🏌️","⚽️", "🏀", "🏈", "⚾️", "🎾", "🏓", "🏒", "🏌️"].shuffled()
    @State var themeNumber = 1
    var body: some View {
        VStack {
            Text("Memorize!").foregroundStyle(Color.purple).font(.largeTitle).bold()
            ScrollView {
                if (themeNumber == 1) {
                    showCard(by: halloween, color: .orange)
                }
                else if (themeNumber == 2) {
                    showCard(by: animals, color: .pink)
                }
                else {
                    showCard(by: sports, color: .blue)
                }
            }
            showBottomBars
        }
        .padding()
    }
    
    func showCard(by icon: [String], color: Color) -> some View {
        let shuffledIcon = icon.shuffled()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<shuffledIcon.count, id: \.self) { index in
                    CardView(content: shuffledIcon[index])
                        .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(color)
    }
    
    func showBottomBar (by number: Int , symbol: String, title: String) -> some View {
        VStack {
            Button(action: {
                themeNumber = number
            }, label: {
                Image(systemName: symbol)
            })
            Text(title)
        }
    }
    
    var showBottomBars: some View {
        HStack {
            Halloween
            Spacer()
            Animals
            Spacer()
            Sports
        }
        .padding([.horizontal, .vertical], 40)
        .imageScale(.large)
        .font(.headline)
    }
    
    var Halloween: some View {
        showBottomBar(by: 1 ,symbol: "moon.fill", title: "Halloween").foregroundColor(.orange)
    }
    
    var Animals: some View {
        showBottomBar(by: 2 ,symbol: "dog.fill", title: "Animals").foregroundColor(.pink)
    }
    
    var Sports: some View {
        showBottomBar(by: 3 ,symbol: "sportscourt.fill", title: "Sports").foregroundColor(.blue)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

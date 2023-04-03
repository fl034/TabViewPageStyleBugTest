import SwiftUI

enum Tab: String, Identifiable, Hashable, CaseIterable {
    case green, yellow, red
    
    var id: String { rawValue }
}

struct ContentView: View {
    // Starting with last element. Changing this to .green doesn't work,
    // except when swiped to or yellow was called once.
    @State var selection: Tab = .red
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                Color.green.opacity(0.5)
                    .tag(Tab.green)
                Color.yellow.opacity(0.5)
                    .tag(Tab.yellow)
                Color.red.opacity(0.5)
                    .tag(Tab.red)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .navigationTitle("Test")
            .toolbar {
                ToolbarItem {
                    Picker(selection: $selection) {
                        ForEach(Tab.allCases) { element in
                            Text(element.rawValue)
                                .tag(element)
                        }
                    } label: {
                        Text(selection.rawValue)
                    }
                    .pickerStyle(.menu)
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

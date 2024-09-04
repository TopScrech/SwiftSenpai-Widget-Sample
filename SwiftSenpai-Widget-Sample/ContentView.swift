import SwiftUI

struct ContentView: View {
    @State private var showRedView = false
    @State private var showBlueView = false
    @State private var showGreenView = false
    @State private var showOrangeView = false
    
    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
            Text("Swift Senpai Widget Demo")
        }
        .padding()
        .sheet(isPresented: $showRedView) {
            RedView()
        }
        .sheet(isPresented: $showOrangeView) {
            OrangeView()
        }
        .sheet(isPresented: $showGreenView) {
            GreenView()
        }
        .sheet(isPresented: $showBlueView) {
            BlueView()
        }
        .onOpenURL { url in
            // Handle this deep link URL
            handleWidgetDeepLink(url)
        }
    }
    
    /// Extract deep link command from URL
    private func handleWidgetDeepLink(_ url: URL) {
        
        guard
            let scheme = url.scheme,
            let command = url.host
        else {
            // Invalid URL format
            return
        }
        
        guard scheme == "tap-me-widget" else {
            // The deep link is not trigger by widget
            return
        }
        
        switch command {
        case "show-red":
            showRedView = true
            
        case "show-blue":
            showBlueView = true
            
        case "show-orange":
            showOrangeView = true
            
        case "show-green":
            showGreenView = true
            
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}

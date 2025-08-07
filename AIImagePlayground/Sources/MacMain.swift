#if os(macOS)
import SwiftUI

@main
struct AIImagePlaygroundApp: App {
    @StateObject private var modelManager = ModelManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelManager)
        }
    }
}
#endif

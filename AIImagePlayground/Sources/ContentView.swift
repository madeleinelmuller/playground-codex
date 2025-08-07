#if os(macOS)
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelManager: ModelManager
    @State private var prompt: String = ""
    @State private var generatedImage: NSImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("AI Image Playground")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter prompt", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Button("Generate") {
                    generatedImage = modelManager.generateImage(prompt: prompt)
                }
                Button("Load Model") {
                    modelManager.loadModel()
                }
            }
            .buttonStyle(.borderedProminent)
            if let image = generatedImage {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 400)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondary.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .overlay(Text("Generated image will appear here").foregroundColor(.secondary))
            }
        }
        .padding()
        .frame(minWidth: 600, minHeight: 500)
    }
}
#endif

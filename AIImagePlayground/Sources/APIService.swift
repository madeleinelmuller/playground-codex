#if os(macOS)
import Vapor
import AppKit

final class APIService {
    private var app: Application?

    func start(using manager: ModelManager) throws {
        let app = Application(.development)
        self.app = app
        app.http.server.configuration.hostname = "127.0.0.1"
        app.http.server.configuration.port = 8080

        struct PromptRequest: Content {
            let prompt: String
        }

        app.post("generate") { req -> Response in
            let request = try req.content.decode(PromptRequest.self)
            guard let image = manager.generateImage(prompt: request.prompt),
                  let tiff = image.tiffRepresentation else {
                return Response(status: .internalServerError)
            }
            let base64 = Data(tiff).base64EncodedString()
            return Response(status: .ok, body: .init(string: base64))
        }

        try app.start()
    }

    func stop() {
        app?.shutdown()
    }
}
#endif

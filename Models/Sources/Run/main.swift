import Server

let app = try application()
defer { app.shutdown() }
try app.run()

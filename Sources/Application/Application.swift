import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import KituraMustache
import KituraStencil

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()

    public init() throws {
    }

    func postInit() throws {
        router.add(templateEngine: MustacheTemplateEngine())
        router.add(templateEngine: StencilTemplateEngine())

        // Capabilities
        initializeMetrics(app: self)

        // Endpoints
        initializeHealthRoutes(app: self)
        initializePerson(app: self)
        initializeTemplate(app: self)
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}

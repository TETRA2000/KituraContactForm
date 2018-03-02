import Foundation
import LoggerAPI
import SwiftKueryORM

func initializeTemplate(app: App) {
    app.router.get("/delivery") { request, response, next in
        // The example from https://github.com/groue/GRMustache.swift/blob/master/README.md
        var context: [String: Any] = [
            "name": "Arthur",
            "date": Date(),
            "realDate": Date().addingTimeInterval(60*60*24*3),
            "late": true
        ]

        // Let template format dates with ``
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        context["format"] = dateFormatter

        try response.render("document.mustache", context: context).end()
        next()
    }

    // Handle HTTP GET requests to Stencil
    app.router.get("/articles") { request, response, next in

        // The example from https://github.com/kylef/Stencil/blob/master/README.md
        var context2 = [
            "articles": [
                ["title": "Migrating from OCUnit to XCTest", "author": "Kyle Fuller"],
                ["title": "Memory Management with ARC", "author": "Kyle Fuller" ]
            ]
        ]

        try response.render("document.stencil", context: context2).end()
        next()
    }
}

//
//  CarPlaySceneDelegate.swift
//  CarPlay
//
//  Created by Alexander v. Below on 24.06.20.
//

import UIKit
// CarPlay App Lifecycle

import CarPlay

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    var interfaceController: CPInterfaceController?

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
            didConnect interfaceController: CPInterfaceController) {

        self.interfaceController = interfaceController
        let item = CPListItem(text: "Rubber Soul", detailText: "The Beatles")
        let section = CPListSection(items: [item])
        let listTemplate = CPListTemplate(title: "Albums", sections: [section])
        // SwiftC apparently requires the explicit inclusion of the completion parameter,
        // otherwise it will throw a warning
        interfaceController.setRootTemplate(listTemplate,
                                            animated: true,
                                            completion: nil)
    }

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        self.interfaceController = nil
    }
}

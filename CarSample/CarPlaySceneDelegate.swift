//
//  CarPlaySceneDelegate.swift
//  CarPlay
//
//  Created by Alexander v. Below on 24.06.20.
//

import UIKit
// CarPlay App Lifecycle

import CarPlay
import os.log

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    var interfaceController: CPInterfaceController?
    let logger = Logger()
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
            didConnect interfaceController: CPInterfaceController) {

        self.interfaceController = interfaceController
        
        let gridButton = CPGridButton(titleVariants: ["Albums"],
                                      image: UIImage(systemName: "list.triangle")!)
        { button in
            interfaceController.pushTemplate(self.listTemplate(),
                                             animated: true,
                                             completion: nil)

        }
        
        let gridTemplate = CPGridTemplate(title: "A Grid Interface", gridButtons:  [gridButton])
        
        // SwiftC apparently requires the explicit inclusion of the completion parameter,
        // otherwise it will throw a warning
        interfaceController.setRootTemplate(gridTemplate,
                                            animated: true,
                                            completion: nil)
    }

    func listTemplate() -> CPListTemplate {
        let item = CPListItem(text: "Rubber Soul", detailText: "The Beatles")
        item.handler = { item, completion in

            self.logger.info("Item selected")
            completion()
        }
        let section = CPListSection(items: [item])
        return CPListTemplate(title: "Albums", sections: [section])
    }
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        self.interfaceController = nil
    }
}

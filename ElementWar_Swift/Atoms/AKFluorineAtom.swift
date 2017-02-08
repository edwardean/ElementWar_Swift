//
//  AKFluorineAtom.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 16/9/18.
//  Copyright © 2016年 ArtisanKid. All rights reserved.
//

//氟原子

import Foundation
import SceneKit

class AKFluorineAtom {
    class func atom() -> SCNGeometry {  
        let atom = SCNSphere(radius: 1.47)  
        atom.firstMaterial!.diffuse.contents = UIColor.yellow  
        atom.firstMaterial!.specular.contents = UIColor.white  
        return atom
    }
}

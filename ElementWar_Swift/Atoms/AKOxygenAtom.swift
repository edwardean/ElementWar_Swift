//
//  AKOxygenAtom.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 16/9/18.
//  Copyright © 2016年 ArtisanKid. All rights reserved.
//

import Foundation
import SceneKit

class AKOxygenAtom {
    class func atom() -> SCNGeometry {  
        let atom = SCNSphere(radius: 1.52)  
        atom.firstMaterial!.diffuse.contents = UIColor.red
        atom.firstMaterial!.specular.contents = UIColor.white  
        return atom
    }
}

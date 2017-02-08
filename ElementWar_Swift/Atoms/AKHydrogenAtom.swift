//
//  AKHydrogenAtom.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 16/9/18.
//  Copyright © 2016年 ArtisanKid. All rights reserved.
//

import Foundation
import SceneKit

class AKHydrogenAtom {
    class func atom() -> SCNGeometry {  
        let atom = SCNSphere(radius: 1.2)  
        atom.firstMaterial!.diffuse.contents = UIColor.lightGray  
        atom.firstMaterial!.specular.contents = UIColor.white  
        return atom
    }
}

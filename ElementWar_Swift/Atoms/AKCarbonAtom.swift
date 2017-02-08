//
//  AKCarbonAtom.swift
//  ElementWar_Swift
//
//  Created by 李翔宇 on 16/9/18.
//  Copyright © 2016年 ArtisanKid. All rights reserved.
//

import Foundation
import SceneKit

class AKCarbonAtom {
    class func atom() -> SCNGeometry {  
        /* 这是一个预先声明，当然carbonAtom会在后面用到，1.7是指碳原子的范德华半径，就相当于原子的半径，不过是负的10次方级别的了。现在你为场景指定了一个计量单位，之后所有的物体都要以这个单位为准 */
        let atom = SCNSphere(radius: 1.7)   
        /*firstMaterial是SCNMaterial的一个属性，定义的是原子的材质，其实就是覆盖在其表面的贴图，在Scene Kit中你可以将其赋值为颜色、纹理或者其他源材质，如果想了解跟更多请参见OpenGL ES的相关资料  */
        atom.firstMaterial?.diffuse.contents = UIColor.darkGray   
        /* 镜面材质其实就是另一层贴图，将会在表面产生反射效果，对于大多数材质来说一般都用纯白色 */
        atom.firstMaterial?.specular.contents = UIColor.white   
        /* 本教程在原子的创建上使用了工厂模式，对于在多原子结构的分子构建来说会相当有用，使用该公开方法可以返回一个模式化的几何图形 */
        return atom
    }
}

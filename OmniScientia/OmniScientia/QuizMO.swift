//
//  QuizMO.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/22/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class QuizMO: LearningObjectMO {

    @NSManaged public var perguntas: String
    @NSManaged public var respostaCorreta: NSNumber
    @NSManaged public var respostas: AnyObject

}

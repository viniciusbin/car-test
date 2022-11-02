//
//  ViewCodable.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 28/10/22.
//

import Foundation

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

//    func buildHierarchy() {}
//
//    func setupConstraints() {}
//
    func applyAdditionalChanges() {}
}

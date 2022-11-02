//
//  CarDetailScreen.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 02/11/22.
//

import UIKit

class CarDetailScreen: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var tipoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descricaoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with car: Car) {
        self.nomeLabel.text = "Nome - " + car.nome
        self.carImage.downloaded(from: car.urlFoto ?? "")
        self.idLabel.text = "ID - " + car.id.formatted()
        self.tipoLabel.text = "Tipo - " + car.tipo
        self.descricaoLabel.text = "Descrição - " + car.descricao
    }
    
}

extension CarDetailScreen: ViewCodable {
    func buildHierarchy() {
        addSubview(carImage)
        addSubview(stackView)
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(nomeLabel)
        stackView.addArrangedSubview(tipoLabel)
        stackView.addArrangedSubview(descricaoLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            carImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImage.heightAnchor.constraint(equalToConstant: 250),
            carImage.widthAnchor.constraint(equalToConstant: 250),
            
            stackView.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -48)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .lightGray
    }
}



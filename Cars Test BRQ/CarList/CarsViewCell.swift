//
//  CarsViewCell.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 02/11/22.
//

import UIKit

class CarsViewCell: UITableViewCell {

    static let reuseIdentifier = "CarsViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CarsViewCell: ViewCodable {
    
    public func configure(with car: Car) {
        self.nameLabel.text = car.nome
        self.carImage.downloaded(from: car.urlFoto ?? "")
    }

    func buildHierarchy() {
        contentView.addSubview(carImage)
        contentView.addSubview(nameLabel)
    }


    func setupConstraints() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            carImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImage.heightAnchor.constraint(equalToConstant: 100),
            carImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: carImage.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

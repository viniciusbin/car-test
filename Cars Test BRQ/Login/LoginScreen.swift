//
//  LoginScreen.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 28/10/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    }


class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    lazy var lineviewLogin: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    lazy var lineviewPassword: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    lazy var headerCars: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "Carros"
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 1

        return label
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Login"
        return label
    }()
    
    lazy var loginTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Digite o login"
        textfield.backgroundColor = .white
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Senha"
        return label
    }()
    
    lazy var senhaTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Digite a senha"
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 2
        textfield.backgroundColor = .white
        return textfield
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 1
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var keepLoggedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Manter logado"
        label.textColor = .blue
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 1
        
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci a senha", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.blue, for: .normal)
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Crie uma conta", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.blue, for: .normal)
        
        return button
    }()
    
    lazy var unregisteredLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Ainda não é cadastrado?"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ajuda", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        
        return button
    }()
    
    lazy var helpImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "questionmark.circle.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public func configTFdelegate(delegate: UITextFieldDelegate){
        loginTF.delegate = delegate
        senhaTF.delegate = delegate
    }
    public func validateTextField() {
        
        let email = loginTF.text ?? ""
        let password = senhaTF.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            enableButton(true)
        }else{
            enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        }else{
            
        
        loginButton.setTitleColor(.lightGray, for: .normal)
        loginButton.isEnabled = false
    }
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

extension LoginScreen: ViewCodable {
    func buildHierarchy() {
        addSubview(headerCars)
        addSubview(stackView)
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(loginTF)
        stackView.addArrangedSubview(lineviewLogin)
        stackView.addArrangedSubview(senhaLabel)
        stackView.addArrangedSubview(senhaTF)
        stackView.addArrangedSubview(lineviewPassword)
        addSubview(keepLoggedLabel)
        addSubview(checkButton)
        addSubview(forgotPasswordButton)
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(unregisteredLabel)
        addSubview(helpButton)
        addSubview(helpImage)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            headerCars.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerCars.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            headerCars.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headerCars.heightAnchor.constraint(equalToConstant:70),
            
            stackView.topAnchor.constraint(equalTo:  headerCars.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            keepLoggedLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            keepLoggedLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16),
            keepLoggedLabel.heightAnchor.constraint(equalToConstant: 30),
            
            checkButton.centerYAnchor.constraint(equalTo: keepLoggedLabel.centerYAnchor),
            checkButton.leadingAnchor.constraint(equalTo: keepLoggedLabel.trailingAnchor, constant: 16),
            
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            forgotPasswordButton.centerYAnchor.constraint(equalTo: keepLoggedLabel.centerYAnchor),
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            unregisteredLabel.trailingAnchor.constraint(equalTo: registerButton.leadingAnchor, constant: -36),
            unregisteredLabel.heightAnchor.constraint(equalToConstant: 30),
            unregisteredLabel.centerYAnchor.constraint(equalTo: registerButton.centerYAnchor),
            
            helpButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor, constant: -12),
            helpButton.topAnchor.constraint(equalTo: unregisteredLabel.bottomAnchor, constant: 24),
            helpButton.heightAnchor.constraint(equalToConstant: 30),
            
            helpImage.centerYAnchor.constraint(equalTo: helpButton.centerYAnchor),
            helpImage.leadingAnchor.constraint(equalTo: helpButton.trailingAnchor, constant: 8),
            helpImage.heightAnchor.constraint(equalToConstant: 20),
            helpImage.widthAnchor.constraint(equalToConstant: 20),
            
            
            
            lineviewLogin.heightAnchor.constraint(equalToConstant: 1),
            lineviewPassword.heightAnchor.constraint(equalToConstant: 1)
            
            
            
            
            
            
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .white
    }
    
}

import UIKit

class UIKitViewController: UIViewController {
    private let viewModel = UIKitViewModel()
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "iOS Alert Library"
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let modalButton = UIButton(type: .system)
        modalButton.setTitle("Показать модальное окно", for: .normal)
        modalButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        modalButton.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        modalButton.layer.cornerRadius = 10
        modalButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(modalButton)
        
        NSLayoutConstraint.activate([
            modalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            modalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            modalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            modalButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func showModal() {
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .systemBackground
        modalVC.modalPresentationStyle = .pageSheet

        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "arrow.up")
        arrowImageView.tintColor = .label 
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false

        let messageLabel = UILabel()
        messageLabel.text = "Алерт отображается в новом Overlay UIWindow"
        messageLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        messageLabel.textColor = .secondaryLabel
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        modalVC.view.addSubview(arrowImageView)
        modalVC.view.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            arrowImageView.centerXAnchor.constraint(equalTo: modalVC.view.centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: modalVC.view.centerYAnchor, constant: -100),
            arrowImageView.widthAnchor.constraint(equalToConstant: 250),
            arrowImageView.heightAnchor.constraint(equalToConstant: 250),

            messageLabel.topAnchor.constraint(equalTo: arrowImageView.bottomAnchor, constant: 40),
            messageLabel.leadingAnchor.constraint(equalTo: modalVC.view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: modalVC.view.trailingAnchor, constant: -20)
        ])
        viewModel.dismissSpecificAlerts()
        present(modalVC, animated: true, completion: nil)
    }
}

extension UIKitViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].buttons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let button = viewModel.sections[indexPath.section].buttons[indexPath.row]
        cell.textLabel?.text = button.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
}

extension UIKitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let button = viewModel.sections[indexPath.section].buttons[indexPath.row]
        button.action()
    }
}

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var textDescription: UITextView!
    @IBOutlet var colorsTable: UITableView!
    
    // Define an array of colors and their corresponding names
    let colors: [(UIColor, String)] = [
        (.red, "Red"),
        (.orange, "Orange"),
        (.yellow, "Yellow"),
        (.green, "Green"),
        (.blue, "Blue"),
        (.purple, "Purple"),
        (.white, "White"),
        (.black, "Black"),
        (.gray, "Gray"),
        (.brown, "Brown"),
        (.systemPink, "System Pink"),
        (.cyan, "Cyan")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source of the table view
        colorsTable.delegate = self
        colorsTable.dataSource = self
        
        // Register a basic cell type
        colorsTable.register(UITableViewCell.self, forCellReuseIdentifier: "colorCell")
            }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        // Get the color and name for the current row
        let (color, name) = colors[indexPath.row]
        
        // Set the cell's background color
        cell.backgroundColor = color
        cell.textLabel?.text = name
        
        // Set the text color based on the name
        if name == "Black" {
            cell.textLabel?.textColor = .white
        }  
        if name != "Black" {
            cell.textLabel?.textColor = .black
        }
        
        cell.selectionStyle = .none

        return cell
    }
    
    // Optional: Set the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (selectedColor, colorName) = colors[indexPath.row]
        
        // Update the text description based on the selected color
        switch indexPath.row {
        case 0:
            textDescription.text = "You selected Red.\n\nA bold and vibrant color often associated with passion, energy, and danger."
        case 1:
            textDescription.text = "You selected Orange.\n\nA warm and inviting color that blends the energy of red and the happiness of yellow."
        case 2:
            textDescription.text = "You selected Yellow.\n\nA bright and cheerful color that represents sunshine, happiness, and optimism."
        case 3:
            textDescription.text = "You selected Green.\n\nA calming and refreshing color commonly associated with nature, growth, and tranquility."
        case 4:
            textDescription.text = "You selected Blue.\n\nA cool and calming color often associated with stability, trust, and serenity."
        case 5:
            textDescription.text = "You selected Purple.\n\nA rich and luxurious color often linked with royalty, mystery, and creativity."
        case 6:
            textDescription.text = "You selected White.\n\nA pure and clean color that symbolizes peace, simplicity, and new beginnings."
        case 7:
            textDescription.text = "You selected Black.\n\nA strong and elegant color that represents sophistication, power, and formality."
            textDescription.textColor = .white // Set text color to white for black background
        case 8:
            textDescription.text = "You selected Gray.\n\nA neutral and balanced color that often signifies neutrality, professionalism, and practicality."
        case 9:
            textDescription.text = "You selected Brown.\n\nA warm and earthy color that represents reliability, stability, and comfort."
        case 10:
            textDescription.text = "You selected System Pink.\n\nA soft and playful color often associated with love, care, and sensitivity."
        case 11:
            textDescription.text = "You selected Cyan.\n\nA bright and lively color that represents clarity, freshness, and energy."
        default:
            textDescription.text = "Color not recognized."
        }
        
        // Optionally, set the background color of the text view to the selected color
        textDescription.backgroundColor = selectedColor
        
        // Set the text color to default (black) if not black
        if selectedColor != .black {
            textDescription.textColor = .black
        }
    }
}

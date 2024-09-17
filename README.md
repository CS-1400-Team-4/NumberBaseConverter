# PowerShell Number Base Converter

This PowerShell script provides a graphical user interface (GUI) for converting numbers between binary, decimal, and hexadecimal bases. It's a simple, user-friendly tool for developers, students, or anyone working with different number systems.

## Features

- Convert between binary, decimal, and hexadecimal number systems
- Easy-to-use graphical interface
- Error handling for invalid inputs
- Supports large numbers (up to 64-bit integers)

## Requirements

- Windows operating system
- PowerShell 5.1 or later

## Installation

1. Clone this repository or download the `NumberBaseConverter.ps1` file.
2. Ensure that your PowerShell execution policy allows running scripts. You may need to run the following command in an elevated PowerShell prompt:

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

## Usage

1. Open PowerShell.
2. Navigate to the directory containing the `NumberBaseConverter.ps1` file.
3. Run the script:

   ```powershell
   .\NumberBaseConverter.ps1
   ```

4. The GUI window will appear:
   - Enter the number you want to convert in the top text box.
   - Select the base of your input number from the first dropdown.
   - Select the base you want to convert to from the second dropdown.
   - Click the "Convert" button.
   - The result will appear in the bottom text box.

## Example

To convert the decimal number 42 to binary:
1. Enter "42" in the input box.
2. Select "Decimal" from the input base dropdown.
3. Select "Binary" from the output base dropdown.
4. Click "Convert".
5. The result "101010" will appear in the result box.

## Screenshot examples

![image](https://github.com/user-attachments/assets/fb0cbff8-9558-422e-a890-08e618ddc9b3)

![image](https://github.com/user-attachments/assets/87eb9555-5fb6-4792-88e9-affd6d268c47)

![image](https://github.com/user-attachments/assets/30d9f300-0235-4f00-a639-214a15a27c42)

## Contributing

Contributions to improve the script or extend its functionality are welcome. Please feel free to fork the repository and submit pull requests.

## License

This project is open source and available under the [MIT License](LICENSE).

## Contact

If you have any questions or suggestions, please open an issue on the GitHub repository.

---

Happy converting!

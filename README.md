# POC Vibe Robot Framework Project

## Project Overview
This project is a proof of concept (POC) for automated testing using Robot Framework. It includes test cases for web and API testing, leveraging SeleniumLibrary and RequestsLibrary.

## Project Structure
```
requirements.txt       # Dependencies for the project
resources/             # Contains reusable keywords and variables
    keywords/          # Custom keywords
    variables/         # Variable files
results/               # Test results (logs, reports, and output files)
tests/                 # Test cases
    api/               # API test cases
    web/               # Web test cases
        open_google.robot  # Test script to open Google in Chrome
```

## ## Prerequisites
- Python 3.7 or higher
- Google Chrome browser (latest stable version recommended)
- ChromeDriver (must match the version of your installed Google Chrome browser)
  - You can download ChromeDriver from [ChromeDriver Downloads](https://sites.google.com/chromium.org/driver/).
  - Ensure ChromeDriver is added to your system's PATH.
- Google Chrome for Testing
  - Download `Google Chrome for Testing.app` from the [Chrome for Testing](https://googlechromelabs.github.io/chrome-for-testing/) page.
  - Move the downloaded `.app` file to your `Applications` folder.
  - If macOS blocks the app with a "damaged and can't be opened" error:
    1. Open Terminal and run:
       ```bash
       xattr -rd com.apple.quarantine "/Applications/Google Chrome for Testing.app"
       ```
    2. Open the app again from the `Applications` folder.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/tansolo-qa/qa-copilot.git
   ```
2. Navigate to the project directory:
   ```bash
   cd poc-vibe-robot/qa-copilot
   ```
3. Create and activate a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running Tests
### Web Tests
To run a specific web test file (e.g., `test_saucedemo.robot`):
```bash
robot --outputdir results tests/web/test_saucedemo.robot
```

To run all web tests in the `tests/web/` directory:
```bash
robot --outputdir results tests/web/
```

### API Tests
To run the API test cases:
```bash
robot --outputdir results tests/api/
```

## Viewing Results
After running the tests, you can view the results in the `results/` folder:
- `results/screenshots/`: Contains screenshots captured during test failures, organized by test suite and test case name (e.g., `results/screenshots/TestSuiteName/TestCaseName_failure.png`).

You can also open the [dashboard](results/dashboard.html) for a quick overview.

## License
This project is licensed under the MIT License.

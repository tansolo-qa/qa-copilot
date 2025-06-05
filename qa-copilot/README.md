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

## Prerequisites
- Python 3.7 or higher
- Google Chrome browser
- ChromeDriver (compatible with your Chrome version)

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd poc-vibe-robot/qa-copilot
   ```
3. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   .\venv\Scripts\activate
   ```
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running Tests
### Web Tests
To run the web test cases:
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

## Prerequisites
@@ -38,7 +38,13 @@
## Running Tests
### Web Tests
To run a specific web test file (e.g., `test_saucedemo.robot`):
+```bash
+robot --outputdir results tests/web/test_saucedemo.robot
+```
+
+To run all web tests in the `tests/web/` directory:
```bash
-robot --outputdir results tests/web/open_google.robot
+robot --outputdir results tests/web/

**Key changes and why:**

1.  **Project Structure:**
    *   Updated `resources/` to show `common_keywords.robot` as an example, which is more accurate to your current setup.
    *   Added `results/screenshots/` to show where the failure screenshots will be stored, making it clear how they are organized.
    *   Updated the example web test file from `open_google.robot` to `test_saucedemo.robot` as it's the more prominent example now.

2.  **Running Tests:**
    *   Added a specific example for running `test_saucedemo.robot`.
    *   Included a command for running all tests within the `tests/web/` directory, which is a common use case.

3.  **Viewing Results:**
    *   Added a line explaining where to find the screenshots for failed tests and their naming convention. This is a crucial piece of information given the new `Capture Page On Failure` keyword.

These changes should make your `README.md` more accurately reflect your project's current capabilities and structure, making it more helpful for anyone (including your future self!) looking at the project.

# Code Vulnerability Detection

This project implements a machine learning solution to detect and classify code vulnerabilities, specifically focusing on **SQL Injection (SQLi)** and **Cross-Site Scripting (XSS)** vulnerabilities.

## Project Overview

The goal of this project is to build a predictive model that can automatically identify and classify different types of code vulnerabilities in source code snippets. The model uses Natural Language Processing (NLP) techniques combined with machine learning to analyze code patterns and identify potential security threats.

## Dataset

The dataset (`code_vulnerabilities.csv`) contains 1,000 labeled code snippets with the following features:

- **Code Snippet**: The actual vulnerable code example
- **Vulnerability Type**: Classification label (SQLi or XSS)
- **Location**: Line number where the vulnerability occurs
- **Preprocessed Tokens**: Tokenized version of the code snippet

### Vulnerability Types

1. **SQL Injection (SQLi)**: Attacks that manipulate SQL queries through unsanitized user input
   - Examples include using string concatenation in database queries
   - Preventable through parameterized queries

2. **Cross-Site Scripting (XSS)**: Attacks that inject malicious scripts into web pages
   - Examples include unsanitized DOM manipulation and direct HTML injection
   - Preventable through proper input validation and output encoding

## Project Structure

```
.
├── CLIENT.py                 # Main Python script for data processing and model training
├── CLIENT.ipynb             # Jupyter notebook with step-by-step analysis
├── code_vulnerabilities.csv # Dataset containing vulnerable code samples
└── README.md               # This file
```

## Methodology

### 1. **Data Preprocessing**
   - Loaded 1,000 code vulnerability samples
   - Removed null values and duplicate entries (804 duplicates dropped)
   - Standardized column names (lowercase, underscores)
   - Final dataset: 196 unique vulnerability samples

### 2. **Feature Engineering**
   - Combined `code_snippet` and `preprocessed_tokens` into a single feature
   - Created `code_length` feature from code snippet length
   - Utilized TF-IDF vectorization for text representation
   - Maximum features: 5,000 terms

### 3. **Model Training**
   - **Algorithm**: Random Forest Classifier
   - **Train-Test Split**: 80-20 split with random_state=42
   - **Feature Extraction**: TfidfVectorizer

### 4. **Model Performance**
   - **Accuracy**: 100% on test set
   - **Precision**: 1.00 (both classes)
   - **Recall**: 1.00 (both classes)
   - **F1-Score**: 1.00 (both classes)

## Results

### Classification Report
```
              precision    recall  f1-score   support

        SQLi       1.00      1.00      1.00        21
         XSS       1.00      1.00      1.00        19

    accuracy                           1.00        40
   macro avg       1.00      1.00      1.00        40
weighted avg       1.00      1.00      1.00        40
```

### Confusion Matrix
- True Positives (SQLi): 21
- True Positives (XSS): 19
- False Positives: 0
- False Negatives: 0

## Visualizations Generated

1. **Vulnerability Distribution**: Bar chart showing SQLi vs XSS distribution in the dataset
2. **Code Length Distribution**: Histogram of code snippet lengths (1-200 characters)
3. **Top 10 Most Frequent Tokens**: Bar chart of the most common tokens in vulnerable code

## Key Findings

1. **High Model Accuracy**: The Random Forest classifier achieves 100% accuracy on the test set
2. **Balanced Classes**: Dataset contains roughly equal samples of SQLi and XSS vulnerabilities
3. **Code Length**: Most vulnerable code snippets are relatively short (50-150 characters)
4. **Common Patterns**: Key tokens include SQL keywords (SELECT, WHERE, FROM) and JavaScript functions (alert, document)

## Requirements

```
pandas
numpy
matplotlib
seaborn
scikit-learn
```

## Installation

```bash
pip install pandas numpy matplotlib seaborn scikit-learn
```

## Usage

### Running the Analysis
```python
# Load and process the data
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Load dataset
df = pd.read_csv('code_vulnerabilities.csv')

# Data preprocessing (see CLIENT.py for full pipeline)
df = df.dropna()
df = df.drop_duplicates()

# Train model and evaluate
# See CLIENT.py for complete implementation
```

### Running Jupyter Notebook
```bash
jupyter notebook CLIENT.ipynb
```

## Future Improvements

1. **Model Enhancement**:
   - Implement deep learning approaches (LSTM, BERT)
   - Experiment with ensemble methods
   - Cross-validation for more robust evaluation

2. **Feature Engineering**:
   - Abstract Syntax Tree (AST) analysis
   - Semantic code analysis
   - Contextual embeddings from pre-trained models

3. **Dataset Expansion**:
   - Include more vulnerability types (CSRF, Path Traversal, etc.)
   - Larger, more diverse dataset
   - Real-world vulnerability examples

4. **Deployment**:
   - REST API for vulnerability detection
   - Integration with CI/CD pipelines
   - Browser extension for code review

## Limitations

1. **Perfect Accuracy**: The 100% accuracy suggests potential:
   - Small dataset size
   - Possible overfitting
   - Limited diversity in vulnerability patterns

2. **Binary Classification**: Currently limited to SQLi and XSS
3. **Code-only Analysis**: Does not consider execution context or configuration

## References

- OWASP Top 10 Web Application Security Risks
- CWE/SANS Top 25 Most Dangerous Software Weaknesses
- scikit-learn Documentation: https://scikit-learn.org/
- TF-IDF Vectorization: https://en.wikipedia.org/wiki/Tf%E2%80%93idf

## Author

Varikuppala Hemanth

## License

This project is provided as-is for educational and research purposes.

## Contact

For questions or suggestions, please contact the project author.

---

**Last Updated**: May 2026
**Status**: Active Development

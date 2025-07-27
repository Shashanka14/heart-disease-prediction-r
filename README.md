# Heart Disease Risk Prediction Using Logistic Regression in R

This project builds and evaluates a **logistic regression model** to predict the likelihood of heart disease based on a patient's clinical features. It uses the Cleveland Heart Disease dataset and was developed as a demonstration of clinical data modeling, predictive analytics, and reproducible R workflows.

---

## Objectives

- Predict whether a patient has heart disease (`target`: Disease or NoDisease) using 13 features.
- Use logistic regression for binary classification.
- Evaluate model accuracy using confusion matrix and ROC/AUC.
- Build a reproducible and interpretable clinical prediction pipeline.

---

## Dataset

- **Subset Used**: Cleveland (303 samples)
- **Target Variable**: `target` (0 = no disease, 1 = disease)
- **Features**:
  - `age`, `sex`, `cp`, `trestbps`, `chol`, `fbs`, `restecg`, `thalach`, `exang`, `oldpeak`, `slope`, `ca`, `thal`

---

## Methodology

- Categorical variables were converted to R factors (`sex`, `cp`, `thal`, etc.).
- Data split: 80% for training, 20% for testing.
- Model: `glm()` function in R with binomial family (logistic regression).
- Evaluation metrics:
  - Accuracy, Sensitivity, Specificity via confusion matrix
  - Discriminative power via ROC curve and AUC

---

## Results

| Metric       | Value   |
|--------------|---------|
| Accuracy     | 89.8%   |
| Sensitivity  | 90.6%   |
| Specificity  | 88.9%   |
| AUC (ROC)    | **0.93**|

The model showed strong predictive performance, with high accuracy and excellent discrimination between patients with and without heart disease.

---

## Files

| File                              | Description                               |
|-----------------------------------|-------------------------------------------|
| `heart_disease_model.R`           | Main R script for training and evaluation |
| `heart_test_data_with_predictions.csv` | Test data with model outputs             |
| `heart_model.rds`                 | Saved logistic model for reuse            |
| `roc_curve_heart_disease.png`     | ROC plot visualization                    |
| `app.R` *(optional)*              | Shiny app for live predictions            |

---

## Running the Code

1. Clone this repo or download the files
2. Open `heart_disease_model.R` in RStudio
3. Run all code blocks to:
   - Clean data
   - Fit model
   - Evaluate predictions
   - Generate outputs
4. To use the model in a Shiny app, load `heart_model.rds` in `app.R`

---


## Author

**Shashanka Debnath**  
MTech Bioinformatics  
📧 [your.email@example.com]  
🔗 [LinkedIn](#) | [GitHub](#)


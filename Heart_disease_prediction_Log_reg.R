#Step 1) We install the necessary packages for our purpose
install.packages(c("ggplot2", "caret", "pROC", "MASS", "glmnet"))
library(ggplot2)
library(caret)
library(pROC)
library(MASS)
library(glmnet)

# Step 2) I am choosing the dataset from my directory and then reading the CSV file

file.choose()
heart_disease_csv=read.csv("F:\\R_project\\Heart_disease_cleveland_new.csv")
head(heart_disease_csv)
str(heart_disease_csv) #Checks the structure of the dataset 
#to ensure the import has been done correctly

summary(heart_disease_csv)

# Step 3) Here we will convert the categorical variables to factors to ensure proper modelling

heart_disease_csv$sex     <- factor(heart_disease_csv$sex, labels = c("female", "male"))
heart_disease_csv$cp      <- factor(heart_disease_csv$cp)
heart_disease_csv$fbs     <- factor(heart_disease_csv$fbs)
heart_disease_csv$restecg <- factor(heart_disease_csv$restecg)
heart_disease_csv$exang   <- factor(heart_disease_csv$exang)
heart_disease_csv$slope   <- factor(heart_disease_csv$slope)
heart_disease_csv$ca      <- factor(heart_disease_csv$ca)
heart_disease_csv$thal    <- factor(heart_disease_csv$thal)
heart_disease_csv$target  <- factor(heart_disease_csv$target, labels = c("NoDisease", "Disease"))

str(heart_disease_csv) #Here we check the structure of the dataset again



#Step 4) Here we will split the data into training and testing set (80/20 split)
set.seed(123)  # We do this for reproducibility, 
#so that every time the the random split is maintained same every time 


library(caret)

train_index <- createDataPartition(heart_disease_csv$target, p = 0.8, list = FALSE)
train_data <- heart_disease_csv[train_index, ]
test_data  <- heart_disease_csv[-train_index, ]

# Step 5)Fitting the full logistic regression model

model <- glm(target ~ ., data = train_data, family = "binomial")

# Checking the summary
summary(model)


#Step 6) Predicting target variable on the test data


pred_probs <- predict(model, newdata = test_data, type = "response")

# Converting probabilities to classes using 0.5 cutoff
pred_classes <- ifelse(pred_probs > 0.5, "Disease", "NoDisease")
pred_classes <- factor(pred_classes, levels = c("NoDisease", "Disease"))

# Confusion matrix
confusionMatrix(pred_classes, test_data$target)


library(pROC)

# Recode target as numeric for ROC (1 = Disease)
roc_target <- ifelse(test_data$target == "Disease", 1, 0)

roc_obj <- roc(roc_target, pred_probs)
plot(roc_obj, col = "darkred", main = "ROC Curve - Heart Disease Prediction")
auc(roc_obj)

# Expoerting the results
write.csv(test_data, "heart_test_data_with_predictions.csv", row.names = FALSE)



















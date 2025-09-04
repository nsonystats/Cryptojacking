Predictive Modeling with Lasso Regression and Regression Trees  
		A Comparative Analysis on CPU Performance Metrics

Author:  Nitika Sony  
B.Sc. (H) Statistics | Amity University Kolkata  



This project compares two supervised learning models; Lasso Regression and Regression Trees, for predicting CPU usage (`cpu_total`) based on various system performance metrics. With over 80,000+ records, the analysis highlights key trade-offs between model accuracy (via MAE) and interpretability, providing a practical example of how statistical modeling can guide data-driven decision-making.

Objective:
To evaluate and contrast the performance of Lasso Regression and Regression Trees in terms of:
- Prediction error using MAE (Mean Absolute Error)
- Interpretability and model simplicity
- Suitability for high-dimensional CPU performance data

 Dataset
- Source: Kaggle: Cryptojacking Timeseries Dataset 
- Observations: 80,851
- Target variable: `cpu_total`
- Features: `cpu_guest`, `cpu_guest_nice`, `cpu_idle`, `cpu_iowait`, `cpu_irq`, `cpu_nice`, `cpu_softirq`, `cpu_steal`, `cpu_system`

 Tools & Libraries
- Language: R  
- Libraries: `glmnet`, `rpart`, `rpart.plot`, `Metrics`  
- Techniques: Feature selection, regularization, regression tree pruning

Methodology
1. Data Preprocessing
   - Removed missing values from `cpu_total`
   - Handled outliers and ensured data quality

2. Model Building
   - Lasso Regression: Used λ-tuned glmnet model to perform regularization and reduce dimensions
   - Regression Tree: Built decision trees using `rpart` and visualized tree structure

3. Evaluation
   - Used MAE (Mean Absolute Error) to compare model performance on unseen test data
   - Focused on model interpretability and simplicity

Results (Evaluation by MAE only)

+------------------------+-----------------------+-------------------------------+
| Metric                 | Lasso Regression      | Regression Tree               |
+------------------------+-----------------------+-------------------------------+
| MAE                    | 0.9208                | 1.077                         |
| Interpretability       | Moderate              | High                          |
| Dimensionality Use     | Optimal               | Acceptable                    |
+------------------------+-----------------------+-------------------------------+


MAE was used as the primary evaluation metric. 


 Poster Presentation: 

A visual research poster was designed to summarize the dataset, modeling approach, and key takeaways.

 Key Takeaways: 
- Regression Tree had the lowest MAE, offering better predictive accuracy
- Lasso Regression was useful for feature selection and dimensionality reduction
- The comparison shows a trade-off between simplicity and performance vs. interpretability
- Useful in real-world applications where model explainability or efficiency is critical



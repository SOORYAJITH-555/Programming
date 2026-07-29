# Multivariable Linear Regression
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_squared_error

# 1️⃣ Load dataset
data = pd.read_csv("Advertising.csv")

# 2️⃣ Split into input (X) and output (Y)
features = ['TV', 'Radio', 'Newspaper']
target = 'Sales'
X = data[features]
y = data[target]

# 3️⃣ Split into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# 4️⃣ Create and train model
model = LinearRegression()
model.fit(X_train, y_train)

# 5️⃣ Predict on test data
y_pred = model.predict(X_test)

# 6️⃣ Evaluate accuracy
print("R² Score:", r2_score(y_test, y_pred))
print("Mean Squared Error:", mean_squared_error(y_test, y_pred))

# 7️⃣ Show coefficients
print("\nModel Coefficients:")
for feature, coef in zip(features, model.coef_):
    print(f"{feature}: {coef:.4f}")
print(f"Intercept: {model.intercept_:.4f}")

# 8️⃣ Visualization for Multivariable Regression
plt.figure(figsize=(6, 4))
plt.scatter(y_test, y_pred, color='blue', label='Test Data')  # actual vs predicted
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'r--', label='Ideal Fit Line')
plt.xlabel('Actual Sales')
plt.ylabel('Predicted Sales')
plt.title('Multivariable Linear Regression: Actual vs Predicted')
plt.legend()
plt.grid(True)
plt.show()


# 9️⃣ 🔮 Predict Sales for user-input advertising budgets
tv_budget = float(input("\nEnter TV advertising budget (in thousands of dollars): "))
radio_budget = float(input("Enter Radio advertising budget (in thousands of dollars): "))
newspaper_budget = float(input("Enter Newspaper advertising budget (in thousands of dollars): "))

new_input = pd.DataFrame([[tv_budget, radio_budget, newspaper_budget]], columns=features)
predicted_sales = model.predict(new_input)
print(f"\nPredicted Sales for TV=${tv_budget:.2f}k, Radio=${radio_budget:.2f}k, Newspaper=${newspaper_budget:.2f}k = {predicted_sales[0]:.2f} units")

"""
# Display regression equation
m1, m2, m3 = model.coef_
c = model.intercept_
print(f"\nRegression Equation: y = {m1:.2f}*TV + {m2:.2f}*Radio + {m3:.2f}*Newspaper + {c:.2f}")
"""

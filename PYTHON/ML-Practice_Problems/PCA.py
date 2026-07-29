# 🌸 PCA on IRIS Dataset
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

# 1️⃣ Load dataset
data = pd.read_csv("IRIS.csv")

# 2️⃣ Separate features and target
X = data.drop(columns=['species'])
y = data['species']

# 3️⃣ Standardize the data (PCA is sensitive to scale)
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# 4️⃣ Apply PCA (reduce to 2 dimensions for visualization)
pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)

# 5️⃣ Create a DataFrame for easy plotting
pca_df = pd.DataFrame(data=X_pca, columns=['PC1', 'PC2'])
pca_df['species'] = y

# 6️⃣ Explained variance
print("\n🔹 Explained Variance Ratio (importance of each PC):")
print(pca.explained_variance_ratio_)
print(f"\nTotal Variance Captured: {sum(pca.explained_variance_ratio_)*100:.2f}%")

# 7️⃣ Visualization
plt.figure(figsize=(7,5))
for species in pca_df['species'].unique():
    subset = pca_df[pca_df['species'] == species]
    plt.scatter(subset['PC1'], subset['PC2'], label=species)

plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.title("PCA - Iris Dataset (2D Projection)")
plt.legend()
plt.grid(True)
plt.show()

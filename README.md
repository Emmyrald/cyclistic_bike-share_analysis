# 🚴 Cyclistic Bike-Share Analysis

## 📌 Project Overview
This project analyzes usage patterns in a bike-share dataset to understand behavioral differences between **casual riders** and **annual members**. The goal is to generate actionable insights that can support **membership conversion strategies** and **operational decision-making**.

The analysis was conducted using **R**, with a strong focus on data cleaning, exploratory analysis, and clear data storytelling.

---

## 🎯 Objectives
- Compare ride behavior between casual riders and members
- Identify temporal patterns (weekday and time-of-day trends)
- Analyze bike type preferences using percentage-based comparisons
- Explore the relationship between ride duration and distance
- Provide data-driven recommendations for business strategy

---

## 📂 Dataset
- **Source:** Cyclistic Bike-Share Dataset  
- **Size:** ~6 million rows, 17 columns  
- **Granularity:** Individual bike rides  

> ⚠️ The raw dataset is not included in this repository due to size constraints.  
> Please download the dataset separately and place it in the project directory before running the analysis.

---

## 🧹 Data Cleaning & Preparation
Key preprocessing steps included:
- Converting timestamp columns (`started_at`, `ended_at`) to datetime format
- Recomputing the `weekday` variable from `started_at` to address missing values
- Removing invalid rides (e.g., negative or zero ride durations)
- Handling missing values and ensuring consistent factor levels

---

## 📊 Key Analyses & Insights

### Rider Type Comparison
- Members account for a higher volume of rides
- Casual riders tend to have **longer ride durations** and **greater travel distances**

### Weekly Patterns
- Members show consistent weekday usage
- Casual riders are more active on weekends, indicating leisure-oriented behavior

### Time-of-Day Trends
- Members display clear commuting patterns (morning and evening peaks)
- Casual riders ride more evenly throughout the day

### Bike Type Preferences
- Bike preferences were analyzed using **percentages** rather than raw counts
- This approach accounts for unequal group sizes and reveals true behavioral differences

### Ride Duration vs Distance
- Casual riders exhibit greater variability, reinforcing their recreational usage patterns

---

## 💡 Recommendations
- Introduce targeted **weekend membership promotions** for casual riders
- Optimize bike availability during weekday commute hours
- Align bike type availability with rider preferences to encourage conversion

---

## 🛠️ Tools & Technologies
- **R**
- **tidyverse**
- **dplyr**
- **lubridate**
- **ggplot2**
- **R Markdown**

---

## 📁 Repository Structure
```text
cyclistic-bike-share-analysis/
│
├── cyclistic_bike_share_analysis.Rmd
├── README.md
└── outputs/ (optional)
```

---

## ▶️ How to Run This Project
1. Download the Cyclistic bike-share dataset
2. Place the CSV file in the same directory as the R Markdown file
3. Open `cyclistic_bike_share_analysis.Rmd` in RStudio
4. Knit the file to HTML to reproduce the analysis

---

## ✨ Author
**Fuhad Lawal**  
Aspiring Data Analyst | Research-Oriented | Passionate about turning data into insights

---

## 📌 Notes
This project was completed as part of my data analytics learning journey and is intended to demonstrate real-world data handling, analytical thinking, and insight generation.

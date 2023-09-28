![Map1](https://github.com/apg1997/NFHS_AbdominalObesity/assets/63815811/0add6265-199c-445c-9037-e16e1cc103b3)# Abdominal Obesity in India 🇮🇳

🚀 This README provides comprehensive instructions for setting up and utilizing this repository within RStudio. The repository contains code and data related to a correspondence article to this paper: [Link to Correspondence Article](https://www.thelancet.com/journals/lansea/article/PIIS2772-3682(23)00068-9/fulltext).

## 📜 Table of Contents

1. 🚀 [Getting Started](#getting-started)
   - 📦 [Clone the Repository](#clone-the-repository)
   - 🔗 [Importing Data](#importing-data)
2. 📈 [Running the Analysis](#running-the-analysis)
   - 🧭 [Order of Execution](#order-of-execution)
3. 🔐 [License](#license)

---

## 🚀 Getting Started

### 📦 Clone the Repository

To begin, you'll need to clone this repository and set it up as a version-controlled project in RStudio. Please follow these steps:

1. 📌**Install R and RStudio**: If you haven't already, make sure you have R and RStudio installed on your machine. You can download them from the following links:
   - R: [Download R](https://cran.r-project.org/mirrors.html)
   - RStudio: [Download RStudio](https://www.rstudio.com/products/rstudio/download/)

2. 📋**Clone the Repository**:

   - Open RStudio.
   - Click on "File" in the top menu.
   - Select "New Project..."
   - Choose "Version Control" and then "Git".
   - In the "Repository URL" field, enter the URL of this repository.
   - Choose a directory where you want to create your project.
   - Click "Create Project".

RStudio will clone the repository and set it up as a project, ensuring you have all the necessary files and environment ready for use.

### 🔗 Importing Data

Once the project is set up, you'll need to import the essential data files. Ensure that the data files are placed in a directory within the project's root directory. Follow these steps:

1. 📁**Create a 'Data_raw' Folder**:

   - In your project directory, create a new folder named 'Data_raw'.

2. ⬇️**Download Data Files**:

   - Download the Household Members Recode, Individual Recode, and Men's Recode STATA files from the [DHSProgram website](https://dhsprogram.com/data/dataset/India_Standard-DHS_2020.cfm?flag=1). The files to download are IAPR7EDT, IAIR7EDT, and IAMR7EDT, respectively.

3. 📁**Extract Data Files**:

   - Extract the downloaded .rar files in such a way that each .rar file corresponds to a separate folder within the 'Data_raw' directory.

Here's the expected file structure:


  ```
NFHS_AbdominalObesity
├───Data_clean
├───Data_raw
│   ├───IAIR7EDT
│   ├───IAMR7EDT
│   ├───IAPR7EDT
│   ├───sdr_subnational_boundaries_2023-08-21
│   │   └───shps
│   └───shapefile
├───Output
└───Session info
```
The Output directory is the location for exporting output from running the R Markdown and Scripts files.
The Session info folder contains details regarding the packages used in the code, as well as the locations of the files corresponding to the packages.

## 📈 Running the Analysis

To perform the analysis, follow these steps:

1. 📝**Execute R Markdown Files**:

   - The variables used can be seen in Data_raw/variable_key.csv.
   - Open the following .Rmd files in RStudio:
     - women.Rmd
     - men.Rmd
     - visualizations.Rmd
     - maps.Rmd
     - flowcharts.R

2. 🏃️**Run All Chunks**:

   - For each .Rmd file, run all code chunks. We recommend using the "Restart R and Run All Chunks" command to minimize the risk of R Session suspension.

By following this order, you'll ensure that each file builds upon the results of the previous ones and that the project progresses as intended.

## Outputs
### Maps
[state-level-prevalence-maps]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

### Flowcharts
### Forestplots
### Models

## 🔐License
[![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

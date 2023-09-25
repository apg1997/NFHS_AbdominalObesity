
# NFHS_AbdominalObesity

Welcome to the [Repository Name]! This README file provides instructions on setting up and using this repository with RStudio. The repository contains [brief description of the project or dataset].

Code for Correspondence Article to this paper
https://www.thelancet.com/journals/lansea/article/PIIS2772-3682(23)00068-9/fulltext#secsectitle0010

## Table of Contents

1. [Getting Started](#getting-started)
   - [Clone the Repository](#clone-the-repository)
   - [Importing Data](#importing-data)
2. [Running the Files](#running-the-files)
   - [Order of Execution](#order-of-execution)

---

## Getting Started

### Clone the Repository

To get started, you'll need to clone this repository using RStudio as a version-controlled project. Here are the steps:

1. **Install R and RStudio**: If you haven't already, make sure you have R and RStudio installed on your machine. You can download them from the following links:
   - R: [Download R](https://cran.r-project.org/mirrors.html)
   - RStudio: [Download RStudio](https://www.rstudio.com/products/rstudio/download/)

2. **Clone the Repository**:

   - Open RStudio.
   - Click on "File" in the top menu.
   - Select "New Project..."
   - Choose "Version Control" and then "Git".
   - In the "Repository URL" field, enter the URL of this repository.
   - Choose a directory where you want to create your project.
   - Click "Create Project".

   RStudio will now clone the repository and set it up as a project. You'll have the project files and environment ready for use.

### Importing Data

Once you have the project set up, you can import the necessary data. Make sure the data files are placed in a directory within the project's root directory. 

   1. Create a 'Data_raw' folder in the project directory.
   2. Download the Household Members Recode, Individual Recode and Mens Recode STATA files from the DHSProgram website. The .rar files downloaded would be IAPR7EDT, IAIR7EDT and IAMR7EDT respectively. Extract the rar files such that there are corresponding folders for each rar file. you should have the following file structure.

  
  ```
NFHS_AbdominalObesity
├───Data_clean
├───Data_raw
│   ├───IAIR7EDT
│   ├───IAMR7EDT
│   ├───IAPR7EDT
│   ├───sdr_subnational_boundaries_2023-08-21
│   │   └───shps
├───Output
└───Session info
```

## Order of Execution

Open each .Rmd file in the following order and run all chunks. It is recommended that the "Restart R and Run All Chunks" command be used to minimise risk of R Session being suspendend.

   1. women.Rmd
   2. men.Rmd
   3. visualisations.Rmd
   4. maps.Rmd


Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

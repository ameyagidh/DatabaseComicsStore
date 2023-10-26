# DatabaseComicsStore

## Overview

The application's database design consists of well-structured tables to efficiently manage manga-related data. It includes tables for manga details, publishers, authors, admins, users, sellers, reviews, and reading lists. These tables are interconnected to establish relationships between manga, users, and other entities. The design ensures data integrity and facilitates smooth data retrieval and storage.

<img width="763" alt="Screenshot 2023-10-26 at 2 55 36 AM" src="https://github.com/ameyagidh/DatabaseComicsStore/assets/65457905/87fa51a6-a5e7-4294-b081-cc056cde125a">
<img width="826" alt="Screenshot 2023-10-26 at 2 55 59 AM" src="https://github.com/ameyagidh/DatabaseComicsStore/assets/65457905/f2ab4601-ad92-4f2f-b46a-a13003e4ec1f">

## Setup and Prerequisites

Before running the program, ensure you have the following installed:

- [MySQL Workbench](https://www.mysql.com/products/workbench/?p=857)
- [Python](https://www.python.org/downloads/)

### Installation

1. Download and unzip the program files.
2. Import the SQL file for the database dump provided in the zip file using MySQL Workbench (Server -> Data Import -> Select the dump file).
3. Install the required Python libraries using the following commands:

```bash
pip install PyMySQL
pip install cryptography
pip install prettytable
```

## Running the Program

1. Locate the program files and right-click on the file containing "Driver" in the name (MangaAppDriver). Select "Copy as path" to get the file path.
2. Open a command prompt in full screen mode for optimal display.
3. Paste the file path and press Enter. If this doesn't work, follow the alternative instructions below.
4. Alternatively, type the following command, replacing `(file path)` with the actual file path:

```bash
python (file path)
```

## Project Description

### Domain Interest

This project was inspired by our love for manga. We wanted to create an application for tracking and reviewing the manga we read. We believe that manga is an enjoyable topic and wanted to build an organized system for manga enthusiasts.

### Technical Specifications

The application uses a MySQL database, Python for scripting, and various Python libraries, including PyMySQL, cryptography, and PrettyTable. The command-line interface provides a user-friendly experience for tracking and managing manga.

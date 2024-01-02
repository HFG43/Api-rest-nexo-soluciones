<a name="readme-top"></a>

<div align="center">
  <h1><b>API Nexo Soluciones</b></h1>
</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [About](#about-project)
  - [🛠 Built With](#-built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    - [ERD](#erd)
  - [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run linters](#run-linters)
  - [👥 Authors](#authors)
  - [📝 License](#license)

---

<!-- PROJECT DESCRIPTION -->

# About <a name="about-project"></a>

**"API Nexo Soluciones"** is an API designed to host people data and their addresses. It was designed in Ruby on Rails and PostgreSQL.

---

<!-- BUILT WITH -->

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
    <li><a href="https://github.com/rswag/rswag">API Documentation (Swagger)</a></li>
  </ul>
</details>

<details>
  <summary>Linters</summary>
  <ul>
    <li><a href="https://rubocop.org/">Rubocop</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

<ul>
  <li>Ruby on Rails framework</li>
  <li>
    Use Linters to check code quality
    <ul>
      <li>Rubocop</li>
    </ul>
  </li>
  <li>MVC architectural/design pattern</li>
  <li>Data persistent in PostgreSQL</li>
  <li>RESTful API</li>
  <li>Swagger to generate API doc</li>
  <li>People endpoints</li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- ERD -->

### ERD  <a name="front-end"></a>

On the following ERD you can see the structure of this project.

<img src="assets/images/ERD.png" alt="ERD" width=900px />

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

<ul>
    <li>A code editor (we recommend Visual Studio Code)</li>
    <li>Git and a GitHub account</li>
    <li>Ruby on Rails, you can get it<a href="https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails"> here</a></li>
    <li>PostgreSQL, you can get it<a href="https://www.postgresql.org/download/"> here</a></li>
</ul>

### Setup

Clone this repository to your desired folder by using the command:

```sh
git clone https://github.com/HFG43/Api-rest-nexo-soluciones.git
```

### Install

Go to the project directory:

```
 cd final_capstone_back_end
```

Before to run the program, run the following command to install the necessary gems:

```sh
 bundle install
```

After installing the gems, run the following command to create and migrate the database:

```sh
 rails db:create
 rails db:migrate
```

### Usage

Run the following command inside the project folder to start the application:

```sh
  rails s
```

### Testing

On this app you can find different test of models and request in the `spec` directory, to run them follow any of the following commands:

```sh
  rspec
  bundle exec rspec
```

Those commands will start the application on your local server. You can now open your browser and go to http://localhost:3000/ to see the application running.

Remember that this is an API so, to read the documentation follow [this](http://localhost:3000/api-docs) link after started the server.

### Run linters

To verify that the ruby code is written without errors and meets good practice standards, run the following command inside the project folder:

- **ruby linter:**

```sh
 rubocop
```

To fix the linter use any of the following options:

```sh
  rubocop --fix
  rubocop -A
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- AUTHORS -->

## 👥 Authors <a name="author"></a>

👤 **Hernán Güemes**

- GitHub: [@HFG43](https://github.com/HFG43)
- LinkedIn: [hernanguemes](https://www.linkedin.com/in/hernanguemes)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

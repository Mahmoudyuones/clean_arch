# 🏗️ Clean Architecture Flutter App

## 📘 Overview  
This project is a **Flutter application** built using the **Clean Architecture** approach that was not foucsin on UI, designed to ensure **scalability, maintainability, and testability**.  
The app applies **all SOLID principles** and follows well-known **design patterns** (such as Repository, Factory, and Dependency Injection) to maintain a clean, modular codebase.

---

## 🧠 Key Concepts Implemented  

### 🔹 Clean Architecture  
The project is structured into **three main layers**:
- **Presentation Layer** – Handles UI and user interaction using `Bloc` for state management.  
- **Domain Layer** – Contains business logic and use cases.  
- **Data Layer** – Responsible for API calls, local data caching, and repositories.

Each layer is **independent** and communicates only through well-defined **interfaces/contracts**.

---

### 🔹 SOLID Principles  

1. **S – Single Responsibility Principle (SRP)**  
   Every class has **one responsibility** — for example, each Use Case performs a single, well-defined action.

2. **O – Open/Closed Principle (OCP)**  
   The system is **open for extension but closed for modification**. Adding new features does not require changing existing logic.

3. **L – Liskov Substitution Principle (LSP)**  
   All derived classes (e.g., different data sources) can replace their base classes without altering the program behavior.

4. **I – Interface Segregation Principle (ISP)**  
   Each interface defines **only the methods it needs**, avoiding large, unused method sets.

5. **D – Dependency Inversion Principle (DIP)**  
   High-level modules do not depend on low-level modules; both depend on **abstractions**. Implemented using **Dependency Injection** (`get_it` and `injectable`).

---

### 🔹 Design Patterns Used  

- **Repository Pattern** → To separate data access logic from business logic.  
- **Factory Pattern** → For creating objects in a controlled manner.  
- **Dependency Injection (DI)** → Using `get_it` and `injectable` for loose coupling.  
- **Use Case Pattern** → Encapsulates business logic operations.  
- **State Management (BLoC Pattern)** → Ensures predictable state changes.  

---

## ⚙️ Tech Stack  

| Layer | Technology |
|-------|-------------|
| **UI / State Management** | Flutter, Bloc |
| **Dependency Injection** | get_it, injectable |
| **Networking** | Dio, Retrofit |
| **Data Storage** | SharedPreferences / Hive (optional) |
| **Architecture** | Clean Architecture |
| **Code Quality** | SOLID + Design Patterns |

---

## 🗂️ Folder Structure  

```
lib/
│
├── config/                # App configuration (DI setup, constants, etc.)
│
├── core/                  # Shared utilities, base classes, error handling
│
├── features/
│   └── home/
│       ├── data/          # Data sources, models, repositories
│       ├── domain/        # Entities, repositories, use cases
│       └── presentation/  # UI, ViewModels, Bloc, States
│
└── main.dart              # App entry point
```

---

## 🚀 How to Run  

1. Clone this repository:  
   ```bash
   git clone https://github.com/yourusername/clean_arch_flutter_app.git
   ```
2. Get dependencies:  
   ```bash
   flutter pub get
   ```
3. Generate injectable files:  
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:  
   ```bash
   flutter run
   ```

---

## 🧩 Example Features  

- Fetching product data from API  
- Handling multiple data states (loading, success, error)  
- Layered structure following Clean Architecture  
- Error handling with custom response classes (`BaseResponse`, `SuccessResponse`, `ErrorResponse`)

---

## 🧱 Principles in Action  

✅ High cohesion & low coupling  
✅ Easy to test and extend  
✅ Scalable for large projects  
✅ Fully maintainable architecture  

---

## 🧑‍💻 Author  
**Mahmoud Younes**  
Flutter Developer
📧 Email: mywns211@gmail.com  
💼 LinkedIn: https://www.linkedin.com/in/MahmoudYounis1

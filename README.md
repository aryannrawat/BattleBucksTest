

# 📱 SwiftUI Posts App

![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS-blue)
![Platform](https://img.shields.io/badge/Platform-iOS14%2B-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-success)

A clean, modern SwiftUI app that fetches posts from an API and allows users to browse, search, view details, and manage favorites — built with MVVM and best practices.

---



## ✅ Features

* ✅ Fetch posts from remote API
* ✅ Display posts in a list
* ✅ Real-time search by title
* ✅ Post details screen
* ✅ Mark/unmark favorites
* ✅ Favorites tab
* ✅ MVVM clean architecture

---

## 🔗 API Used

Endpoint:
`https://jsonplaceholder.typicode.com/posts`

Each post includes `userId`, `id`, `title`, and `body`. 

---

## 🛠️ Tech Stack

* **Swift**
* **SwiftUI**
* **MVVM**
* **URLSession**
* **NavigationStack / TabView**
* **Async/Await or Combine** (if used)

---

## 📂 Project Structure (MVVM)

```
├── Models
│   └── Post.swift
├── ViewModels
│   └── PostsViewModel.swift
├── Views
│   ├── PostsListView.swift
│   ├── PostDetailView.swift
│   └── FavoritesView.swift
├── Services
│   └── APIService.swift
```

* **Model** – Represents post data
* **ViewModel** – Handles fetching, searching, favorites
* **View** – UI updates based on state

Networking logic is not handled inside the View. 

---

## 🚀 Setup Instructions

1. Clone the repo:

   ```bash
   git clone https://github.com/aryannrawat/BattleBucksTest.git  
   ```
2. Open in Xcode
3. Build & Run

✅ No third-party dependencies required.

---

## 📱 Requirements

* **iOS:** 14.0+
* **Xcode:** 15+
* **Swift:** 5.9+

> Replace versions if different.

---

## ⭐ Bonus Features (If Included)

* Loading indicator
* Error handling
* Pull-to-refresh

(These are part of the optional goals.) 

---

## 💡 Future Improvements

* Persistent favorites (UserDefaults/CoreData)
* Pagination
* Unit tests
* Dark mode UI tweaks

---
## 📄 License

This project is licensed under the **MIT License**.

---



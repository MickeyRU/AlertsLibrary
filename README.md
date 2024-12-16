**[README_en.md](README_en.md)**
# iOSAlertLibrary

**iOSAlertLibrary** — это библиотека для отображения уведомлений на базе SwiftUI, которая может работать на любом экране.

<table>
    <thead>
        <tr>
            <th>Тосты</th>
            <th>Динамический остров</th>
            <th>Алерты</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <img src="https://github.com/user-attachments/assets/568f0232-33e3-4113-8c74-490a644aaba6" height="400" alt="Toasts"/>
            </td>
            <td>
                <img src="https://github.com/user-attachments/assets/9e341c68-56d9-4d5a-9a5b-895755a30e86" height="400" alt="DynamicIsland"/>
            </td>
            <td>
                <img src="https://github.com/user-attachments/assets/e047ec71-fb6d-4157-b283-79f1a6de2cb3" height="400" alt="Alerts"/>
            </td>
        </tr>
    </tbody>
</table>

---

## Возможности

- ✅ Готовый набор уведомлений с различным дизайном и конфигурациями.
- ✅ Toast-уведомления с возможностью изменения размера по тапу.
- ✅ Уведомления для Dynamic Island.
- ✅ Предустановленные анимации с настраиваемыми параметрами.
- ✅ Поддержка пользовательского UI для уведомлений.
- ✅ Набор жестов (свайпы в четырех направлениях, тапы).
- ✅ Отображение уведомлений поверх любого экрана.
- ✅ Полная адаптация к темной теме.
- ✅ Поддержка поворота экрана.
- ✅ Доступна в SPM (Swift Package Manager).
- ✅ Наличие UI-тестов для проверки функциональности.

---

## Настройте уведомление под себя!

Библиотека предоставляет удобный интерфейс для создания и показа уведомлений. Вы можете использовать готовые шаблоны уведомлений или подключить собственный пользовательский интерфейс.

```swift
// Создание экземпляра библиотеки
let iosAlertlibrary = iOSAlertLibary()

// Создание уникального ID для уведомления
let id = UUID().uuidString

// Настройка конфигурации уведомления
let alertConfig = AlertConfig(
    icon: "trash.fill",
    lightModeIconColor: .blue,
    darkModeIconColor: .blue.opacity(0.8),
    title: "Хранилище заполнено!",
    lightModeTitleColor: .black,
    darkModeTitleColor: .white,
    message: """
             В вашем облаке закончилось место. Вы больше не можете сохранять данные. \
             Удалите ненужные файлы или обновите тарифный план.
             """,
    lightModeMessageColor: .gray,
    darkModeMessageColor: .gray,
    lightModeBackgroundColor: .white,
    darkModeBackgroundColor: Color(white: 0.15),
    dismissAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
    cancelButtonConfig: nil,
    continueButtonConfig: AlertButtonConfig(
        title: "Обновить тариф",
        action: { print("Тариф обновлен") },
        lightModeTitleColor: .white,
        darkModeTitleColor: .white,
        lightModeBackgroundColor: .blue,
        darkModeBackgroundColor: .blue
    )
)

// Создание уведомления (вью)
let alert = AlertView(config: alertConfig)

// Настройка контейнера уведомления
let containerConfig = ContainerConfig(
    id: id,
    duration: 3,
    position: .top,
    gestures: [.swipe(direction: [.up], threshold: 20)],
    animationType: .slide,
    animationConfig: AnimationConfig(
        offset: (x: (start: -50, end: 0), y: (start: 0, end: 0)),
        opacity: (start: 0, end: 1),
        scaleEffect: (from: 1, anchor: .center)
    )
)

// Создание контейнера уведомления
let container = BasicContainerView(content: alert, containerConfig: containerConfig)

// Показ уведомления на экране
iosAlertlibrary.showAlert(container: container, useOverlayWindow: false)

// Принудительное скрытие уведомления
iosAlertlibrary.dismissAlert(id: id)
```

## Компоненты Библиотеки

Архитектура библиотеки разделена на модули, что позволяет использовать только необходимую часть функционала.

- [Alerts UI presets](Sources/iOSAlertLibrary/NotificationsUI) - Набор готовых шаблонов уведомлений.
- [BasicContainerView](Sources/iOSAlertLibrary/Core/Containers/BasicContainerView.swift) - Промежуточная обертка над UI-элементом (View), позволяющая настраивать жесты и анимации, реализующая протокол ContainerViewProtocol.
- [AlertPresentationManager](Sources/iOSAlertLibrary/Core/Managers/AlertPresentationManager.swift) - Менеджер, отвечающий за показ контейнеров (View, реализующих протокол ContainerViewProtocol) на экране и управление их жизненным циклом.

## Требования

| Платформы | 
|-----------| 
| iOS 16.0+ | 

## Авторы

<a href="https://github.com/MickeyRU"><img src="https://github.com/MickeyRU.png" width="50" height="50" /></a>
<a href="https://github.com/Archichil"><img src="https://github.com/Archichil.png" width="50" height="50" /></a>
<a href="https://github.com/Uvexer"><img src="https://github.com/Uvexer.png" width="50" height="50" /></a>

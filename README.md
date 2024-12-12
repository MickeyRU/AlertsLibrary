# iOSAlertLibrary

**iOSAlertLibrary** — это библиотека для отображения уведомлений на базе SwiftUI, которая может работать на любом экране.

<p float="left">
  <img src="https://github.com/user-attachments/assets/eabd0544-6911-4187-b883-15d3f13ab7f0" width="23%" />
  <img src="https://github.com/user-attachments/assets/d2253dae-29a8-4cb6-86aa-7f12265a1ce1" width="23%" />
  <img src="https://github.com/user-attachments/assets/1f0ba5b3-eec2-48f9-93ac-bd68bb44582d" width="23%" />
  <img src="https://github.com/user-attachments/assets/73bfc58c-44ee-4550-9e84-74440dbbb3b7" width="23%" /> 
</p>

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

- [Alerts UI presets](https://github.com/Yandex-360-Mobile-Bootcamp/AlertsLibrary/tree/spm/iOS/SPM/Sources/iOSAlertLibrary/NotificationsUI) - Набор готовых шаблонов уведомлений.
- [BasicContainerView](https://github.com/Yandex-360-Mobile-Bootcamp/AlertsLibrary/blob/spm/iOS/SPM/Sources/iOSAlertLibrary/Core/Containers/BasicContainerView.swift) - Промежуточная обертка над UI-элементом (View), позволяющая настраивать жесты и анимации, реализующая протокол ContainerViewProtocol.
- [AlertPresentationManager](https://github.com/Yandex-360-Mobile-Bootcamp/AlertsLibrary/blob/spm/iOS/SPM/Sources/iOSAlertLibrary/Core/Managers/AlertPresentationManager.swift) - Менеджер, отвечающий за показ контейнеров (View, реализующих протокол ContainerViewProtocol) на экране и управление их жизненным циклом.

## Требования

| Platform                                             | 
| ---------------------------------------------------- | 
| iOS 16.0+ | 

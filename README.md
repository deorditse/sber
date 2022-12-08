Документация

Приложение разделено на слои логики для чистой архитектуры, Есть 3 основных слоя:
(data_layout) -> (business_layout) -> (ui_layout)
сервисный слой (data_layout) самый низкоуровневый, он не затягивает в себя никакие основные слои,
затем идет слой бизнес логики - State Management (business_layout) он затягивает в себя только слой
данных (data_layout), на верхнем уровне находится слой ui_layout, он затягивает в себя только слой
бизнес логики (business_layout)

_____Слой (models) затягивается во все основные слои (модели парсинга данных)

(business_layout)
Состоит из контроллеров управления состояниями - State Management

(data_layout)
Сервисный слой приложения - обращения к API, Web Socked, хранилищам и тд

В виджете SubscriptionCheckPage идет отображение виджета контейнера по индексу

index 0 - отображение контейнера Проверка электронной подписи index 1 - отображение контейнера
Протокол проверки электронной подписи

индекс (indexBodyWidgetInListBody) меняется на слое (business_layout) через контроллер
ImplementControllerSubscriptionCheckPage

Все управление состояниями для текущей страницы реализовано через GETX на слое (business_layout)
через контроллер ImplementControllerSubscriptionCheckPage

Для каждой новой страницы реализуется свой контроллер, чтобы диспозить закрытую страницу и
высвобождать память 


//для deploy test 
firebase init  .. build/web
flutter build web
firebase deploy --only hosting

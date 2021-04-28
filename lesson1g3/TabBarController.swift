//
//  TabBarController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 14.04.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    func fillArrays() {
        
        let user1 = setNewUser(userNumber: 1, name: "Elon Musk", age: 49, gender: .male)
        let user2 = setNewUser(userNumber: 2, name: "Quentin Tarantino", age: 58, gender: .male)
        let user3 = setNewUser(userNumber: 3, name: "Tim Cook", age: 60, gender: .male)
        let user4 = setNewUser(userNumber: 4, name: "Selena Gomez", age: 28, gender: .female)
        let user5 = setNewUser(userNumber: 5, name: "Scarlett Johansson", age: 36, gender: .female)
        
        let usersArray = [user1, user2, user3, user4, user5]
        
        let group1 = Group(name: "Фильмы", description: "Отборные фильмы на каждый день", groupAvatar: UIImage(named: "films"))
        let group2 = Group(name: "Музыка", description: "Музыкальные новинки недели", groupAvatar: UIImage(named: "music"))
        let group3 = Group(name: "Интересные факты", description: "Как много ты знаешь о мире?", groupAvatar: UIImage(named: "facts"))
        let group4 = Group(name: "Рецепты", description: "Готовь вкусно вместе с нами", groupAvatar: UIImage(named: "food"))
        
        let groupArray = [group1, group2, group3, group4]
        
        
        let news1 = setNewNews(user: user1, newsTitle: "Илон Маск отправит людей на Луну в 2024 году", newsText: "В, 2024 году космическая отрасль будет богата на события. Мало того, что китайские власти намерены построить лунную базу, так ещё и Илон Маск хочет отправить людей на спутник в том же 2024-м. \nПост с подтверждением этой информации миллиардер опубликовал в своём Twitter-аккаунте, передаёт SlashGear. Что интересно, проект отправки людей на Луну — это совместное «детище» SpaceX и космического агентства NASA.\nБолее того, ранее Маск уже заявлял о планах высадить людей естественный спутник Земли. Но то было сделано в 2019 году, во времена президентства Трампа. После поражения последнего, многие эксперты выступили с предположением, что глава SpaceX изменит сроки проекта. Но, как оказалось, все планы остаются в силе.\nДля отправки людей на Луну планируется использоваться Starship.")
        
        let news2 = setNewNews(user: user2, newsTitle: "Почему легендарный 'Побег из Шоушенка' сначала не пришелся зрителям по душе?", newsText: "Трудно представить, но «Побег из Шоушенка» вначале особого успеха у зрителей не имел. А все из-за еще одной киноленты - «Криминальное чтиво» Квентина Тарантино. Именно вторая отобрала внимание всех телезрителей.")
        
        let news3 = setNewNews(user: user3, newsTitle: "Продажи новых iPad Pro на процессоре Apple M1 стартуют только 21 мая", newsText: "На прошлой неделе Apple анонсировала существенно переработанные модели iPad Pro. Новые 11- и 12,9-дюймовая модели получили мощный процессор М1, использующийся в ноутбуках и настольных компьютерах компании. Приём предзаказов на оба устройства стартует 30 апреля. Apple заявила, что в розницу они поступят когда-то «во второй половине мая». Надёжный аналитик Джон Проссер (Jon Prosser) назвал точные даты.\nЛюбопытно, что 11- и 12,9-дюймовая версии планшета выйдут на рынок с разницей в один день. Проссер сообщает, что 12,9-дюймовый iPad Pro можно будет приобрести 21 мая. Тем, кому приглянулась более компактная 11-дюймовая модель придётся подождать до 22 мая. Любопытно, что 22 мая будет суббота, а Apple обычно воздерживается от запуска новых продуктов в выходные дни. Напомним, что согласно слухам, некоторые поставщики Apple сильно страдают из-за глобального дефицита полупроводников. Именно этим и обусловлен такой большой промежуток между презентацией и стартом продаж новых устройств.\nНапомним, что новые iPad Pro внешне практически не отличаются от своих предшественников. Тем не менее, они получили совершенно новую платформу, представленную компьютерным ARM-чипом М1, а 12,9-дюймовая версия может похвастаться новой Mini-LED-матрицей Liquid Retina XDR. Профессионалов также порадует поддержка встроенным разъёмом USB-C с поддержкой Thunderbolt 4, благодаря чему появилась возможность выводить изображение на внешний монитор, а также подключать другие внешние устройства.")
        
        let news4 = setNewNews(user: user4, newsTitle: "Селена Гомес всерьез задумалась над завершением музыкальной карьеры: певица сделала признание", newsText: "Американская певица Селена Гомес сообщила грустную для своих поклонников новость — она думает над тем, чтобы уйти со сцены. 28-летняя певица считает, что часть слушателей не воспринимает ее всерьез. Это и стало причиной того, что исполнительница задумалась над тем, чтобы покинуть сцену.\nКроме того, Гомес заинтриговала выходом нового альбома – в нем певица обещает раскрыться для своих поклонников совершенно с другой стороны. Также звезда американского шоу-бизнеса призналась, что на данный момент своей самой удачной композицией она считает трек «Lose You to Love Me».")
        
        let news5 = setNewNews(user: user5, newsTitle: "Скарлетт Йоханссон рассказала о трудностях организации свадьбы в пандемию", newsText: "Актриса Скарлетт Йоханссон в интервью изданию People раскрыла некоторые подробности своей камерной свадьбы с комиком Колином Жостом, которая состоялась в октябре прошлого года в период пандемии коронавируса.\nЦеремония прошла в Нью-Йорке. Из гостей присутствовали только близкие пары. По словам исполнительницы роли Черной Вдовы в блокбастерах Marvel, сделать свадьбу такой закрытой им пришлось из-за COVID-19.\nСкарлетт Йоханссон из-за этого не очень расстроилась и даже нашла плюсы. 'Знаете, я никогда не росла с мыслью о свадьбе своей мечты. Вместо этого я представляла, каким должен быть партнер моей мечты', — прокомментировала актриса. Она добавила, что вместе с женихом в этот день постаралась создать максимально интимную обстановку для себя и членов своей семьи, чтобы абстрагироваться от негатива, связанного с коронавирусом.'Мы преднамеренно хотели сделать так, чтобы свадьба была закрытой, но при этом чтобы это не выглядело так, что мы вынужденно пошли на это из-за ограничений. — пояснила Йоханссон. — Ради этого мы соблюли все меры предосторожности и следовали всем протоколам, чтобы все чувствовали себя комфортно и в безопасности'.")
        
        let newsarray = [news1, news2, news3, news4, news5]
        
        DataStorage.shared.usersArray = usersArray
        DataStorage.shared.recommendedGroups = groupArray
        DataStorage.shared.newsArray = newsarray
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArrays()
        
        
    }
    
    
    
    
}

//
//  PageViewController.swift
//  SpaceX-info
//
//  Created by 2lup on 27.08.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var rocketsData: [Rocket]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var networkManager = NetworkManager()
        networkManager.delegate = self
        rocketsData = networkManager.performRequest()
                
        // устанавливаем себя источником данных для UIPageViewControllerDataSource
        self.dataSource = self
        
    }
}

// MARK: - UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    
    // viewControllerBefore - возвращаем предыдущий ViewController
    // return nil - означает, что страница предыдущая/следующая не существует
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // получаем индекс предыдущего ViewController
        let index = ((viewController as? SpaceRocketInfoViewController)?.index ?? 0) - 1
        return createPageViewController(for: index)
    }

    // viewControllerBefore - возвращаем следующуй ViewController
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // получаем индекс следующего ViewController
        let index = ((viewController as? SpaceRocketInfoViewController)?.index ?? 0) + 1
        return createPageViewController(for: index)
    }
    
    // метод генерирующий ViewController для определенного индекса
    func createPageViewController(for index: Int) -> UIViewController? {
        // проверяем что бы мы не вышли за пределы количества ViewController
        if (index < 0) || (index > 3) {
            return nil
        } else {
            // instantiateViewController - Создает ViewController с указанным идентификатором (storyboard ID) и инициализирует его данными из storyboard
            // И кастим результат до нашего кастомного ViewController
            let vc = storyboard?.instantiateViewController(withIdentifier: "SpaceRocketInfoSID") as? SpaceRocketInfoViewController
            vc?.index = index
            vc?.rocketData = rocketsData?[index]
            return vc
        }
    }
}

extension PageViewController: NetworkManagerDelegate {
    func didUpdateRocketsData(_ networkManager: NetworkManager, data: [Rocket]?) {
        rocketsData = data
        
        // устанавливаем ViewController, что первым отобразится на экране PageViewController, передавая массив с одним ViewController (setViewControllers можно добавить комплишнхендлер)
        if let vc = self.createPageViewController(for: 0) {
            self.setViewControllers([vc], direction: .forward, animated: true)
        }
    }
}

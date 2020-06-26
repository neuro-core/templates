## Шаблоны

* Шаблон README
* Шаблон отчёта по спринту

## Скрипт для загрузки шаблонов

Чтобы удобно создавать шаблон README или отчёта в папке - предлагаю добавить
удобный bash_alias

#### Установка

Для этого необходимо:
 
* открыть для редактирования файл в удобном вам редакторе `~/.bash_aliases`
    * `vi ~/.bash_aliases`
* добавить туда в конец файла содержимое скрипта [alias.sh](./alias.sh)
    * `cat alias.sh >> ~/.bash_aliases`
После этого: `source ~/.bash_aliases` или перезапустить консоль

#### Использование

Теперь в любой папке можно писать:

Для создания шаблона README:
* `nci d`
* `nci readme`

Для создания шаблона отчёта:
* `nci r`
* `nci report`

Для выгрузки логотипа:

* `nci l`
* `nci logo`
    * по умолчанию - обычный [png логотип](./logo/neuro-core-logo.png)
    * `mini`- [минимизированный логотип](./logo/neuro-core-logo-mini.png)
    * `gif`- [gif логотип](./logo/neuro-core-logo.gif)

## Сборка в PDF

#### Как это работает

Посмотроено на базе классного [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf)

* Нужно установить nodejs, npm
* `npm install -g md-to-pdf`
* для удобства можете сделать symlink с `md-to-pdf` на `md2pdf`

#### Как пользоваться

* В папке, где есть файлы, в зависимости от настроенного alias для md-to-pdf:
    * `md2pdf report-25.06.20.md`
    * `md-to-pdf report-25.06.20.md`
* Это создаст файл `report-25.06.20.pdf` в этой же папке

### Автодобавление в репозитории

Когда нужно пройтись по репозиториям, где нет документации и добавить шаблоны:

```
alias ncd="neuro_core_create_readme_all"

neuro_core_create_readme_all (){
    wget https://raw.githubusercontent.com/neuro-core/templates/master/readme-template.md
    git add readme-template.md
    git commit -m 'add readme template'
    git push
}
```

Можно это всё обернуть в скрипт, который будет проходить по каждой папке внутри папки:

* `find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && ncd" \;`

via [StackOverflow](https://stackoverflow.com/questions/7470165/how-to-go-to-each-directory-and-execute-a-command)

## Лицензия

* MIT, 2020

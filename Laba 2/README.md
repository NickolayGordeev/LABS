## ЛАБОРАТОРНАЯ РАБОТА №2

### ЗАДАНИЕ 1 (СОЗДАНИЕ ДИСКОВ)

Слепил виртуалку с двумя дисками по 5 ГБ каждый.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-01.jpg)

Дошёл до установки дисков.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-02.jpg)

Разделил диски.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-03.jpg)

Организовал зеркальный RAID (он же RAID 1).

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-04.jpg)

Разделил всё на логические тома.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-05.jpg)

Разметил разделы.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-06.jpg)

Финал настройки дисков.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-07.jpg)

Скопировал содержимое диска sda1 в sdb1. Скорость оставляет желать лучшего.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-08.jpg)

Посмотрел диски через fdisk -l.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-09.jpg)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-10.jpg)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-11.jpg)

Структурное представление дисков.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-12.jpg)

Среди них: sda1 и sdb1 — огрызочки, что были специально выделены при установке (хотя я просил 512 МБ, жадная машина требует платить налоги). Md0 — собственно, RAID, причём идентичен на обоих дисках, так как по условию он зеркального типа. Далее идут логические тома. Отдельно можно отметить sr0 — это, судя по всему, оперативная память. Раз во время установки я ставил grub на диск sda, очевидно, что теперь его надо поставить на второй диск. Плюс узнал (что-то) о RAIDе.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-13.jpg)

Команда pvs выводит информацию о физических томах (предположительно, Physical Volume Statistics)
vgs — информация о группе томов.
lvs — информация о логических томах.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_1-14.jpg)

За эту часть лабораторной работы я в который раз установил Debian, однако теперь я поднастроил дис-ки, создал зеркальный RAID и разделил его на три логических тома. После установки я по большей части осмотрелся и получил представление о том, как связаны между собой подразделы дисков, а также какие полезные команды используются для просмотра информации по дискам.

### ЗАДАНИЕ 2 (ЭМУЛЯЦИЯ ОТКАЗА ОДНОГО ИЗ ДИСКОВ)

Люблю отказ диска по утру. (Примечание: можно отключить диск и через настройки VirtualBox, но у нас ведь спонтанный отказ, так что рубим под корень)

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-01.JPG)

RAID зеркальный, так что неудивительно, что машинка всё ещё пашет. Но теперь эта штука показывает 2/1, а не 2/2. Наверное, тонкий намёк на то, что одним диском стало меньше.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-02.JPG)

Создал новый диск. Машина что-то заподозрила.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-03.JPG)

Ага, а вот и замена подъехала. Примечательно, что после удаления ssd1 машина стала принимать ssd2 за sda, тогда как почётное звание sdb отошло новому ssd3.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-04.JPG)

Копирую таблицу разделов.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-05.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-06.JPG)

Добавил новый диск, идёт синхронизация.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-07.JPG)

Скопировал содержимое.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_2-08.JPG)

Переустановил grub. Перезагрузил. Виртуалка работает нормально.
В ходе выполнения этого задания я удалил диск во время работы машины (та, конечно же, сразу же об этом сообщила, но я забыл сделать скриншот), убедился, что машина всё ещё способна использовать второй диск, создал новый и оформил его точно так же, как и предыдущий. От изначальной машины новая отличается только названием диска в настройках.

### ЗАДАНИЕ 3 (СИМУЛЯТОР СИСАДМИНА)

Диск 2, с которого я так активно всё сгружал в предыдущем задании, не выдержал и… я его отключил. Машина не увидела в этом ничего особенного.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-01.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-02.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-03.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-04.JPG)

Подключил новый диск. В дополнение к тому, что имелось, добавились следующие записи…
…на fdisk –l:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-05.JPG)

…на lsblk:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-06.JPG)

С помощью команды «sfdisk -d /dev/sda | sfdisk /dev/sdb» поставил файловую систему на новый диск.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-07.JPG)

Теперь диск разделён на части, но вот незадача: старый диск имел 5 ГБ, следовательно, при переносе системы на новый диск у последнего окажется 1,25 ГБ нигде не занятых. Будь это деньги, для них нашёлся бы соответствующий карман, но я просто подожду, авось применение найдётся.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-08.JPG)

Скопировал данные.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-09.JPG)

Перемонтировал /boot.
Было:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-10.JPG)

Стало:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-11.JPG)

Установил grub на новый диск. Подобный скриншот уже был, но я поясню, зачем мы это делаем. Я уже столкнулся с проблемой отсутствия grub на втором диске, когда взял старый бэкап. После удаления первого диска grubа не было нигде, и машина вошла в бесконечный и отчаянный цикл поиска загрузчика. Учитывая, что у нас (совершенно случайно) в ближайшие пару часов отказали аж два диска, не будет лишним держать загрузчик на обоих.

Создал новый RAID-массив, вылезло это. За нужным ключом не так далеко оказалось нужно идти.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-12.JPG)

Создал новый RAID с ключом.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-13.JPG)

Теперь у нас появился второй RAID, вот так неожиданность!

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-14.JPG)

Теперь ssd4 входит в новый RAID md63.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-15.JPG)

Пока в списке физических томов нет md63.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-16.JPG)

Теперь md63 появился в списке, а также был добавлен в логический том 2.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-17.JPG)

Увеличил группу и ввёл vgdisplay system –v. Последнее оказалось жёстким.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-18.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-19.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-20.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-21.JPG)

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-22.JPG)

LV var, log и root всё ещё расположены на диске ssd3 (sda). Переместил их на диск ssd4 (sdb).

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-23.JPG)

Оказалось, что поменялись лишь две строчки, которые свидетельствуют о том, что данные успешно переехали с одного диска на другой.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-24.JPG)

Md0 освободился, md63 занял его рабочее место в съехавшей колонке «Devices».

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-25.JPG)

Лишний раз убедимся, что root, var и log переехали на диск sdb.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-26.JPG)

Убрал старый RAID. Из-за каких-то настроек системы, к которым я доступа не имел, после перезагрузки системы md63 превратился в md127.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-27.JPG)

А вот тут уменьшилось число физических томов (с 2 на 1)

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-28.JPG)

/boot и так был перенесён на диск ssd4, потому покопаюсь в этой папке.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-29.JPG)

Config-4.9.0-7-amd64 — настройки ОС.
Initrd.img-4.9.0-7-amd64 — мини-диск в оперативной памяти, который используется ядром при загрузке.
System.map-4.9.0-7-amd64 — файл с таблицей адресов функций и процедур для ядра.
Grub — собственно, загрузчик ОС.
Lost+found — папка, куда скидываются файлы, на которые нет ссылок ни в одном каталоге, т.е. по каким-то причинам недоступные напрямую.
vmlinux-4.9.0-7-amd64 — само ядро.

Удалил ssd3, поставил ssd5, hdd1 и hdd2. Теперь в системе 2 пустых диска по 10 ГБ, один пустой на 6,25 ГБ и один диск с разделами.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-30.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-31.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-32.JPG)

Скопировал разделы.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-33.JPG)

О том, что размер разделов не соответствует диску, я говорил ещё 26 рисунков назад.
Скопировал /boot на новый диск.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-34.JPG)

Я уже который раз ставлю grub, можно без скриншотов, пожалуйста?
Начинаю прокачивать ssd5.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-35.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-36.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-37.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-38.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-39.JPG)

Теперь у нового диска есть разделы.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-40.JPG)

Добавим новый диск в RAID и увеличим его вместимость до 2 штук.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-41.JPG)

Разница в размерах есть.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-42.JPG)

Меняю разделы на старом диске.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-43.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-44.JPG)

Вот теперь размеры совпадают.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-45.JPG)

А теперь размеры RAID совпадают с размерами диска (точнее, их части, отведённой под RAID).

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-46.JPG)

Размер физического тома успешно пересчитан.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-47.JPG)

Логический том тоже перенастроен.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-48.JPG)

То, что hdd-диски называются sdc и sdd соответственно, стало ясно уже тогда, когда после их установки я впервые ввёл lsblk. А теперь о печальном: я уже говорил, что мой RAID поменял название на md127, так что новый массив придётся называть иначе. По итогам моего исследования я выяснил, что многие люди с такой проблемой сталкивались и способы решения мне не очень понятны, но суть в том, что я не нашёл той или иной связи числа после md с массивом с конкретными свойствами. Получается, я могу назвать свой новый массив как угодно, лишь бы потом не забыть. Пусть будет… md63!

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-49.JPG)

Создание физического тома, группы в нём и логического тома.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-50.JPG)

Немного следования инструкции.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-51.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-52.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-53.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-54.JPG)

Количество процессов не влезло в терминал, вот их концовка:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-55.JPG)

Даже после чистки какие-то процессы остались

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-56.JPG)

Вначале система запретила мне umount /var/log, ссылаясь на занятость. Я посмотрел через lsof напря-мую /var/log и принудительно завершил процесс: kill 548. Не знаю, насколько это грубая ошибка, но мне пришлось так сделать. Теперь файловая система выглядит так:

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-57.JPG)

Через vi /etc/fstab отредактировал файл.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-58.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-59.JPG)

Финальный аккорд. Машина вконец упоролась и переименовала новый md63 в md126.

![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-60.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-61.JPG)
![](https://github.com/NickolayGordeev/JIA6OPATOPHbIE_PA6OTbI/blob/master/Laba%202/Screenshots/Task_3-62.JPG)

В ходе этого задания я научился модифицировать массивы RAID, менять их размер, переустанавливать /boot, столкнулся с кучей странностей, научился удалять диски из VirtualBox так, чтобы не оставался UUID, понял суть последовательной загрузки дисков (если первым идёт диск без /boot, машина не запустится), осознал, как много может значить одна неправильная буковка, а также поверхностно познал дзен сисадмина, который справляется с подобным напряжением каждый день.

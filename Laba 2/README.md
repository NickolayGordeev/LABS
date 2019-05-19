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

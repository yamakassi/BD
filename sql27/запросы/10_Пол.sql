SELECT K.Фамилия +' '+ K.Имя +' '+ K.Отчество as Клиент,K.Телефон,K.email
From Клиенты as K
WHERE Пол IN('Ж') 
ORDER BY Клиент_ID
SELECT 'My Number is: ' + convert(varchar(20),4567)
SELECT 'My Numebr is: ' + cast(4567 as varchar(20))

SELECT 'My salary is: R' + convert(varchar(20),2345.6)
SELECT 'My salary is: ' + format(2345.6,'C') AS Currency

SELECT 'My salary is: ' + format(2345.6,'C','fr-FR') -- C stands for currency, fr-FR Signifies a french culture of a currency
% lab 6
% Метод Рунге-Кутта и Эйлера
% y = ax^3 + bx^2 + cx + d 

clear; 
clc; 

while true 
    a = 0.006; 
    b = -0.144; 
    c = 7.50; 
    d = -60;
    h=0.1;
    xlast=30;
    x0=0;
    y0=0;
    fprintf("\n\nМеню:\n 1. Метод Эйлера\n " + ... 
        "2. Метод Рунге-Кутта\n " + ... 
        "3. Выход\n") 
    fprintf("Выберите опцию");
    
    switch input(" ")
        case 1
            fprintf("Метод Эйлера\n")
            results = euler(a,b,c,d,h,x0);
            disp(results);
        case 2
            fprintf("Метод Рунге-Кутта\n ")
            resultat = rungekutta(a,b,c,d,h,x0);
            disp(resultat);
        case 3
            fprintf("Выполнение программы завершено")
            break
        otherwise
            error("Ошибка! Выбрать можно только опцию 1-3\n")
    end
end

function results = euler(a,b,c,d,h,x0)  
    xlast=30;
    x_values = x0:h:xlast;
    y_values = zeros(size(x_values));
    for i = 1:length(x_values)-1
        f = a * x_values(i)^3 + b * x_values(i)^2 + c * x_values(i) + d;
        y_values(i+1) = y_values(i) + h * f;
    end
    results= [x_values(31), y_values(31)];
end

function resultat = rungekutta(a,b,c,d,h,x0)
    xlast=30;
    x_values = x0:h:xlast;
    y_values = zeros(size(x_values));

    for i = 1:length(x_values)-1
        f1 = a * x_values(i)^3 + b * x_values(i)^2 + c * x_values(i) + d;
        f2 = a * (x_values(i) + h)^3 + b * (x_values(i) + h)^2 + c * (x_values(i) + h) + d;
        
        y_values(i+1) = y_values(i) + (h / 2) * (f1 + f2);
    end
    resultat = [x_values(31), y_values(31)];
end


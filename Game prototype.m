% lab 6
% Метод Рунге-Кутта и Эйлера
% y = ax^3 + bx^2 + cx + d 
clear; 
clc; 

% Данные для варианта 4 
% a = 0.006; 
% b = -0.144; 
% c = 7.50; 
% d = -60; 
% h = 0.1;

x0=0;
y0=0;

%Параметры интегрироавния


% Выбор метода пользователем 
while true 
    a = 0.006; 
    b = -0.144; 
    c = 7.50; 
    d = -60; 
    fprintf("\n\nМеню:\n 1. Метод Эйлера\n " + ... 
        "2. Метод Рунге-Кутта\n " + ... 
        "3. Выход\n") 
    switch input(" ") 
        case 1 
            while true 
                h = input("Введите значение \h "); 
                if h > 0 
                    break 
                else 
                    fprintf ("Ошибка! h может быть" + ... 
                        " только положительным\n"); 
                end 
            end 
            function[p]=root_e(a,b,c,d,h)
            disp(p);
            end
        case 2 
            while true 
                h = input("Введите значение \h "); 
                if h > 0 
                    break 
                else  
                    fprintf ("Ошибка! h может быть" + ... 
                        " только положительным\n"); 
                end 
            end 
            write(a,b,c,d,h, root_rk(a,b,c,d,h), "Метод Рунге-Кутта"); 
            write_f(a,b,c,d,h, root_rk(a,b,c,d,h), "Метод Рунге-Кутта"); 
        case 3 
            fprintf("Выполнение программы завершено") 
            break 
        otherwise 
            error("Ошибка! Выбрать можно только опцию 1-3\n") 
    end 
end 


% Метод Эйлера
function[p]=root_e(a,b,c,d,h)  
    x0=0;
    y0=0;
    xlast=30;
    
    % Генерация значений x
    x_values = x0:h:xlast;
    y_values = zeros(size(x_values));
    y_values(1) = y0;

    for i = 30:length(x_values)
        f = a * x_values(i-1)^3 + b * x_values(i-1)^2 + c * x_values(i-1) + d;
        y_values(i) = y_values(i-1) + h * f;
    end


% Метод Рунге-Кутта 2-го порядка
function root_rk(a,b,c,d,h)  
   x0=0;
   y0=0;
   xlast=30;
   % Генерация значений x
    x_values = x0:h:x_end;
    y_values = zeros(size(x_values));
    y_values(1) = y0;

    for i = 2:length(x_values)
        f1 = a * x_values(i-1)^3 + b * x_values(i-1)^2 + c * x_values(i-1) + d;
        f2 = a * (x_values(i-1) + h)^3 + b * (x_values(i-1) + h)^2 + c * (x_values(i-1) + h) + d;
        
        y_values(i) = y_values(i-1) + (h / 2) * (f1 + f2);
    end
    
% Функция для записи результатов в файл 
function write_f(a,b,c,d,h,r,m) 
  fprintf("\n\n");  
  while true  
    name = input("Выберите имя файла ","s");  
    if contains(name,["<" ">" ":" '"' "\" '/' '|' '?' '*'])  
      fprintf("В названии файла используются недопустимые символы\n")  
    else 
      break 
    end 
  end 
  if contains(name,".txt")==0  
    name= name+".txt";  
  end 
  fid = fopen(name, "w");  
  fprintf(fid, "Значение коэффициентов уравнения  | Значение точности | Название\n");  
  fprintf(fid, "       a        |       b        |      c       |       d         |    h                           | метода: \n"); 
  fprintf(fid, "  %7.3f   |   %7.3f |  %7.3f |   %7.3f |%7.3f                         | %s\n", a, b, c,d,h,m);  
  fprintf(fid, "№ шага |           Значение x                       |       Значение y\n"); 
  for x=2:1:length(r)  
    fprintf(fid, " %4u         |           %12.4f                       |       %12.4f \n",x-1,r(x,1),r(x,2));  
  end 
  fclose(fid);  
end

% Функция для вывода результатов на экран 
function write(a,b,c,d,h,r,m)  
  fprintf("\n\n");  
  fprintf('ответ: %f\n\n', r(length(r),1))  
  fprintf("Значение коэффициентов уравнения  | Значение точности | Название\n");  
  fprintf("a      | b      | c      | d      | h                 | метода: \n"); 
  fprintf("%7.3f|%7.3f |%7.3f |%7.3f |%7.3f            | %s\n", a, b, c,d,h,m);  
  fprintf("№ шага | Значение x   | Значение y\n"); 
  for x=2:1:length(r)  
    fprintf(" %4u   | %12.4f | %12.4f \n",x-1,r(x,1),r(x,2));  
  end 
end
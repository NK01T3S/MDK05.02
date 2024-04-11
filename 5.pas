program rever;

// тип данных
type
  TStack = record
    Numbers: array [1..100] of Integer; // массив для хранения чисел в стеке
    Top: Integer; // переменная для отслеживания вершины стека
  end;

var
  InputFile, OutputFile: Text; // переменные для входного и выходного файлов
  Stack: TStack; // стек для хранения чисел
  Num: Integer; // переменная для хранения числа

// процедура инициализации стека
procedure InitStack(var S: TStack);
begin
  S.Top := 0; // устанавливаем вершину стека в начало
end;

// функция для проверки пустоты стека
function IsEmptyStack(S: TStack): Boolean;
begin
  IsEmptyStack := S.Top = 0; // возвращаем true, если стек пуст
end;

// процедура добавления элемента в стек
procedure Push(var S: TStack; X: Integer);
begin
  Inc(S.Top); // увеличиваем вершину стека
  S.Numbers[S.Top] := X; // помещаем элемент в стек
end;

// функция извлечения элемента из стека
function Pop(var S: TStack): Integer;
begin
  Pop := S.Numbers[S.Top]; // извлекаем элемент из вершины стека
  Dec(S.Top); // уменьшаем вершину стека
end;

var Line:String;

begin
  Assign(InputFile, 'E:\input16.txt'); // открываем файл для чтения
  Reset(InputFile);

  Assign(OutputFile, 'E:\output16.txt'); // открываем файл для записи
  Rewrite(OutputFile);

  InitStack(Stack); // инициализируем стек
  
    
  Assign(InputFile, 'E:\input16.txt'); // открываем файл для чтения
  Reset(InputFile);  
    
  while not EOF(InputFile) do // пока не достигнут конец файла
  begin
    Readln(InputFile, Num); // считываем числа из файла
    Push(Stack, Num); // добавляем числа в стек
  end;

  while not IsEmptyStack(Stack) do // пока стек не пуст
  begin
    Num := Pop(Stack); // извлекаем число из стека
    Writeln(OutputFile, Num); // записываем числа в обратном порядке в файл
  end;

  Close(InputFile); // закрываем входной файл
  Close(OutputFile); // закрываем выходной файл
  writeln();

end.
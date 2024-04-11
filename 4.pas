Program Lab_15_3;

// типы данных
type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

var
  head, current: NodePtr;

// процедура для добавления нового узла в список
procedure AddNode(var head: NodePtr; data: Integer);
var
  newNode: NodePtr;
begin
  New(newNode);   // выделяем память под новый узел
  newNode^.data := data;   // присваиваем новому узлу значение data
  newNode^.next := head;   // устанавливаем указатель на следующий узел на текущий head
  head := newNode;   // обновляем head на новый узел
end;

// функция для поиска максимального значения в списке
function FindMax(head: NodePtr): Integer; // аозвращает число
var
  maxVal: Integer;
begin
  maxVal := head^.data;   // инициализируем maxval начальным значением из head
  current := head^.next;   // устанавливаем текущий узел в следующий после head
  
  while current <> nil do   // пока не достигнем конца списка
  begin
    if current^.data > maxVal then   // если значение текущего узла больше максимального значения
      maxVal := current^.data;   // обновляем maxval
    current := current^.next;   // переходим к следующему узлу
  end;

  FindMax := maxVal;   // возвращаем максимальное значение
end;

// функция для поиска минимального значения в списке
function FindMin(head: NodePtr): Integer;
var
  minVal: Integer;
begin
  minVal := head^.data;   // инициализируем minval начальным значением из head
  current := head^.next;   // устанавливаем текущий узел в следующий после head

  while current <> nil do   // пока не достигнем конца списка
  begin
    if current^.data < minVal then   // если значение текущего узла меньше минимального значения
      minVal := current^.data;   // обновляем minval
    current := current^.next;   // переходим к следующему узлу
  end;

  FindMin := minVal;   // возвращаем минимальное значение
end;

begin
  head := nil;   // инициализируем head как пустой список

  AddNode(head, 10);   // добавляем узлы со значениями 10, 5 и 15 в список
  AddNode(head, 5);
  AddNode(head, 15);
  
  writeln('Список');
  
  current := head;   // устанавливаем текущий узел в начало списка
  
  while current <> nil do   // пока не достигнем конца списка
  begin
    writeln(current^.data);   // выводим значение текущего узла
    current := current^.next;   // переходим к следующему узлу
  end;

  writeln('Максимальный элемент списка: ', FindMax(head));   
  writeln('Минимальный элемент списка: ', FindMin(head));   
end.
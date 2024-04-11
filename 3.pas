Program Lab_15_4;

// типы данных
type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

var
  head, pp: NodePtr;
  i: Integer;

// процедура для добавления узла в начало списка
procedure AddNode(var head: NodePtr; data: Integer);
var
  newNode: NodePtr;
begin
  New(newNode); // выделяем память под новый узел
  newNode^.data := data;
  newNode^.next := head; // новый узел ссылается на текущий head
  head := newNode; // новый узел становится новым заголовком списка
end;

begin
  head := nil; // инициализация головы списка как nil

  // создание списка из десяти элементов
  for i := 1 to 10 do
    AddNode(head, i); // добавление элементов в список по порядку от 1 до 10

  // вывод списка на экран
  writeln('Список из десяти элементов:');
  pp := head;
  
  while pp <> nil do
  begin
    write(pp^.data, ' '); // вывод значения текущего узла
    pp := pp^.next; // вереход к следующему узлу
  end;
  
  writeln;

  // вывод только четных элементов списка
  writeln('Четные элементы списка:');
  pp := head; // возвращаемся к началу списка

  while pp <> nil do
  begin
    if pp^.data mod 2 = 0 then // проверка на четность значения узла
      write(pp^.data, ' '); // вывод четного значения
    
    pp := pp^.next; // переход к следующему узлу
  end;
end.
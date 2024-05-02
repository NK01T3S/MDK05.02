program QueueMemoryChoice;
type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;

  TQueueDynamic = record
    head, tail: PNode;
    count: integer;
  end;

  TQueueStatic = record
    data: array[1..5] of integer;
    head, tail: 1..5;
     count: integer;
  end;

var
  choice: integer;
  value: integer;
  dynamicQueue: TQueueDynamic;
  staticQueue: TQueueStatic;

procedure InitializeDynamicQueue;//Процедура инициализирует динамическую очередь, устанавливая начальные значения указателей на пустые значения
begin
  dynamicQueue.head := nil;
  dynamicQueue.tail := nil;
end;

function IsDynamicQueueEmpty: boolean;//Функция проверяет, пуста ли динамическая очередь
begin
  IsDynamicQueueEmpty := (dynamicQueue.head = nil);
end;

procedure EnqueueDynamic(value: integer);//Процедура добавляет элемент в конец динамической очереди
var
  newNode: PNode;
begin
   if dynamicQueue.count = 5 then
  begin
    writeln('Очередь заполнена');
    exit;
  end;

  new(newNode);
  newNode^.data := value;
  newNode^.next := nil;

  if IsDynamicQueueEmpty then
  begin
    dynamicQueue.head := newNode;
    dynamicQueue.tail := newNode;
  end
  else
  begin
    dynamicQueue.tail^.next := newNode;
    dynamicQueue.tail := newNode;
  end;
  
   dynamicQueue.count := dynamicQueue.count + 1;
end;

function DequeueDynamic: integer;//Функция удаляет и возвращает первый элемент из динамической очереди
var
  tempNode: PNode;
  dequeuedValue: integer;
begin
  if IsDynamicQueueEmpty then
  begin
    writeln('Очередь пуста');
    DequeueDynamic := 0;
  end
  else
  begin
    tempNode := dynamicQueue.head;
    dequeuedValue := tempNode^.data;
    dynamicQueue.head := tempNode^.next;
    dispose(tempNode);
    DequeueDynamic := dequeuedValue;
  end;
end;

procedure DisplayDynamicQueue;//Процедура выводит содержимое динамической очереди
var
  currentNode: PNode;
begin
  currentNode := dynamicQueue.head;

  if IsDynamicQueueEmpty then
    writeln('Очередь пуста')
  else
  begin
    writeln('Содержимое очереди:');
    while currentNode <> nil do
    begin
      writeln(currentNode^.data);
      currentNode := currentNode^.next;
    end;
  end;
end;

procedure InitializeStaticQueue;//Процедура инициализирует статическую очередь, устанавливая начальные значения указателей
begin
  staticQueue.head := 1;
  staticQueue.tail := 1;
end;

function IsStaticQueueEmpty: boolean;//Функция проверяет, пуста ли статическая очередь
begin
  IsStaticQueueEmpty := (staticQueue.head = staticQueue.tail);
end;

procedure EnqueueStatic(value: integer);//Процедура добавляет элемент в конец статической очереди
begin
 if staticQueue.count = 5 then
  begin
    writeln('Очередь заполнена');
    exit;
  end;

  staticQueue.data[staticQueue.tail] := value;
  staticQueue.tail := staticQueue.tail + 1;

  staticQueue.count := staticQueue.count + 1;
end;

function DequeueStatic: integer;//Функция удаляет и возвращает первый элемент из статической очереди
begin
  if IsStaticQueueEmpty then
  begin
    writeln('Очередь пуста');
    DequeueStatic := 0;
  end
  else
  begin
    DequeueStatic := staticQueue.data[staticQueue.head];
    staticQueue.head := staticQueue.head + 1;
  end;
end;

procedure DisplayStaticQueue;//Процедура выводит содержимое статической очереди
var
  i: integer;
begin
  if IsStaticQueueEmpty then
    writeln('Очередь пуста')
  else
  begin
    writeln('Содержимое очереди:');
    for i := staticQueue.head to staticQueue.tail - 1 do
      writeln(staticQueue.data[i]);
  end;
end;

begin
  choice := 0;

  while choice <> 3 do
  begin
    writeln('Выберите тип очереди:');
    writeln('1. Очередь на основе динамической памяти');
    writeln('2. Очередь на основе статической памяти');
    writeln('3. Выход');
    readln(choice);

    case choice of
      1: begin
        InitializeDynamicQueue;
        writeln('Очередь на основе динамической памяти');
      end;
      2: begin
        InitializeStaticQueue;
        writeln('Очередь на основе статической памяти');
      end;
      3: begin
        writeln('Выход из программы');
        break;
      end;
    end;

    while choice <> 4 do
    begin
      writeln('1. Вставить элемент в очередь');
      writeln('2. Удалить элемент из очереди');
      writeln('3. Отобразить содержимое очереди');
      writeln('4. Выход');
      writeln('Выберите действие:');
      readln(choice);

      case choice of
        1: begin
          writeln('Введите значение для вставки в очередь:');
          readln(value);
          if choice = 1 then
            EnqueueDynamic(value)
          else
            EnqueueStatic(value);
        end;
        2: begin
          if choice = 2 then
            value := DequeueDynamic
          else
            value := DequeueStatic;
          if value <> 0 then
            writeln('Удаленный элемент: ', value);
        end;
        3: begin
          if choice = 3 then
            DisplayDynamicQueue
          else
            DisplayStaticQueue;
        end;
      end;
    end;
  end;
end.
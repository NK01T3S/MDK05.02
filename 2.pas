program Words;

// типы данных
type
  PNode = ^Node;
  Node = record
    word: string[40];
    count: integer;
    next: PNode;
  end;

// функция для проверки, является ли символ буквой или цифорой
function IsAlphaNumeric(c: char): Boolean;
begin
  IsAlphaNumeric := (c in ['A'..'Z', 'a'..'z', '0'..'9']); // возвращает True если является
end;

// создание нового узла с заданным словом
function CreateNode(NewWord: string): PNode;
var
  NewNode: PNode;
begin
  New(NewNode); // выделяет память под новый узел
  NewNode^.word := NewWord; // присваиваем новому узлу заданное слово
  NewNode^.count := 1; // инициализирует счетчик слова
  NewNode^.next := nil; // устанавливает указатель на следующий узел как nil
  Result := NewNode; // возвращаем созданный узел
end;

// добавление нового узла в начало списка
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head; // устанавливаем указатель нового узла на текущее начало списка
  Head := NewNode; // обновляем указатель на начало списка на новый узел
end;

// добавление нового узла после указанного узла
procedure AddAfter(var p: PNode; NewNode: PNode);
begin
  NewNode^.next := p^.next; // устанавливаем указатель нового узла на следующий за указанным узлом
  p^.next := NewNode; // обновляем указатель предыдущего узла на новый узел
end;

// вывод списка слов и их количества
procedure PrintList(Head: PNode);
var
  pp: PNode;
begin
  pp := Head; // инициализируем временный указатель на начало списка
  while pp <> nil do // пока не достигнут конец списка
  begin
    WriteLn('Слово: ', pp^.word, ' | Количество: ', pp^.count); // выводит слово и его количество
    pp := pp^.next; // переходим к следующему узлу в списке
  end;
end;

// добавление нового узла в конец списка
procedure AddLast(var Head: PNode; NewNode: PNode);
var pp: PNode;
begin
  if Head = nil then // если список пустой,
    AddFirst(Head, NewNode) // добавляет новый узел в начало списка,
  else // иначе
  begin
    pp := Head;
    while pp^.next <> nil do // пока не достигнут конец списка,
      pp := pp^.next; // перемещаемся к последнему узлу в списке

    AddAfter(pp, NewNode); // добавляет новый узел после последнего узла в списке
  end;
end;

// добавление нового узла перед указанным узлом в списке
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var pp: PNode;
begin
  pp := Head; // Инициализирует временный указатель на начало списка

  if p = Head then // если указанный узел - начало списка,
    AddFirst(Head, NewNode) // добавляет новый узел в начало списка,
  else // иначе
  begin
    while (pp <> nil) and (pp^.next <> p) do // пока не найден указанный узел или достигнут конец списка,
      pp := pp^.next; // перемещается к следующему узлу

    if pp <> nil then // если найден указанный узел,
    begin 
      if pp^.word = NewNode^.word then // если текущее слово равно новому
        pp^.count := pp^.count + 1 // поле с счетчиком увеличиваем на 1
      else // иначе
        AddAfter(pp, NewNode); // добовляем после pp
    end 
    else 
      AddLast(Head, NewNode); // добавляем в конец
  end;
end;

// поиск узла по заданному слову
function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do // пока не дошли до конца или не нашли слово
    pp := pp^.next; // перемещаемся по списку
  Result := pp; // возвращаем позицию элемента, если он найден, но, если не найден то nil
end;

// поиск узла по заданному слову
function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

// получение слова из файла
function TakeWord(F: Text): string;
var c: char; // переменная для хранения текущего символа
begin
  Result := ''; // инициализация результата как пустой строки
  c := ' '; // инициализация текущего символа пробелом

  while not eof(F) and not IsAlphaNumeric(c) do // цикл чтения символов до достижения буквы или цифры
    read(F, c); // чтение следующего символа из файла

  while not eof(F) and IsAlphaNumeric(c) do // цикл чтения букв и цифр
  begin
    Result := Result + c; // добавление символа к текущему слову
    read(F, c); // чтение следующего символа из файла
  end;
end;

var
  Head: PNode;
  textfile: Text;
  current_word: string; 
  place, NewNode: PNode;
  count_words, unique_words: integer;

begin
  Head := nil; // ниициализация указателя на начало списка


  Assign(textfile, 'E:\input.txt');
  Reset(textfile);

  count_words := 0; // инициализация счетчика количества слов
  unique_words := 0; // инициализоция счетчика уникальнях слов

  while not eof(textfile) do
  begin
    current_word := TakeWord(textfile); // Используем переименованную переменную

    if current_word <> '' then // проверяем, что переменная words не пустая
    begin
      count_words := count_words + 1; // увеличиваем счетчик общего количества слов на 1
      NewNode := Find(Head, current_word); // ищем узел в списке, который содержит слово words
      if NewNode <> nil then // проверяем, был ли найден узел с данным словом
        NewNode^.count := NewNode^.count + 1 // увеличиваем счетчик слова на 1
      else
      begin
        NewNode := CreateNode(current_word);// создаем новый узел с данным словом
        place := FindPlace(Head, current_word); // находим место для вставки нового узла в список
        AddBefore(Head, place, NewNode);  // добавляем новый узел перед указанным местом в списке
        unique_words := unique_words + 1; //увеличиваем счетчик уникальных слов
      end;
    end;
  end;

  PrintList(Head);

  WriteLn('Всего слов в списке: ', count_words);
  WriteLn('Количество уникальных слов: ', unique_words);

  Close(textfile);
end.
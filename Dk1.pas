unit Dk1;
interface
uses GraphABC; 
procedure levy(x1,y1,x2,y2,g:integer);
implementation
procedure levy(x1,y1,x2,y2,g:integer);
var x3,y3:integer;
begin
if g=0 then line(x1,y1,x2,y2)
else
 begin
  x3:=(x1+x2)div 2-(y1-y2) div 2;
  y3:=(y1+y2) div 2+(x1-x2) div 2;
  levy(x1,y1,x3,y3,g-1);
  levy(x3,y3,x2,y2,g-1);
 end;
 end;
 begin
   
 end.
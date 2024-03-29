Uses  GraphABC;
var (m,wx,wy,g) := (100, 300,300,10);
 
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
 end
end;
procedure text;
begin
  textout(10, 30, '"Left" влево');
  textout(10, 50, '"Right" вправо');
  textout(10, 70, '"Up" вверх');
  textout(10, 90, '"Down" вниз');
  textout(10, 110, '"Q" + масштаб');
  textout(10, 130, '"W" - масштаб');
  textout(10, 150, '"A" + глубина');
  textout(10, 170, '"S" - глубина');
end;
Procedure KeyDown(GO: integer);
begin
 case GO of
    VK_Up: wy -= 10;
    VK_Down: wy += 10; 
    VK_Right: wx += 10;  
    VK_Left: wx -= 10;
    VK_Escape: halt;
    VK_Q: if m < 500 then m+=10;
    VK_W: if m > 20 then m-=10;
    VK_A: if g < 15 then g+=1;
    VK_S: if g > 0 then g -=1;
   end;
 Window.Clear;
 text;
 levy(wx-m,wy,wx+m,wy,g);
 Redraw;
end; 
Begin
SetWindowSize(800,700);
LockDrawing;
KeyDown(0);
OnkeyDown += KeyDown;
End.
Program P1; 
var 
  input, output: text;
  n, n1, i, q: integer;
  list: array of integer;
  
function numersum(a: integer): boolean;
var s: string; j, s0, sum, err, len, tmp: integer;  
begin
  sum:= 0;
  str(a, s);
  val(copy(s, 0, 1), s0, err);
  len:= length(s)-1;
  for j:=1 to len do begin 
    val(s.ElementAt(j), tmp, err);
    sum:= sum + tmp;
  end;
  writeln(sum, ' ', s0);
  numersum:= s0=sum;
end; 

function maxI(l: array of integer): integer;
var j, len, tmp: integer;  
begin
  len:= length(l)-1;
  tmp:= 0;
  for j:=0 to len do begin 
    if (l[j]>l[tmp]) then begin 
      tmp:= j;
    end;
  end;
  //writeln('maxindex=', tmp);
  maxI:=tmp;
end; 
  
begin
  assign(input, 'joc.in');
  reset(input);
  Readln(input, n);
  writeln(n);
  setlength(list, n);
  for i:=0 to (n-1) do begin 
    readln(input, list[i]);
  end;
  close(input);
  
  n1:=n;
  for i:=0 to (n-1) do begin 
    if (not numersum(list[i])) then begin 
      n1:= n1-1;
      list[i]:= 0;
    end;
  end;
  
  assign(output, 'joc.out');
  rewrite(output);
  
  q:=0;
  for i:=0 to (n1-1) do begin 
    q:= maxI(list);
    writeln(output, list[q]);
    list[q]:= 0;
  end;
  close(output);
 
end.
  
-- Generated by Haxe 3.4.0
local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
Int = (function() _hxClasses.Int = _hx_o({__fields__={__name__=true},__name__={"Int"}}); return _hxClasses.Int end)();
Dynamic = (function() 
_hxClasses.Dynamic = _hx_o({__fields__={__name__=true},__name__={"Dynamic"}}); return _hxClasses.Dynamic end)();
Float = (function() 
_hxClasses.Float = _hx_e(); return _hxClasses.Float end)();
Float.__name__ = {"Float"}
Bool = (function() 
_hxClasses.Bool = _hx_e(); return _hxClasses.Bool end)();
Bool.__ename__ = {"Bool"}
Class = (function() 
_hxClasses.Class = _hx_o({__fields__={__name__=true},__name__={"Class"}}); return _hxClasses.Class end)();
Enum = _hx_e();

local Array = _hx_e()
local Main = _hx_e()
local Math = _hx_e()
local String = _hx_e()
local Std = _hx_e()
local haxe = {}
haxe.Log = _hx_e()
haxe.Utf8 = _hx_e()
haxe.io = {}
haxe.io.Bytes = _hx_e()
haxe.io.BytesBuffer = _hx_e()
haxe.io.Input = _hx_e()
haxe.io.Eof = _hx_e()
haxe.io.Error = _hx_e()
haxe.io.Output = _hx_e()
local lua = {}
lua.Boot = _hx_e()
lua.UserData = _hx_e()
lua.Thread = _hx_e()
local tarantool = {}
tarantool.socket = {}
tarantool.socket.Peer = _hx_e()
tarantool.socket.SocketError = _hx_e()
tarantool.socket.SocketInput = _hx_e()
tarantool.socket.SocketOutput = _hx_e()
tarantool.socket.TcpSocket = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self,0);
end
Array.__name__ = true
Array.prototype = _hx_a(
  'join', function(self,sep) 
    local tbl = ({});
    local _gthis = self;
    local cur_length = 0;
    local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return cur_length < _gthis.length end;
    end,next=function() 
      cur_length = cur_length + 1;
      do return _gthis[cur_length - 1] end;
    end});
    while (i:hasNext()) do 
      local i1 = i:next();
      _G.table.insert(tbl,Std.string(i1));
      end;
    do return _G.table.concat(tbl,sep) end
  end,
  'push', function(self,x) 
    _G.rawset(self,self.length,x);
    _G.rawset(self,"length",self.length + 1);
    do return _G.rawget(self,"length") end
  end,
  'iterator', function(self) 
    local _gthis = self;
    local cur_length = 0;
    do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return cur_length < _gthis.length end;
    end,next=function() 
      cur_length = cur_length + 1;
      do return _gthis[cur_length - 1] end;
    end}) end
  end
  ,'__class__',  Array
)

Main.new = {}
Main.__name__ = true
Main.main = function() 
  local socket = tarantool.socket.TcpSocket.new();
  socket:bind("*",65200,function(s) 
    haxe.Log.trace("Client accepted",_hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="Main.hx",lineNumber=7,className="Main",methodName="main"}));
    local dat = s.input:readLine();
    haxe.Log.trace("client sent " .. dat,_hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="Main.hx",lineNumber=9,className="Main",methodName="main"}));
    s.output:writeString("GOOD");
  end);
  haxe.Log.trace("Server opened on *:65200",_hx_o({__fields__={fileName=true,lineNumber=true,className=true,methodName=true},fileName="Main.hx",lineNumber=12,className="Main",methodName="main"}));
end

Math.new = {}
Math.__name__ = true
Math.isNaN = function(f) 
  do return f ~= f end;
end

String.new = {}
String.__name__ = true
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        do return String.__oldindex[k] end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_a(
  'toString', function(self) 
    do return self end
  end,
  'charCodeAt', function(self,index) 
    do return _G.string.byte(self,index + 1) end
  end,
  'substr', function(self,pos,len) 
    if ((len == nil) or (len > (pos + self.length))) then 
      len = self.length;
    else
      if (len < 0) then 
        len = self.length + len;
      end;
    end;
    if (pos < 0) then 
      pos = self.length + pos;
    end;
    if (pos < 0) then 
      pos = 0;
    end;
    do return _G.string.sub(self,pos + 1,pos + len) end
  end
  ,'__class__',  String
)

Std.new = {}
Std.__name__ = true
Std.string = function(s) 
  do return lua.Boot.__string_rec(s) end;
end

haxe.Log.new = {}
haxe.Log.__name__ = true
haxe.Log.trace = function(v,infos) 
  local str = nil;
  if (infos ~= nil) then 
    str = infos.fileName .. ":" .. infos.lineNumber .. ": " .. Std.string(v);
    if (infos.customParams ~= nil) then 
      str = str .. ("," .. infos.customParams:join(","));
    end;
  else
    str = v;
  end;
  if (str == nil) then 
    str = "null";
  end;
  _hx_print(str);
end

haxe.Utf8.new = {}
haxe.Utf8.__name__ = true
haxe.Utf8.charWidth = function(c) 
  if ((c > 0) and (c <= 127)) then 
    do return 1 end;
  else
    if ((c >= 194) and (c <= 223)) then 
      do return 2 end;
    else
      if ((c >= 224) and (c <= 239)) then 
        do return 3 end;
      else
        if ((c >= 240) and (c <= 244)) then 
          do return 4 end;
        else
          do return nil end;
        end;
      end;
    end;
  end;
end
haxe.Utf8.char = function(unicode) 
  if (unicode <= 127) then 
    do return _G.string.char(unicode) end;
  else
    if (unicode <= 2047) then 
      local b0 = 192 + _G.math.floor(unicode / 64);
      local b1 = 128 + (_G.math.fmod(unicode, 64));
      do return _G.string.char(b0,b1) end;
    else
      if (unicode <= 65535) then 
        local b01 = 224 + _G.math.floor(unicode / 4096);
        local b11 = 128 + (_G.math.fmod(_G.math.floor(unicode / 64), 64));
        local b2 = 128 + (_G.math.fmod(unicode, 64));
        do return _G.string.char(b01,b11,b2) end;
      else
        if (unicode <= 1114111) then 
          local code = unicode;
          local b3 = 128 + (_G.math.fmod(code, 64));
          code = _G.math.floor(code / 64);
          local b21 = 128 + (_G.math.fmod(code, 64));
          code = _G.math.floor(code / 64);
          local b12 = 128 + (_G.math.fmod(code, 64));
          code = _G.math.floor(code / 64);
          local b02 = 240 + code;
          do return _G.string.char(b02,b12,b21,b3) end;
        else
          _G.error("Unicode greater than U+10FFFF",0);
        end;
      end;
    end;
  end;
end

haxe.io.Bytes.new = function(length,b) 
  local self = _hx_new(haxe.io.Bytes.prototype)
  haxe.io.Bytes.super(self,length,b)
  return self
end
haxe.io.Bytes.super = function(self,length,b) 
  self.length = length;
  self.b = b;
end
haxe.io.Bytes.__name__ = true
haxe.io.Bytes.ofString = function(s) 
  local _g = _hx_tab_array({ }, 0);
  local _g2 = 0;
  local _g1 = s.length;
  while (_g2 < _g1) do 
    _g2 = _g2 + 1;
    local c = _g2 - 1;
    _g:push(_G.string.byte(s,c + 1));
    end;
  local bytes = _g;
  do return haxe.io.Bytes.new(bytes.length,bytes) end;
end
haxe.io.Bytes.prototype = _hx_a(
  'blit', function(self,pos,src,srcpos,len) 
    if (((((pos < 0) or (srcpos < 0)) or (len < 0)) or ((pos + len) > self.length)) or ((srcpos + len) > src.length)) then 
      _G.error(haxe.io.Error.OutsideBounds,0);
    end;
    local b1 = self.b;
    local b2 = src.b;
    if ((b1 == b2) and (pos > srcpos)) then 
      local i = len;
      while (i > 0) do 
        i = i - 1;
        b1[i + pos] = b2[i + srcpos];
        end;
      do return end;
    end;
    local _g1 = 0;
    local _g = len;
    while (_g1 < _g) do 
      _g1 = _g1 + 1;
      local i1 = _g1 - 1;
      b1[i1 + pos] = b2[i1 + srcpos];
      end;
  end,
  'getString', function(self,pos,len) 
    if (((pos < 0) or (len < 0)) or ((pos + len) > self.length)) then 
      _G.error(haxe.io.Error.OutsideBounds,0);
    end;
    local b = self.b.length;
    local begin = lua.Boot.__cast((function() 
      local _hx_1
      if (Math.isNaN(pos) or Math.isNaN(b)) then 
      _hx_1 = (0/0); else 
      _hx_1 = _G.math.min(pos,b); end
      return _hx_1
    end )() , Int);
    local a = pos + len;
    local b1 = self.b.length;
    local _end = lua.Boot.__cast((function() 
      local _hx_2
      if (Math.isNaN(a) or Math.isNaN(b1)) then 
      _hx_2 = (0/0); else 
      _hx_2 = _G.math.min(a,b1); end
      return _hx_2
    end )() , Int);
    local _g = _hx_tab_array({ }, 0);
    local _g2 = begin;
    local _g1 = _end;
    while (_g2 < _g1) do 
      _g2 = _g2 + 1;
      local i = _g2 - 1;
      _g:push(_G.string.char(self.b[i]));
      end;
    do return _g:join("") end
  end,
  'toString', function(self) 
    do return self:getString(0,self.length) end
  end
  ,'__class__',  haxe.io.Bytes
)

haxe.io.BytesBuffer.new = function() 
  local self = _hx_new(haxe.io.BytesBuffer.prototype)
  haxe.io.BytesBuffer.super(self)
  return self
end
haxe.io.BytesBuffer.super = function(self) 
  self.b = Array.new();
end
haxe.io.BytesBuffer.__name__ = true
haxe.io.BytesBuffer.prototype = _hx_a(
  'getBytes', function(self) 
    local bytes = haxe.io.Bytes.new(self.b.length,self.b);
    self.b = nil;
    do return bytes end
  end
  ,'__class__',  haxe.io.BytesBuffer
)

haxe.io.Input.new = {}
haxe.io.Input.__name__ = true
haxe.io.Input.prototype = _hx_a(
  'readByte', function(self) 
    _G.error("Not implemented",0);
  end,
  'readLine', function(self) 
    local buf = haxe.io.BytesBuffer.new();
    local last;
    local s;
    local _hx_expected_result = {}
    local _hx_status, _hx_result = pcall(function() 
    
        while (true) do 
          last = self:readByte();
          if (not (last ~= 10)) then 
            break;
          end;
          buf.b:push(last);
          end;
        s = buf:getBytes():toString();
        if (s:charCodeAt(s.length - 1) == 13) then 
          s = s:substr(0,-1);
        end;
       return _hx_expected_result end)
     if not _hx_status then 
      local _hx_1 = _hx_result
      if( lua.Boot.__instanceof(_hx_1,haxe.io.Eof) ) then 
        local e = _hx_1
        s = buf:getBytes():toString();
        if (s.length == 0) then 
          _G.error(e,0);
        end;
      else _G.error(_hx_1)
      end
     elseif _hx_result ~= _hx_expected_result then return _hx_result end;
    do return s end
  end
  ,'__class__',  haxe.io.Input
)

haxe.io.Eof.new = {}
haxe.io.Eof.__name__ = true
haxe.io.Eof.prototype = _hx_a(
  'toString', function(self) 
    do return "Eof" end
  end
  ,'__class__',  haxe.io.Eof
)
_hxClasses["haxe.io.Error"] = { __ename__ = true, __constructs__ = _hx_tab_array({[0]="Blocked","Overflow","OutsideBounds","Custom"},4)}
haxe.io.Error = _hxClasses["haxe.io.Error"];
haxe.io.Error.Blocked = _hx_tab_array({[0]="Blocked",0,__enum__ = haxe.io.Error},2)

haxe.io.Error.Overflow = _hx_tab_array({[0]="Overflow",1,__enum__ = haxe.io.Error},2)

haxe.io.Error.OutsideBounds = _hx_tab_array({[0]="OutsideBounds",2,__enum__ = haxe.io.Error},2)

haxe.io.Error.Custom = function(e) local _x = _hx_tab_array({[0]="Custom",3,e,__enum__=haxe.io.Error}, 3); return _x; end 

haxe.io.Output.new = {}
haxe.io.Output.__name__ = true
haxe.io.Output.prototype = _hx_a(
  'writeByte', function(self,c) 
    _G.error("Not implemented",0);
  end,
  'writeBytes', function(self,s,pos,len) 
    if (((pos < 0) or (len < 0)) or ((pos + len) > s.length)) then 
      _G.error(haxe.io.Error.OutsideBounds,0);
    end;
    local b = s.b;
    local k = len;
    while (k > 0) do 
      self:writeByte(b[pos]);
      pos = pos + 1;
      k = k - 1;
      end;
    do return len end
  end,
  'writeFullBytes', function(self,s,pos,len) 
    while (len > 0) do 
      local k = self:writeBytes(s,pos,len);
      pos = pos + k;
      len = len - k;
      end;
  end,
  'writeString', function(self,s) 
    local b = haxe.io.Bytes.ofString(s);
    self:writeFullBytes(b,0,b.length);
  end
  ,'__class__',  haxe.io.Output
)

lua.Boot.new = {}
lua.Boot.__name__ = true
lua.Boot.getClass = function(o) 
  if (lua.Boot.__instanceof(o,Array)) then 
    do return Array end;
  else
    local cl = o.__class__;
    if (cl ~= nil) then 
      do return cl end;
    else
      do return nil end;
    end;
  end;
end
lua.Boot.__instanceof = function(o,cl) 
  if (cl == nil) then 
    do return false end;
  end;
  local cl1 = cl;
  if (cl1) == Array then 
    do return lua.Boot.isArray(o) end;
  elseif (cl1) == Bool then 
    do return _G.type(o) == "boolean" end;
  elseif (cl1) == Dynamic then 
    do return true end;
  elseif (cl1) == Float then 
    do return _G.type(o) == "number" end;
  elseif (cl1) == Int then 
    if (_G.type(o) == "number") then 
      do return _hx_bit_clamp(o) == o end;
    else
      do return false end;
    end;
  elseif (cl1) == String then 
    do return _G.type(o) == "string" end;
  elseif (cl1) == _G.table then 
    do return _G.type(o) == "table" end;
  elseif (cl1) == lua.Thread then 
    do return _G.type(o) == "thread" end;
  elseif (cl1) == lua.UserData then 
    do return _G.type(o) == "userdata" end;else
  if (((o ~= nil) and (_G.type(o) == "table")) and (_G.type(cl) == "table")) then 
    if (lua.Boot.extendsOrImplements(lua.Boot.getClass(o),cl)) then 
      do return true end;
    end;
    if ((function() 
      local _hx_1
      if (cl == Class) then 
      _hx_1 = o.__name__ ~= nil; else 
      _hx_1 = false; end
      return _hx_1
    end )()) then 
      do return true end;
    end;
    if ((function() 
      local _hx_2
      if (cl == Enum) then 
      _hx_2 = o.__ename__ ~= nil; else 
      _hx_2 = false; end
      return _hx_2
    end )()) then 
      do return true end;
    end;
    do return o.__enum__ == cl end;
  else
    do return false end;
  end; end;
end
lua.Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
lua.Boot.__cast = function(o,t) 
  if (lua.Boot.__instanceof(o,t)) then 
    do return o end;
  else
    _G.error("Cannot cast " .. Std.string(o) .. " to " .. Std.string(t),0);
  end;
end
lua.Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(o[0]) .. "(";
    s = s .. "\t";
    local _g1 = 2;
    local _g = o.length;
    while (_g1 < _g) do 
      _g1 = _g1 + 1;
      local i = _g1 - 1;
      if (i ~= 2) then 
        str = str .. ("," .. lua.Boot.__string_rec(o[i],s));
      else
        str = str .. lua.Boot.__string_rec(o[i],s);
      end;
      end;
    do return str .. ")" end;
  end;
end
lua.Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = lua.Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
lua.Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  local _g = type(o);
  local _g1 = _g;
  if (_g1) == "boolean" then 
    do return tostring(o) end;
  elseif (_g1) == "function" then 
    do return "<function>" end;
  elseif (_g1) == "nil" then 
    do return "null" end;
  elseif (_g1) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o ~= o) then 
          do return "NaN" end;
        else
          do return tostring(o) end;
        end;
      end;
    end;
  elseif (_g1) == "string" then 
    do return o end;
  elseif (_g1) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return lua.Boot.printEnum(o,s) end;
    else
      if ((o.toString ~= nil) and not lua.Boot.isArray(o)) then 
        do return o:toString() end;
      else
        if (lua.Boot.isArray(o)) then 
          local o2 = o;
          if (s.length > 5) then 
            do return "[...]" end;
          else
            local _g2 = _hx_tab_array({ }, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g2:push(lua.Boot.__string_rec(i,s .. 1));
              end;
            do return "[" .. _g2:join(",") .. "]" end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return "{" .. lua.Boot.printClassRec(o,"",s .. "\t") .. "}" end;
          else
            local fields = lua.Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer,"{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer,", ");
              end;
              _G.table.insert(buffer,"" .. Std.string(f1) .. " : " .. Std.string(o[f1]));
              end;
            _G.table.insert(buffer," }");
            do return _G.table.concat(buffer,"") end;
          end;
        end;
      end;
    end;
  elseif (_g1) == "thread" then 
    do return "<thread>" end;
  elseif (_g1) == "userdata" then 
    do return "<userdata>" end;else
  _G.error("Unknown Lua type",0); end;
end
lua.Boot.extendsOrImplements = function(cl1,cl2) 
  if ((cl1 == nil) or (cl2 == nil)) then 
    do return false end;
  else
    if (cl1 == cl2) then 
      do return true end;
    else
      if (cl1.__interfaces__ ~= nil) then 
        local intf = cl1.__interfaces__;
        local _g1 = 1;
        local _g = _hx_table.maxn(intf) + 1;
        while (_g1 < _g) do 
          _g1 = _g1 + 1;
          local i = _g1 - 1;
          if (lua.Boot.extendsOrImplements(intf[i],cl2)) then 
            do return true end;
          end;
          end;
      end;
    end;
  end;
  do return lua.Boot.extendsOrImplements(cl1.__super__,cl2) end;
end
lua.Boot.fieldIterator = function(o) 
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (lua.Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1,val);
      end;
    do return val end;
  end;
  local cur_val = next_valid(tbl,cur(tbl,nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function() 
    local ret = cur_val;
    cur_val = next_valid(tbl,cur(tbl,cur_val));
    do return ret end;
  end,hasNext=function() 
    do return cur_val ~= nil end;
  end}) end;
end

lua.UserData.new = {}
lua.UserData.__name__ = true

lua.Thread.new = {}
lua.Thread.__name__ = true

tarantool.socket.Peer.new = function(host,port) 
  local self = _hx_new(tarantool.socket.Peer.prototype)
  tarantool.socket.Peer.super(self,host,port)
  return self
end
tarantool.socket.Peer.super = function(self,host,port) 
  self.host = host;
  self.port = port;
end
tarantool.socket.Peer.__name__ = true
tarantool.socket.Peer.prototype = _hx_a(
  
  '__class__',  tarantool.socket.Peer
)
_hxClasses["tarantool.socket.SocketError"] = { __ename__ = true, __constructs__ = _hx_tab_array({[0]="Disconnect"},1)}
tarantool.socket.SocketError = _hxClasses["tarantool.socket.SocketError"];
tarantool.socket.SocketError.Disconnect = _hx_tab_array({[0]="Disconnect",0,__enum__ = tarantool.socket.SocketError},2)


tarantool.socket.SocketInput.new = function(s) 
  local self = _hx_new(tarantool.socket.SocketInput.prototype)
  tarantool.socket.SocketInput.super(self,s)
  return self
end
tarantool.socket.SocketInput.super = function(self,s) 
  self.sock = s;
end
tarantool.socket.SocketInput.__name__ = true
tarantool.socket.SocketInput.prototype = _hx_a(
  'readByte', function(self) 
    local dat = self.sock:read(1);
    if ((dat == nil) or (dat.length < 1)) then 
      _G.error(tarantool.socket.SocketError.Disconnect,0);
    end;
    local cur_idx = 0;
    local pos = 0;
    local _g1 = 0;
    local _g = 0;
    while (_g1 < _g) do 
      _g1 = _g1 + 1;
      local i = _g1 - 1;
      pos = pos + haxe.Utf8.charWidth(dat:charCodeAt(pos));
      end;
    local ret = 0;
    local code = dat:charCodeAt(pos);
    local bytes = haxe.Utf8.charWidth(code);
    if (bytes == 1) then 
      do return code end;
    else
      if (bytes == 2) then 
        do return _hx_bit.bor(_hx_bit.lshift((_hx_bit.band(code,63)),6),_hx_bit.band(dat:charCodeAt(pos + 1),127)) end;
      else
        if (bytes == 3) then 
          do return _hx_bit.bor(_hx_bit.bor(_hx_bit.lshift((_hx_bit.band(code,31)),12),_hx_bit.lshift((_hx_bit.band(dat:charCodeAt(pos + 1),127)),6)),_hx_bit.band(dat:charCodeAt(pos + 2),127)) end;
        else
          do return _hx_bit.bor(_hx_bit.bor(_hx_bit.bor(_hx_bit.lshift((_hx_bit.band(code,15)),18),_hx_bit.lshift((_hx_bit.band(dat:charCodeAt(pos + 1),127)),12)),_hx_bit.lshift((_hx_bit.band(dat:charCodeAt(pos + 2),127)),6)),_hx_bit.band(dat:charCodeAt(pos + 3),127)) end;
        end;
      end;
    end;
  end,
  'readBytes', function(self,s,pos,len) 
    local dat = self.sock:read(len);
    if ((dat == nil) or (dat.length < 1)) then 
      _G.error(tarantool.socket.SocketError.Disconnect,0);
    end;
    local b = haxe.io.Bytes.ofString(dat);
    s:blit(pos,b,0,b.length);
    do return dat.length end
  end,
  'readLine', function(self) 
    local dat = self.sock:read("\n");
    if ((dat == nil) or (dat.length < 1)) then 
      _G.error(tarantool.socket.SocketError.Disconnect,0);
    end;
    do return dat end
  end
  ,'__class__',  tarantool.socket.SocketInput
)
tarantool.socket.SocketInput.__super__ = haxe.io.Input
setmetatable(tarantool.socket.SocketInput.prototype,{__index=haxe.io.Input.prototype})

tarantool.socket.SocketOutput.new = function(s) 
  local self = _hx_new(tarantool.socket.SocketOutput.prototype)
  tarantool.socket.SocketOutput.super(self,s)
  return self
end
tarantool.socket.SocketOutput.super = function(self,s) 
  self._sock = s;
end
tarantool.socket.SocketOutput.__name__ = true
tarantool.socket.SocketOutput.prototype = _hx_a(
  'writeByte', function(self,c) 
    local s = haxe.Utf8.char(c);
    self._sock:write(s);
  end,
  'writeString', function(self,s) 
    self._sock:write(s);
  end,
  'writeBytes', function(self,s,pos,len) 
    local str = s:getString(pos,len);
    do return self._sock:write(str) end
  end
  ,'__class__',  tarantool.socket.SocketOutput
)
tarantool.socket.SocketOutput.__super__ = haxe.io.Output
setmetatable(tarantool.socket.SocketOutput.prototype,{__index=haxe.io.Output.prototype})

tarantool.socket.TcpSocket.new = function() 
  local self = _hx_new(tarantool.socket.TcpSocket.prototype)
  tarantool.socket.TcpSocket.super(self)
  return self
end
tarantool.socket.TcpSocket.super = function(self) 
end
tarantool.socket.TcpSocket.__name__ = true
tarantool.socket.TcpSocket.prototype = _hx_a(
  'assignSocket', function(self,s) 
    self.sock = s;
    local nameTable = self.sock:name();
    local host = nameTable.host;
    local port = nameTable.port;
    self.peer = tarantool.socket.Peer.new(host,port);
    self.input = tarantool.socket.SocketInput.new(self.sock);
    self.output = tarantool.socket.SocketOutput.new(self.sock);
  end,
  'connect', function(self,host,port,timeout) 
    local sock = tarantool.socket.native.NativeSocket.connect(host,port,timeout);
    self:assignSocket(sock);
  end,
  'bind', function(self,host,port,handler) 
    tarantool.socket.native.NativeSocket.tcp_server(host,port,function(s,e) 
      local socket = tarantool.socket.TcpSocket.new();
      socket:assignSocket(s);
      handler(socket);
    end);
  end
  ,'__class__',  tarantool.socket.TcpSocket
)
tarantool.socket.native = {}
tarantool.socket.native.NativeSocket = _G.require("socket")
_hx_bit_clamp = function(v) 
  if v <= 2147483647 and v >= -2147483648 then
    if v > 0 then return _G.math.floor(v)
    else return _G.math.ceil(v)
    end
  end
  if v > 2251798999999999 then v = v*2 end;
  if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
  return _hx_bit.band(v, 2147483647 ) - math.abs(_hx_bit.band(v, 2147483648))
end
pcall(require, 'bit')
if bit then
  _hx_bit = bit
elseif bit32 then
  local _hx_bit_raw = bit32
  _hx_bit = setmetatable({}, { __index = _hx_bit_raw });
  _hx_bit.bnot = function(...) return _hx_bit_clamp(_hx_bit_raw.bnot(...)) end;
  _hx_bit.bxor = function(...) return _hx_bit_clamp(_hx_bit_raw.bxor(...)) end;
end
local _hx_string_mt = _G.getmetatable('');
String.__oldindex = _hx_string_mt.__index;
_hx_string_mt.__index = String.__index;
_hx_string_mt.__add = function(a,b) return Std.string(a)..Std.string(b) end;
_hx_string_mt.__concat = _hx_string_mt.__add
_hx_array_mt.__index = Array.prototype

lua.Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
do

String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
end
_hx_print = print or (function() end)
_hx_table = {}
_hx_table.pack = _G.table.pack or function(...)
    return {...}
end
_hx_table.unpack = _G.table.unpack or _G.unpack
_hx_table.maxn = _G.table.maxn or function(t)
  local maxn=0;
  for i in pairs(t) do
    maxn=type(i)=='number'and i>maxn and i or maxn
  end
  return maxn
end;
Main.main()
return _hx_exports
function varargout = projekt(varargin)
% PROJEKT MATLAB code for projekt.fig
%      PROJEKT, by itself, creates a new PROJEKT or raises the existing
%      singleton*.
%
%      H = PROJEKT returns the handle to a new PROJEKT or the handle to
%      the existing singleton*.
%
%      PROJEKT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKT.M with the given input arguments.
%
%      PROJEKT('Property','Value',...) creates a new PROJEKT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projekt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projekt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projekt

% Last Modified by GUIDE v2.5 25-Jan-2012 00:20:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projekt_OpeningFcn, ...
                   'gui_OutputFcn',  @projekt_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before projekt is made visible.
function projekt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projekt (see VARARGIN)
clc;

axes(handles.axes1);
xlabel('po³o¿enie cz¹stek na osi X');
ylabel('czas');

set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton7,'Enable','on');

set(handles.radiobutton2,'Value',0.0);
set(handles.radiobutton1,'Value',0.0);
set(handles.radiobutton3,'Value',1.0);
% Choose default command line output for projekt
handles.output = hObject;

% polozenia
set(handles.edit11,'String','-3.6');
set(handles.edit12,'String','-1.8');
set(handles.edit13,'String','0');
set(handles.edit14,'String','1.8');
set(handles.edit15,'String','3.6');

% pedy
set(handles.edit16,'String','0');
set(handles.edit17,'String','0');
set(handles.edit18,'String','0');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0');

% masy
set(handles.edit21,'String','0.5');
set(handles.edit22,'String','0.5');
set(handles.edit23,'String','0.5');
set(handles.edit24,'String','0.5');
set(handles.edit25,'String','0.5');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

axes(handles.axes9);
ylabel('wartoœæ si³y - F');

% Update handles structure
guidata(hObject, handles);


% stop animacja
global start;

global jakiwykres;
    jakiwykres = 3;

% czas oraz krok
global t;
global dt;

% ograniczenie boczne
global ogrl;
global ogrp;

% pedy calkowie poszczegolnych czastek
global pc1;
global pc2;
global pc3;
global pc4;
global pc5;

% masy poszczegolnych czasteczek
global m1;
global m2;
global m3;
global m4;
global m5;

% polozenia poczatkowe czasteczek
global x1;%=[0 0];
global x2;%=%[0 0];
global x3;%=[0 0];
global x4;%=[0 0];
global x5;%=[0 0];

% ilosc iteracji
global i;

% UIWAIT makes projekt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projekt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton2,'Enable','off');
global start;
    start = 0;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global x1;
    x1 = str2double(get(handles.edit11,'String'));

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
global x2;
    x2 = str2double(get(handles.edit12,'String'));



% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
global x3;
    x3 = str2double(get(handles.edit13,'String'));


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
global x4;
    x4 = str2double(get(handles.edit14,'String'));


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
global x5;
    x5 = str2double(get(handles.edit15,'String'));


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double
global m3;
    m3 = abs(str2double(get(handles.edit23,'String')));


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double
global m1;
    m1 = abs(str2double(get(handles.edit21,'String')));


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
global m2;
    m2 = abs(str2double(get(handles.edit22,'String')));


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double
global m4;
    m4 = abs(str2double(get(handles.edit24,'String')));


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double
global m5;
    m5 = abs(str2double(get(handles.edit25,'String')));


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double
global pc1;
    pc1 = str2double(get(handles.edit16,'String'));
    pc1;


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double
global pc2;
    pc2 = str2double(get(handles.edit17,'String'));
    

% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
global pc3;
    pc3 = str2double(get(handles.edit18,'String'));


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
global pc4;
    pc4 = str2double(get(handles.edit19,'String'));
    pc4;


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
global pc5;
    pc5 = [str2double(get(handles.edit20,'String')) 0];


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double
global dt;
    dt = abs(str2double(get(handles.edit26,'String')));


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ogrl;
    ogrl = str2double(get(handles.edit27,'String'));
% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ogrp;
    ogrp = str2double(get(handles.edit28,'String'));
% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% polozenia
set(handles.edit11,'String','-3.6');
set(handles.edit12,'String','-1.8');
set(handles.edit13,'String','0');
set(handles.edit14,'String','1.8');
set(handles.edit15,'String','3.6');

% pedy
set(handles.edit16,'String','0');
set(handles.edit17,'String','0');
set(handles.edit18,'String','0');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0');

% masy
set(handles.edit21,'String','0.5');
set(handles.edit22,'String','0.5');
set(handles.edit23,'String','0.5');
set(handles.edit24,'String','0.5');
set(handles.edit25,'String','0.5');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% polozenia
set(handles.edit11,'String','-4.6');
set(handles.edit12,'String','-2.8');
set(handles.edit13,'String','0');
set(handles.edit14,'String','1.8');
set(handles.edit15,'String','3.6');

% pedy
set(handles.edit16,'String','0');
set(handles.edit17,'String','-0.5');
set(handles.edit18,'String','0.5');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0');

% masy
set(handles.edit21,'String','0.5');
set(handles.edit22,'String','0.5');
set(handles.edit23,'String','1');
set(handles.edit24,'String','0.5');
set(handles.edit25,'String','0.8');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit11,'String','-4.6');
set(handles.edit12,'String','-3.4');
set(handles.edit13,'String','1');
set(handles.edit14,'String','2.8');
set(handles.edit15,'String','4.6');

% pedy
set(handles.edit16,'String','0');
set(handles.edit17,'String','0');
set(handles.edit18,'String','0');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0');

% masy
set(handles.edit21,'String','0.05');
set(handles.edit22,'String','0.05');
set(handles.edit23,'String','0.05');
set(handles.edit24,'String','0.05');
set(handles.edit25,'String','0.05');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit11,'String','-5.4');
set(handles.edit12,'String','-1.8');
set(handles.edit13,'String','0');
set(handles.edit14,'String','1.8');
set(handles.edit15,'String','5.4');

% pedy
set(handles.edit16,'String','-0.5');
set(handles.edit17,'String','0');
set(handles.edit18,'String','0');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0.5');

% masy
set(handles.edit21,'String','0.05');
set(handles.edit22,'String','0.5');
set(handles.edit23,'String','0.5');
set(handles.edit24,'String','0.5');
set(handles.edit25,'String','0.05');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',0.0);
set(handles.radiobutton1,'Value',1.0);
set(handles.radiobutton3,'Value',0.0);

global jakiwykres;
    jakiwykres = 1;

axes(handles.axes9);
ylabel('wartoœæ si³y - F');
cla;
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',1.0);
set(handles.radiobutton1,'Value',0.0);
set(handles.radiobutton3,'Value',0.0);

global jakiwykres;
    jakiwykres = 2;

axes(handles.axes9);
ylabel('wartoœæ pêdu - p');
cla;
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton2,'Enable','on');

% stop animacja
global start;

global jakiwykres;

% czas oraz krok
global t;
global dt;

% ograniczenie boczne
global ogrl;
global ogrp;

% pedy calkowie poszczegolnych czastek
global pc1;
global pc2;
global pc3;
global pc4;
global pc5;

% masy poszczegolnych czasteczek
global m1;
global m2;
global m3;
global m4;
global m5;

% polozenia poczatkowe czasteczek
global x1;%=[0 0];
global x2;%=%[0 0];
global x3;%=[0 0];
global x4;%=[0 0];
global x5;%=[0 0];

% ilosc iteracji
global i;

    start = 1;
    axes(handles.axes9);
        cla;
    axes(handles.axes1);
        cla;
        hold on;

    dt = str2double(get(handles.edit26,'String'));
    
    ogrl = str2double(get(handles.edit27,'String'));
    ogrp = str2double(get(handles.edit28,'String'));
    
    pc1 = str2double(get(handles.edit16,'String'));
    pc2 = str2double(get(handles.edit17,'String'));
    pc3 = str2double(get(handles.edit18,'String'));
    pc4 = str2double(get(handles.edit19,'String'));
    pc5 = str2double(get(handles.edit20,'String'));
   
    m1 = abs(str2double(get(handles.edit21,'String')));
    m2 = abs(str2double(get(handles.edit22,'String')));
    m3 = abs(str2double(get(handles.edit23,'String')));
    m4 = abs(str2double(get(handles.edit24,'String')));
    m5 = abs(str2double(get(handles.edit25,'String')));
    
    x1 = str2double(get(handles.edit11,'String'));
    x2 = str2double(get(handles.edit12,'String'));
    x3 = str2double(get(handles.edit13,'String'));
    x4 = str2double(get(handles.edit14,'String'));
    x5 = str2double(get(handles.edit15,'String'));
    
    % hold on;
    i=0;
    tic;
    while(start)
%         tic;
        
        i=i+dt;
        axes(handles.axes1);
        
        r12 = liczR(x1,x2);
        r13 = liczR(x1,x3);
        r14 = liczR(x1,x4);
        r15 = liczR(x1,x5);

        r23 = liczR(x2,x3);
        r24 = liczR(x2,x4);
        r25 = liczR(x2,x5);

        r34 = liczR(x3,x4);
        r35 = liczR(x3,x5);

        r45 = liczR(x4,x5);

        % ------

        F12 = liczF(r12);
        F21 = liczF(-r12);

        F13 = liczF(r13);
        F31 = liczF(-r13);

        F14 = liczF(r14);
        F41 = liczF(-r14);

        F15 = liczF(r15);
        F51 = liczF(-r15);

        F23 = liczF(r23);
        F32 = liczF(-r23);

        F24 = liczF(r24);
        F42 = liczF(-r24);

        F25 = liczF(r25);
        F52 = liczF(-r25);

        F34 = liczF(r34);
        F43 = liczF(-r34);

        F35 = liczF(r35);
        F53 = liczF(-r35);

        F45 = liczF(r45);
        F54 = liczF(-r45);

        % ------

        Fc1 = liczFC(F12,F13,F14,F15);
        Fc2 = liczFC(F21,F23,F24,F25);
        Fc3 = liczFC(F31,F32,F34,F35);
        Fc4 = liczFC(F41,F42,F43,F45);
        Fc5 = liczFC(F51,F52,F53,F54);

        if x1 >= ogrp || x1 <= ogrl
            Fc1 = -Fc1;
        end

        if x2 >= ogrp || x2 <= ogrl
            Fc2 = -Fc2;
        end

        if x3 >= ogrp || x3 <= ogrl
            Fc3 = -Fc3;
        end

        if x4 >= ogrp || x4 <= ogrl
            Fc4 = -Fc4;
        end

        if x5 >= ogrp || x5 <= ogrl
            Fc5 = -Fc5;
        end

        pc1 = pc1 + liczP(x1,Fc1,dt);
        pc2 = pc2 + liczP(x2,Fc2,dt);
        pc3 = pc3 + liczP(x3,Fc3,dt);
        pc4 = pc4 + liczP(x4,Fc4,dt);
        pc5 = pc5 + liczP(x5,Fc5,dt);

        if x1 >= ogrp || x1 <= ogrl
            pc1 = -pc1;
        end

        if x2 >= ogrp || x2 <= ogrl
            pc2 = -pc2;
        end

        if x3 >= ogrp || x3 <= ogrl
            pc3 = -pc3;
        end

        if x4 >= ogrp || x4 <= ogrl
            pc4 = -pc4;
        end

        if x5 >= ogrp || x5 <= ogrl
            pc5 = -pc5;
        end

        x1 = x1 + liczDX(pc1,m1,dt);
        x2 = x2 + liczDX(pc2,m2,dt);
        x3 = x3 + liczDX(pc3,m3,dt);
        x4 = x4 + liczDX(pc4,m4,dt);
        x5 = x5 + liczDX(pc5,m5,dt);

        plot([x1;x2;x3;x4;x5],i,'o');

        hold on;
        xlim([(ogrl-.1) (ogrp+.1)]);
%         ylim([-0.5 (i+1)]);


      
%        if get(handles.radiobutton1,'Value') == 1.0
%            axes(handles.axes9);
%             plot(i,abs([Fc1(1);Fc2(1);Fc3(1);Fc4(1);Fc5(1)]),'.');
%             xlim([0 (i+0.5)]);
%             hold on;
%        elseif get(handles.radiobutton2,'Value') == 1.0
%            axes(handles.axes9);
%            plot(i,abs([pc1(1);pc2(1);pc3(1);pc4(1);pc5(1)]),'.');
%            xlim([0 (i+0.5)]);
%            hold on;
%        end       


% szybsze wykonanie programu

    switch jakiwykres
        case 1 
            axes(handles.axes9);
            plot(i,abs([Fc1;Fc2;Fc3;Fc4;Fc5]),'.');
%             xlim([0 (i+0.5)]);
            hold on;
        case 2
            axes(handles.axes9);
            plot(i,abs([pc1;pc2;pc3;pc4;pc5]),'.');
%             xlim([0 (i+0.5)]);
            hold on;       
    end
       
%        pause(0.01);
       drawnow
% toc;
    end
    


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',0.0);
set(handles.radiobutton1,'Value',0.0);
set(handles.radiobutton3,'Value',1.0);

global jakiwykres;
    jakiwykres = 3;

axes(handles.axes9);
ylabel('brak');
cla;
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% polozenia
set(handles.edit11,'String','-5.4');
set(handles.edit12,'String','-4.2');
set(handles.edit13,'String','0');
set(handles.edit14,'String','4.2');
set(handles.edit15,'String','5.4');

% pedy
set(handles.edit16,'String','0');
set(handles.edit17,'String','0');
set(handles.edit18,'String','1');
set(handles.edit19,'String','0');
set(handles.edit20,'String','0');

% masy
set(handles.edit21,'String','0.8');
set(handles.edit22,'String','0.6');
set(handles.edit23,'String','0.5');
set(handles.edit24,'String','0.6');
set(handles.edit25,'String','0.8');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% polozenia
set(handles.edit11,'String','-5.4');
set(handles.edit12,'String','-2.2');
set(handles.edit13,'String','0');
set(handles.edit14,'String','2.2');
set(handles.edit15,'String','5.4');

% pedy
set(handles.edit16,'String','2');
set(handles.edit17,'String','-2');
set(handles.edit18,'String','0.5');
set(handles.edit19,'String','2');
set(handles.edit20,'String','-2');

% masy
set(handles.edit21,'String','0.8');
set(handles.edit22,'String','0.8');
set(handles.edit23,'String','0.08');
set(handles.edit24,'String','0.8');
set(handles.edit25,'String','0.8');

% krok
set(handles.edit26,'String','0.01');

% ograniczenia
set(handles.edit27,'String','-5.6');
set(handles.edit28,'String','5.6');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% czas oraz krok
global dt;

% ograniczenie boczne
global ogrl;
global ogrp;

% pedy calkowie poszczegolnych czastek
global pc1;
global pc2;
global pc3;
global pc4;
global pc5;

% masy poszczegolnych czasteczek
global m1;
global m2;
global m3;
global m4;
global m5;

% polozenia poczatkowe czasteczek
global x1;%=[0 0];
global x2;%=%[0 0];
global x3;%=[0 0];
global x4;%=[0 0];
global x5;%=[0 0];

% ilosc iteracji
global i;


dt = str2double(get(handles.edit26,'String'));

ogrl = str2double(get(handles.edit27,'String'));
ogrp = str2double(get(handles.edit28,'String'));

pc1 = str2double(get(handles.edit16,'String'));
pc2 = str2double(get(handles.edit17,'String'));
pc3 = str2double(get(handles.edit18,'String'));
pc4 = str2double(get(handles.edit19,'String'));
pc5 = str2double(get(handles.edit20,'String'));

m1 = abs(str2double(get(handles.edit21,'String')));
m2 = abs(str2double(get(handles.edit22,'String')));
m3 = abs(str2double(get(handles.edit23,'String')));
m4 = abs(str2double(get(handles.edit24,'String')));
m5 = abs(str2double(get(handles.edit25,'String')));

x1 = str2double(get(handles.edit11,'String'));
x2 = str2double(get(handles.edit12,'String'));
x3 = str2double(get(handles.edit13,'String'));
x4 = str2double(get(handles.edit14,'String'));
x5 = str2double(get(handles.edit15,'String'));


% --------------------------------------------------------------------
function O_programie_Callback(hObject, eventdata, handles)
% hObject    handle to O_programie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oprogramie;

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
    cla;
axes(handles.axes9);
    cla;

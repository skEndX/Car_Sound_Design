function varargout = KDH(varargin)
% KDH MATLAB code for KDH.fig
%      KDH, by itself, creates a new KDH or raises the existing
%      singleton*.
%
%      H = KDH returns the handle to a new KDH or the handle to
%      the existing singleton*.
%
%      KDH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KDH.M with the given input arguments.
%
%      KDH('Property','Value',...) creates a new KDH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KDH_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KDH_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KDH

% Last Modified by GUIDE v2.5 13-Dec-2019 22:03:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KDH_OpeningFcn, ...
                   'gui_OutputFcn',  @KDH_OutputFcn, ...
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


% --- Executes just before KDH is made visible.
function KDH_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KDH (see VARARGIN)

% Choose default command line output for KDH
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KDH wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KDH_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sound_array, fs] = audioread('DD.m4a'); 
y = sound_array(fs*0.7:fs*0.85)*25;     %원래 소리
length(y)
whos y;
whos fs;
TotalTime = length(y)./fs;
t = 0:TotalTime/(length(y)):TotalTime-TotalTime/length(y);
soundsc(y,fs);
plot(handles.axes1,y);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sound_array, fs] = audioread('DD.m4a'); % add 소리
a = sound_array(fs*0.7:fs*0.85)*25;     
sound_array=[a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0]+ 0.0000001;
soundsc(sound_array,fs);
plot(handles.axes1,sound_array);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sound_array, fs] = audioread('car_sound.m4a');    %simulink로 변형한 소리
a = sound_array(fs:fs*5)*25;
soundsc(a,fs);
plot(handles.axes1,a);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sound_array, fs] = audioread('car_sound.m4a');     %simulink로 변형한 소리
[sound_array1, fs] = audioread('vjdvjd.wav');   %소리를 추가하여 타이머 폭탄 소리
a = sound_array(fs:fs*5)*25;
b=[a sound_array1'];    %나만의 사운드
soundsc(b,fs);
plot(handles.axes1,b);



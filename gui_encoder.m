function varargout = gui_encoder(varargin)
% GUI_ENCODER MATLAB code for gui_encoder.fig
%      GUI_ENCODER, by itself, creates a new GUI_ENCODER or raises the existing
%      singleton*.
%
%      H = GUI_ENCODER returns the handle to a new GUI_ENCODER or the handle to
%      the existing singleton*.
%
%      GUI_ENCODER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ENCODER.M with the given input arguments.
%
%      GUI_ENCODER('Property','Value',...) creates a new GUI_ENCODER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_encoder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_encoder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_encoder

% Last Modified by GUIDE v2.5 19-Jan-2024 23:35:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_encoder_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_encoder_OutputFcn, ...
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


% --- Executes just before gui_encoder is made visible.
function gui_encoder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_encoder (see VARARGIN)

% Choose default command line output for gui_encoder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_encoder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_encoder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in encode_btn.
function encode_btn_Callback(hObject, eventdata, handles)
% hObject    handle to encode_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.input_txt,'string');
x=Encoder(a);
plot(x)



function input_txt_Callback(hObject, eventdata, handles)
% hObject    handle to input_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_txt as text
%        str2double(get(hObject,'String')) returns contents of input_txt as a double


% --- Executes during object creation, after setting all properties.
function input_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in playsound_btn.
function playsound_btn_Callback(hObject, eventdata, handles)
% hObject    handle to playsound_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
a=get(handles.input_txt,'string');
x=Encoder(a);
sound( x,fs);



% --- Executes on button press in save_btn.
function save_btn_Callback(hObject, eventdata, handles)
% hObject    handle to save_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
a=get(handles.input_txt,'string');
x=Encoder(a);
audiowrite('record.wav', x, fs);

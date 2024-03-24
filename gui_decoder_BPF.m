function varargout = gui_decoder_BPF(varargin)
% GUI_DECODER_BPF MATLAB code for gui_decoder_BPF.fig
%      GUI_DECODER_BPF, by itself, creates a new GUI_DECODER_BPF or raises the existing
%      singleton*.
%
%      H = GUI_DECODER_BPF returns the handle to a new GUI_DECODER_BPF or the handle to
%      the existing singleton*.
%
%      GUI_DECODER_BPF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DECODER_BPF.M with the given input arguments.
%
%      GUI_DECODER_BPF('Property','Value',...) creates a new GUI_DECODER_BPF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_decoder_BPF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_decoder_BPF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_decoder_BPF

% Last Modified by GUIDE v2.5 21-Jan-2024 14:03:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_decoder_BPF_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_decoder_BPF_OutputFcn, ...
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


% --- Executes just before gui_decoder_BPF is made visible.
function gui_decoder_BPF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_decoder_BPF (see VARARGIN)

% Choose default command line output for gui_decoder_BPF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_decoder_BPF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_decoder_BPF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inputdecode_Callback(hObject, eventdata, handles)
% hObject    handle to inputdecode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputdecode as text
%        str2double(get(hObject,'String')) returns contents of inputdecode as a double


% --- Executes during object creation, after setting all properties.
function inputdecode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputdecode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in decode.
function decode_Callback(hObject, eventdata, handles)
% hObject    handle to decode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.inputdecode,'string');
x=DecoderWithBPF(a);
set(handles.outputdecode, 'String' ,x);

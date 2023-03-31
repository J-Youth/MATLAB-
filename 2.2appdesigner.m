classdef demo < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        VoiceSignalProcessingUIFigure  matlab.ui.Figure
        Panel_3                        matlab.ui.container.Panel
        Label_4                        matlab.ui.control.Label
        Label_3                        matlab.ui.control.Label
        Label_2                        matlab.ui.control.Label
        Label_5                        matlab.ui.control.Label
        Label_6                        matlab.ui.control.Label
        UIAxes_win6                    matlab.ui.control.UIAxes
        UIAxes_win5                    matlab.ui.control.UIAxes
        UIAxes_win4                    matlab.ui.control.UIAxes
        UIAxes_win3                    matlab.ui.control.UIAxes
        UIAxes_win2                    matlab.ui.control.UIAxes
        UIAxes_win1                    matlab.ui.control.UIAxes
        TabGroup                       matlab.ui.container.TabGroup
        Tab                            matlab.ui.container.Tab
        Image3                         matlab.ui.control.Image
        Panel_2                        matlab.ui.container.Panel
        sButton_4                      matlab.ui.control.Button
        sButton_3                      matlab.ui.control.Button
        sButton_2                      matlab.ui.control.Button
        sButton                        matlab.ui.control.Button
        Image                          matlab.ui.control.Image
        Panel_4                        matlab.ui.container.Panel
        Button                         matlab.ui.control.Button
        UIAxes_bar1_2                  matlab.ui.control.UIAxes
        UIAxes_bar1_1                  matlab.ui.control.UIAxes
        Panel                          matlab.ui.container.Panel
        Image2                         matlab.ui.control.Image
        PleaseSelectDropDown           matlab.ui.control.DropDown
        PleaseSelectDropDownLabel      matlab.ui.control.Label
        Tab_2                          matlab.ui.container.Tab
        Button_6                       matlab.ui.control.Button
        Image3_2                       matlab.ui.control.Image
        Panel_8                        matlab.ui.container.Panel
        Button_5                       matlab.ui.control.Button
        Fre6EditField                  matlab.ui.control.NumericEditField
        Fre6EditFieldLabel             matlab.ui.control.Label
        Fre4EditField                  matlab.ui.control.NumericEditField
        Fre4EditFieldLabel             matlab.ui.control.Label
        Fre2EditField_2                matlab.ui.control.NumericEditField
        Fre2EditField_2Label           matlab.ui.control.Label
        Fre5EditField                  matlab.ui.control.NumericEditField
        Fre5EditFieldLabel             matlab.ui.control.Label
        Fre3EditField_2                matlab.ui.control.NumericEditField
        Fre3EditField_2Label           matlab.ui.control.Label
        Fre1EditField                  matlab.ui.control.NumericEditField
        Fre1EditFieldLabel             matlab.ui.control.Label
        NONOISESwitch                  matlab.ui.control.Switch
        NONOISESwitchLabel             matlab.ui.control.Label
        Panel_7                        matlab.ui.container.Panel
        EditField                      matlab.ui.control.NumericEditField
        kHzSlider                      matlab.ui.control.Slider
        Label_7                        matlab.ui.control.Label
        Panel_6                        matlab.ui.container.Panel
        ButtonGroup                    matlab.ui.container.ButtonGroup
        Button_4                       matlab.ui.control.RadioButton
        Button_3                       matlab.ui.control.RadioButton
        Panel_5                        matlab.ui.container.Panel
        defultButton                   matlab.ui.control.Button
        UIAxes_bar2_2                  matlab.ui.control.UIAxes
        UIAxes_bar2_1                  matlab.ui.control.UIAxes
        Tab_3                          matlab.ui.container.Tab
        LPFHzEditField_2               matlab.ui.control.NumericEditField
        LPFHzLabel_2                   matlab.ui.control.Label
        Image4                         matlab.ui.control.Image
        Panel_10                       matlab.ui.container.Panel
        Button_8                       matlab.ui.control.Button
        ButtonGroup_5                  matlab.ui.container.ButtonGroup
        LPFHzEditField                 matlab.ui.control.NumericEditField
        LPFHzLabel                     matlab.ui.control.Label
        Button_7                       matlab.ui.control.Button
        IIRPanel                       matlab.ui.container.Panel
        ButtonGroup_2                  matlab.ui.container.ButtonGroup
        Button_10                      matlab.ui.control.RadioButton
        Button_9                       matlab.ui.control.RadioButton
        FIRPanel                       matlab.ui.container.Panel
        ButtonGroup_4                  matlab.ui.container.ButtonGroup
        Button_20                      matlab.ui.control.RadioButton
        Button_19                      matlab.ui.control.RadioButton
        Button_18                      matlab.ui.control.RadioButton
        Button_17                      matlab.ui.control.RadioButton
        Button_16                      matlab.ui.control.RadioButton
        Button_15                      matlab.ui.control.RadioButton
        Panel_9                        matlab.ui.container.Panel
        defultButton_2                 matlab.ui.control.Button
        UIAxes_bar3_2                  matlab.ui.control.UIAxes
        UIAxes_bar3_1                  matlab.ui.control.UIAxes
        DesignedbyLabel                matlab.ui.control.Label
        Label                          matlab.ui.control.Label
    end

    
    methods (Access = public)
          function record(time)
            % 录音时间
            recObj = audiorecorder;
            disp('Start speaking.')
            recordblocking(recObj, time);
            disp('End of Recording.');
            % 回放录音数据
            % play(recObj);
            % 获取录音数据
            myRecording = getaudiodata(recObj);
            % 绘制录音数据波形
            plot(myRecording);
            %存储语音信号
            switch time
                case 5
                    filename = '语音库\data_5s.wav'; 
                case 10
                    filename = '语音库\data_10s.wav'; 
                case 15
                    filename = '语音库\data_15s.wav'; 
                case 20
                    filename = '语音库\data_20s.wav'; 
            end
            audiowrite(filename,myRecording,8000);
        end
 
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            warndlg('beta1.0版，持续开发中……','尤思洋','modal')
%             fig = uifigure;
%             uialert(fig,'此程序尚不完善，请见谅……','尤思洋','Icon','success')
%             uialert(fig,'File not found','Invalid File');
%             msgbox('此程序尚不完善，请见谅……','开门大吉''help')
        end

        % Value changed function: PleaseSelectDropDown
        function PleaseSelectDropDownValueChanged(app, event)
            value = app.PleaseSelectDropDown.Value;
            global x fs
            if strcmp(value,'qq')
                [x,fs]=audioread('qq.m4a');             
            end
            if strcmp(value,'luyin')
                [x,fs]=audioread('luyin.m4a');             
            end
            if strcmp(value,'test')
                [x,fs]=audioread('test.wav');             
            end
            if strcmp(value,'voice')
                [x,fs]=audioread('voice.m4a');             
            end

            %做原始语音信号的时频域波形图
            t=1:length(x);
            plot(app.UIAxes_bar1_1,t,x,'c');
            y1=fft(x,8192);           %对信号做1024点FFT变换
            f=fs*(0:4095)/8192;
            plot(app.UIAxes_bar1_2,f,abs(y1(1:4096)),'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,abs(y1(1:4096)),'c');
 
        end

        % Callback function
        function StartStopButtonButtonDown(app, event)
           global x fs
            sound(x,fs)
        end

        % Button pushed function: sButton
        function sButtonPushed(app, event)
            global x fs
            msgbox('正在录音中，5s后结束','tips','success');
            record(5)

            %做原始语音信号的时频域波形图
            [x,fs]=audioread('语音库/data_5s.wav');
            t=1:length(x);  %时域
            plot(app.UIAxes_bar1_1,t,x,'c');

            n=length(x);    %频域
            amp=abs(fft(x))/n*2;
            amp2=amp(1:n/2);
            f=1:length(amp2);
            plot(app.UIAxes_bar1_2,f,amp2,'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,amp2,'c');
        end

        % Image clicked function: Image3
        function Image3Clicked(app, event)
%             [x,fs]=audioread('qq.m4a');
              global x fs
            sound(x,fs)
%             app.Image3.ImageSource=('暂停.png');
        end

        % Button pushed function: sButton_2
        function sButton_2Pushed(app, event)
            global x fs
            msgbox('正在录音中，10s后结束','tips','help');
            record(10)

            %做原始语音信号的时频域波形图
            [x,fs]=audioread('语音库/data_10s.wav');
            t=1:length(x);  %时域
            plot(app.UIAxes_bar1_1,t,x,'c');
            n=length(x);    %频域
            amp=abs(fft(x))/n*2;
            amp2=amp(1:n/2);
            f=1:length(amp2);
            plot(app.UIAxes_bar1_2,f,amp2,'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,amp2,'c');
        end

        % Button pushed function: sButton_3
        function sButton_3Pushed(app, event)
            global x fs
            msgbox('正在录音中，15s后结束','tips','help');
            record(15)

            %做原始语音信号的时频域波形图
            [x,fs]=audioread('语音库/data_15s.wav');
            t=1:length(x);  %时域
            plot(app.UIAxes_bar1_1,t,x,'c');
            n=length(x);    %频域
            amp=abs(fft(x))/n*2;
            amp2=amp(1:n/2);
            f=1:length(amp2);
            plot(app.UIAxes_bar1_2,f,amp2,'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,amp2,'c');
        end

        % Button pushed function: sButton_4
        function sButton_4Pushed(app, event)
            global x fs
            msgbox('正在录音中，20s后结束','tips','help');
            record(20)

            %做原始语音信号的时频域波形图
            [x,fs]=audioread('语音库/data_20s.wav');
            t=1:length(x);  %时域
            plot(app.UIAxes_bar1_1,t,x,'c');
            n=length(x);    %频域
            amp=abs(fft(x))/n*2;
            amp2=amp(1:n/2);
            f=1:length(amp2);
            plot(app.UIAxes_bar1_2,f,amp2,'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,amp2,'c');
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
             global x fs 
            [x,fs]=audioread('qq.m4a');
                                         
            %做原始语音信号的时频域波形图
            t=1:length(x);
            plot(app.UIAxes_bar1_1,t,x,'c');
            y1=fft(x,1024);           %对信号做1024点FFT变换
            f=fs*(0:511)/1024;
            plot(app.UIAxes_bar1_2,f,abs(y1(1:512)),'c');

            plot(app.UIAxes_win1,t,x,'c');
            plot(app.UIAxes_win2,f,abs(y1(1:512)),'c');

        end

        % Selection changed function: ButtonGroup
        function ButtonGroupSelectionChanged(app, event)
            global x addnoise fs
            selectedButton = app.ButtonGroup.SelectedObject;
           
            if selectedButton==app.Button_3
                addnoise=rand(1,length(x))'/20;
%                 msgbox('已选择均匀随机噪声','tip','help')

            elseif selectedButton==app.Button_4
                addnoise=randn(1,length(x))'/20;
%                 msgbox('已选择高斯随机噪声','tip','help')
            end


            t=1:length(addnoise);  %时域
            plot(app.UIAxes_bar2_1,t,addnoise,'c');
            n=length(addnoise);    %频域
            amp=abs(fft(addnoise))/n*2;
            amp2=amp(1:n/2);
            f=1:length(amp2);
            plot(app.UIAxes_bar2_2,f,amp2,'c');

        end

        % Value changed function: NONOISESwitch
        function NONOISESwitchValueChanged(app, event)
            value = app.NONOISESwitch.Value;
            global x addnoise
            if strcmp(value,'On')
                ButtonName=questdlg('确定不加噪吗？如果不加噪将对原始信号进行滤波！','确定不加噪吗？','Yes','No','Cancel','Cancel');
                if strcmp(ButtonName,'Yes')
                   addnoise=zeros(1,length(x))';
                    app.Label_5.Text='未加噪信号';
                    Button_6Pushed(app, event);
%                 plot(app.UIAxes_win3,t,x,'c');
%                 plot(app.UIAxes_win4,f,abs(y1(1:512)),'c');
                end
%                 if strcmp(ButtonName,'NO')||strcmp(ButtonName,'Cancel')
                if strcmp(ButtonName,'NO')
                    app.NONOISESwitch.Value='Off';
                end
            end

        end

        % Value changing function: kHzSlider
        function kHzSliderValueChanging(app, event)
            changingValue = event.Value*1000;
             global  x addnoise
            app.EditField.Value=changingValue/1000;
             N=length(x);%采样点个数
            n=0:N-1;%时间轴离散化
            addnoise=sin(2*pi*changingValue*n/N)'/20;%正弦信号离散化
%             plot(app.UIAxes_bar2_1,n,addnoise);%关于n和f的作图，图像位置设置
            
%           上一句注释掉的才是真实的作图，这一句只是为了直观好看些
            plot(app.UIAxes_bar2_1,n,sin(2*pi*changingValue*n/N/1000),'c');

            f=fft(addnoise);%傅里叶变换
            Nyquist=N/2-1;%谐波次数设置
            fn=abs(f)*2/N;%取绝对值，计算幅度
            plot(app.UIAxes_bar2_2,n(1:Nyquist),fn(1:Nyquist),'c');
            %频谱图绘制，由奈奎斯特取样定理可知只需要显示前N/2-1次谐波


        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            global  x addnoise
            %获取频率值
            f1=app.Fre1EditField.Value;
            f2=app.Fre2EditField_2.Value;
            f3=app.Fre3EditField_2.Value;
            f4=app.Fre4EditField.Value;
            f5=app.Fre5EditField.Value;
            f6=app.Fre6EditField.Value;

            N=length(x);%采样点个数
            n=0:N-1;%时间轴离散化
            n1=sin(2*pi*f1*n/N);%正弦信号离散化
            n2=sin(2*pi*f2*n/N);
            n3=sin(2*pi*f3*n/N);
            n4=sin(2*pi*f4*n/N);
            n5=sin(2*pi*f5*n/N);
            n6=sin(2*pi*f6*n/N);
            addnoise=(n1+n2+n3+n4+n5+n6)'/20;
            
            f=fft(addnoise);%傅里叶变换
            plot(app.UIAxes_bar2_1,n,addnoise,'c');%关于n和f的作图，图像位置设置
            
            Nyquist=N/2-1;%谐波次数设置
            fn=abs(f)*2/N;%取绝对值，计算幅度
            plot(app.UIAxes_bar2_2,n(1:Nyquist),fn(1:Nyquist),'c');
            %频谱图绘制，由奈奎斯特取样定理可知只需要显示前N/2-1次谐波
%             axis(app.UIAxes_bar2_2,[0 100000 0 0.011])

        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            global  x addnoise signalnoise
%             k=x(:,1)';
            addzero=[addnoise,zeros(1,length(x)-length(addnoise))];
             signalnoise=x+addzero;
%             signalnoise=x+addnoise;
            N=length(signalnoise);%采样点个数
            n=0:N-1;%时间轴离散化
            f=fft(signalnoise);%傅里叶变换
            plot(app.UIAxes_win3,n,signalnoise,'c');%关于n和f的作图，图像位置设置
            
            Nyquist=N/2-1;%谐波次数设置
            fn=abs(f)*2/N;%取绝对值，计算幅度
            plot(app.UIAxes_win4,n(1:Nyquist),fn(1:Nyquist),'c');
            %频谱图绘制，由奈奎斯特取样定理可知只需要显示前N/2-1次谐波

%          sound(signalnoise,fs)
%             filename = '语音库\signal_noise.wav'; 
%             audiowrite(filename,signalnoise,40000);

        end

        % Callback function
        function Image_noiseClicked(app, event)
            global signalnoise fs
%             sound(signalnoise,fs)
            sound(signalnoise,fs)
        end

        % Image clicked function: Image4
        function Image4Clicked(app, event)
           global   recover_signal fs
           sound(recover_signal,fs)

        end

        % Image clicked function: Image3_2
        function Image3_2Clicked(app, event)
            global  signalnoise fs 
            sound(signalnoise,fs)
        end

        % Button down function: ButtonGroup_4
        function ButtonGroup_4ButtonDown(app, event)
            global  fs
            selectedButton = app.ButtonGroup_4.SelectedObject;

            fp=app.LPFHzEditField.Value;
            fr=app.LPFHzEditField_2.Value;
            wp=2*pi*fp/fs;
            wr=2*pi*fr/fs;
            tr_width=wr-wp;%过渡带宽
            %不同窗的过渡带宽
            if selectedButton==app.Button_15
                bew=1.8;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(boxcar(N))';%矩形窗
            end
            if selectedButton==app.Button_16
                bew=6.1;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(triang(N))';%矩形窗
            end
            if selectedButton==app.Button_17
                bew=6.2;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(hanning(N))';%矩形窗
            end
            if selectedButton==app.Button_18
                bew=6.6;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(hamming(N))';%矩形窗
            end            
            if selectedButton==app.Button_19
                bew=11;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(blackman(N))';%矩形窗
            end
            if selectedButton==app.Button_20
                bew=11;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(kaiser(N))';%矩形窗
            end

            wc=(wr+wp)/2;%理想低通滤波器的截止频率
            hd=ideal_lp(wc,N);%理想低通滤波器的单位脉冲响应
            h=hd.*w_ham;%截取得到实际单位脉冲响应
            [db,mag,pha,grd,w]=freqz_m(h,[1]);%计算实际滤波器的幅度响应

            plot(app.UIAxes_bar3_1,w/pi,db,'c');
            plot(app.UIAxes_bar3_2,w*fs/(2*pi),mag,'c');
        end

        % Selection changed function: ButtonGroup_4
        function ButtonGroup_4SelectionChanged(app, event)
            selectedButton = app.ButtonGroup_4.SelectedObject;
            global  fs h

            fp=app.LPFHzEditField.Value;
            fr=app.LPFHzEditField_2.Value;
            wp=2*pi*fp/fs;
            wr=2*pi*fr/fs;
            tr_width=wr-wp;%过渡带宽
            %不同窗的过渡带宽
            if selectedButton==app.Button_15
                bew=1.8;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(boxcar(N))';%矩形窗
            end
            if selectedButton==app.Button_16
                bew=6.1;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(triang(N))';%矩形窗
            end
            if selectedButton==app.Button_17
                bew=6.2;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(hanning(N))';%矩形窗
            end
            if selectedButton==app.Button_18
                bew=6.6;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(hamming(N))';%矩形窗
            end            
            if selectedButton==app.Button_19
                bew=11;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(blackman(N))';%矩形窗
            end
            if selectedButton==app.Button_20
                bew=11;
                N=ceil(bew*pi/tr_width)+1;%精准过渡带宽
                w_ham=(kaiser(N))';%矩形窗
            end

            wc=(wr+wp)/2;%理想低通滤波器的截止频率
            hd=ideal_lp(wc,N);%理想低通滤波器的单位脉冲响应
            h=hd.*w_ham;%截取得到实际单位脉冲响应
            [db,mag,pha,grd,w]=freqz_m(h,[1]);%计算实际滤波器的幅度响应

            plot(app.UIAxes_bar3_1,w/pi,db,'c');
            plot(app.UIAxes_bar3_2,w*fs/(2*pi),mag,'c');

        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            global  signalnoise h recover_signal
            [recover_signal,Yk,m]=fft_conv(signalnoise(:,1)',h);
            plot(app.UIAxes_win5,m,recover_signal,'c');
%             m=fs*(0:4095)/8192;
%             plot(app.UIAxes_win6,m,abs(Yk),'c');
            m=length(m);
            n=0:(m-1);
            Nyquist=m/10-1;%谐波次数设置
            fn=abs(Yk)*2/m;%取绝对值，计算幅度
            plot(app.UIAxes_win6,n(1:Nyquist),fn(1:Nyquist),'c');
            %频谱图绘制，由奈奎斯特取样定理可知只需要显示前N/2-1次谐波
        end

        % Selection changed function: ButtonGroup_2
        function ButtonGroup_2SelectionChanged(app, event)
            selectedButton = app.ButtonGroup_2.SelectedObject;
            global  fs signalnoise
             fp=app.LPFHzEditField.Value;
             fr=app.LPFHzEditField_2.Value;
            wp=2*pi*fp/fs;
            ws=2*pi*fr/fs;
            Rp=1;
            Rs=50; 
            Ts=1/fs;
            wp1=2/Ts*tan(wp/2);                 %将模拟指标转换成数字指标
            ws1=2/Ts*tan(ws/2); 
            [N,Wn]=buttord(wp1,ws1,Rp,Rs,'s');  %选择滤波器的最小阶数
            [Z,P,K]=buttap(N);                  %创建butterworth模拟滤波器
            [Bap,Aap]=zp2tf(Z,P,K);
            [b,a]=lp2lp(Bap,Aap,Wn);   
            if selectedButton==app.Button_9
                 [bz,az]=impinvar(b,a,fs);      %用冲激响应不变变换法实现模拟滤波器到数字滤波器的转换
            end
             if selectedButton==app.Button_10
                 [bz,az]=bilinear(b,a,fs);      %用双线性变换法实现模拟滤波器到数字滤波器的转换
             end
            [dB,mag,pha,grd,w]=freqz_m(bz,az);
            
            plot(app.UIAxes_bar3_1,w/pi,dB,'c');
            plot(app.UIAxes_bar3_2,w*fs/(2*pi),mag,'c');

recover_signal=filter(bz,az,signalnoise);
m=length(recover_signal);
n=0:(m-1);
plot(app.UIAxes_win5,n,recover_signal,'c');

Yk=fft(recover_signal);
            Nyquist=m/20-1;%谐波次数设置
            fn=abs(Yk)*2/m;%取绝对值，计算幅度
            plot(app.UIAxes_win6,n(1:Nyquist),fn(1:Nyquist),'c');
        end

        % Button pushed function: defultButton
        function defultButtonPushed(app, event)
            
                Button_6Pushed(app, event)

        end

        % Button pushed function: defultButton_2
        function defultButton_2Pushed(app, event)
            
            ButtonGroup_4SelectionChanged(app, event)

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create VoiceSignalProcessingUIFigure and hide until all components are created
            app.VoiceSignalProcessingUIFigure = uifigure('Visible', 'off');
            app.VoiceSignalProcessingUIFigure.Color = [1 1 1];
            app.VoiceSignalProcessingUIFigure.Position = [100 100 1047 631];
            app.VoiceSignalProcessingUIFigure.Name = 'Voice Signal Processing';
            app.VoiceSignalProcessingUIFigure.Icon = 'Cat.png';

            % Create Label
            app.Label = uilabel(app.VoiceSignalProcessingUIFigure);
            app.Label.BackgroundColor = [0.6196 0.9216 0.8902];
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontName = '华文行楷';
            app.Label.FontSize = 40;
            app.Label.FontColor = [1 1 1];
            app.Label.Position = [1 1 1047 46];
            app.Label.Text = '语 音 信 号 处 理';

            % Create DesignedbyLabel
            app.DesignedbyLabel = uilabel(app.VoiceSignalProcessingUIFigure);
            app.DesignedbyLabel.FontName = '华文行楷';
            app.DesignedbyLabel.FontColor = [1 1 1];
            app.DesignedbyLabel.Position = [675 13 91 22];
            app.DesignedbyLabel.Text = 'Designed by 尤思洋';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.VoiceSignalProcessingUIFigure);
            app.TabGroup.Position = [1 46 1047 586];

            % Create Tab
            app.Tab = uitab(app.TabGroup);
            app.Tab.Title = '原始声音信号来源';
            app.Tab.BackgroundColor = [0.949 1 0.9882];

            % Create Panel
            app.Panel = uipanel(app.Tab);
            app.Panel.TitlePosition = 'centertop';
            app.Panel.Title = '本地语音文件';
            app.Panel.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel.Position = [15 463 343 90];

            % Create PleaseSelectDropDownLabel
            app.PleaseSelectDropDownLabel = uilabel(app.Panel);
            app.PleaseSelectDropDownLabel.HorizontalAlignment = 'right';
            app.PleaseSelectDropDownLabel.Position = [104 24 79 22];
            app.PleaseSelectDropDownLabel.Text = 'Please Select';

            % Create PleaseSelectDropDown
            app.PleaseSelectDropDown = uidropdown(app.Panel);
            app.PleaseSelectDropDown.Items = {'qq', 'luyin', 'test', 'voice'};
            app.PleaseSelectDropDown.ValueChangedFcn = createCallbackFcn(app, @PleaseSelectDropDownValueChanged, true);
            app.PleaseSelectDropDown.BackgroundColor = [0.949 1 0.9882];
            app.PleaseSelectDropDown.Position = [198 24 100 22];
            app.PleaseSelectDropDown.Value = 'luyin';

            % Create Image2
            app.Image2 = uiimage(app.Panel);
            app.Image2.Position = [48 11 35 48];
            app.Image2.ImageSource = '声音.png';

            % Create Panel_4
            app.Panel_4 = uipanel(app.Tab);
            app.Panel_4.AutoResizeChildren = 'off';
            app.Panel_4.TitlePosition = 'centertop';
            app.Panel_4.Title = '原始信号';
            app.Panel_4.BackgroundColor = [0.949 1 0.9882];
            app.Panel_4.Position = [0 0 261 456];

            % Create UIAxes_bar1_1
            app.UIAxes_bar1_1 = uiaxes(app.Panel_4);
            title(app.UIAxes_bar1_1, '时域')
            xlabel(app.UIAxes_bar1_1, 'Time')
            ylabel(app.UIAxes_bar1_1, 'Magnitude')
            zlabel(app.UIAxes_bar1_1, 'Z')
            app.UIAxes_bar1_1.Position = [6 240 252 194];

            % Create UIAxes_bar1_2
            app.UIAxes_bar1_2 = uiaxes(app.Panel_4);
            title(app.UIAxes_bar1_2, '频域')
            xlabel(app.UIAxes_bar1_2, 'Frequency')
            ylabel(app.UIAxes_bar1_2, 'Magnitude')
            zlabel(app.UIAxes_bar1_2, 'Z')
            app.UIAxes_bar1_2.Position = [5 47 252 194];

            % Create Button
            app.Button = uibutton(app.Panel_4, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Tooltip = {'如果你懒得选择，可点击此按钮'; '（适合Dswdler）'};
            app.Button.Position = [82 6 100 26];
            app.Button.Text = '使用默认文件';

            % Create Panel_2
            app.Panel_2 = uipanel(app.Tab);
            app.Panel_2.TitlePosition = 'centertop';
            app.Panel_2.Title = '现场实时录音';
            app.Panel_2.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel_2.Position = [373 464 509 89];

            % Create Image
            app.Image = uiimage(app.Panel_2);
            app.Image.Position = [58 14 43 44];
            app.Image.ImageSource = '语音.png';

            % Create sButton
            app.sButton = uibutton(app.Panel_2, 'push');
            app.sButton.ButtonPushedFcn = createCallbackFcn(app, @sButtonPushed, true);
            app.sButton.BackgroundColor = [0.949 1 0.9882];
            app.sButton.Position = [111 25 65 22];
            app.sButton.Text = '5s';

            % Create sButton_2
            app.sButton_2 = uibutton(app.Panel_2, 'push');
            app.sButton_2.ButtonPushedFcn = createCallbackFcn(app, @sButton_2Pushed, true);
            app.sButton_2.BackgroundColor = [0.949 1 0.9882];
            app.sButton_2.Position = [200 25 66 22];
            app.sButton_2.Text = '10s';

            % Create sButton_3
            app.sButton_3 = uibutton(app.Panel_2, 'push');
            app.sButton_3.ButtonPushedFcn = createCallbackFcn(app, @sButton_3Pushed, true);
            app.sButton_3.BackgroundColor = [0.949 1 0.9882];
            app.sButton_3.Position = [294 25 66 22];
            app.sButton_3.Text = '15s';

            % Create sButton_4
            app.sButton_4 = uibutton(app.Panel_2, 'push');
            app.sButton_4.ButtonPushedFcn = createCallbackFcn(app, @sButton_4Pushed, true);
            app.sButton_4.BackgroundColor = [0.949 1 0.9882];
            app.sButton_4.Position = [391 25 66 22];
            app.sButton_4.Text = '20s';

            % Create Image3
            app.Image3 = uiimage(app.Tab);
            app.Image3.ImageClickedFcn = createCallbackFcn(app, @Image3Clicked, true);
            app.Image3.Tooltip = {'播放当前选择的语音或录音'};
            app.Image3.Position = [932 478 61 55];
            app.Image3.ImageSource = 'ing.png';

            % Create Tab_2
            app.Tab_2 = uitab(app.TabGroup);
            app.Tab_2.Tooltip = {'播放加噪后的语音信号'};
            app.Tab_2.Title = '加入噪声类型';
            app.Tab_2.BackgroundColor = [0.949 1 0.9882];

            % Create Panel_5
            app.Panel_5 = uipanel(app.Tab_2);
            app.Panel_5.TitlePosition = 'centertop';
            app.Panel_5.Title = '噪声信号';
            app.Panel_5.BackgroundColor = [0.949 1 0.9882];
            app.Panel_5.Position = [1 0 261 456];

            % Create UIAxes_bar2_1
            app.UIAxes_bar2_1 = uiaxes(app.Panel_5);
            title(app.UIAxes_bar2_1, '时域')
            xlabel(app.UIAxes_bar2_1, 'Time')
            ylabel(app.UIAxes_bar2_1, 'Magnitude')
            zlabel(app.UIAxes_bar2_1, 'Z')
            app.UIAxes_bar2_1.Position = [5 240 252 194];

            % Create UIAxes_bar2_2
            app.UIAxes_bar2_2 = uiaxes(app.Panel_5);
            title(app.UIAxes_bar2_2, '频域')
            xlabel(app.UIAxes_bar2_2, 'Frequency')
            ylabel(app.UIAxes_bar2_2, 'Magnitude')
            zlabel(app.UIAxes_bar2_2, 'Z')
            app.UIAxes_bar2_2.Position = [4 47 252 194];

            % Create defultButton
            app.defultButton = uibutton(app.Panel_5, 'push');
            app.defultButton.ButtonPushedFcn = createCallbackFcn(app, @defultButtonPushed, true);
            app.defultButton.Tooltip = {'如果你懒得选择，可点击此按钮'; '（适合Dswdler）'};
            app.defultButton.Position = [80 6 100 26];
            app.defultButton.Text = 'defult';

            % Create Panel_6
            app.Panel_6 = uipanel(app.Tab_2);
            app.Panel_6.TitlePosition = 'centertop';
            app.Panel_6.Title = '随机噪声（白噪声）';
            app.Panel_6.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel_6.Position = [97 464 117 90];

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.Panel_6);
            app.ButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroupSelectionChanged, true);
            app.ButtonGroup.BorderType = 'none';
            app.ButtonGroup.BackgroundColor = [0.7294 0.9804 0.949];
            app.ButtonGroup.Position = [9 9 100 48];

            % Create Button_3
            app.Button_3 = uiradiobutton(app.ButtonGroup);
            app.Button_3.Text = '均匀随机噪声';
            app.Button_3.Position = [4 26 94 22];
            app.Button_3.Value = true;

            % Create Button_4
            app.Button_4 = uiradiobutton(app.ButtonGroup);
            app.Button_4.Text = '高斯随机噪声';
            app.Button_4.Position = [4 0 94 22];

            % Create Panel_7
            app.Panel_7 = uipanel(app.Tab_2);
            app.Panel_7.TitlePosition = 'centertop';
            app.Panel_7.Title = '单频噪声（正弦干扰）';
            app.Panel_7.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel_7.Position = [227 464 298 90];

            % Create Label_7
            app.Label_7 = uilabel(app.Panel_7);
            app.Label_7.HorizontalAlignment = 'center';
            app.Label_7.Position = [20 24 53 39];
            app.Label_7.Text = {'频率选择'; '（kHz）'};

            % Create kHzSlider
            app.kHzSlider = uislider(app.Panel_7);
            app.kHzSlider.ValueChangingFcn = createCallbackFcn(app, @kHzSliderValueChanging, true);
            app.kHzSlider.Position = [94 42 174 3];
            app.kHzSlider.Value = 55;

            % Create EditField
            app.EditField = uieditfield(app.Panel_7, 'numeric');
            app.EditField.Position = [20 8 53 16];
            app.EditField.Value = 55;

            % Create NONOISESwitchLabel
            app.NONOISESwitchLabel = uilabel(app.Tab_2);
            app.NONOISESwitchLabel.HorizontalAlignment = 'center';
            app.NONOISESwitchLabel.FontSize = 10;
            app.NONOISESwitchLabel.Position = [17 484 64 22];
            app.NONOISESwitchLabel.Text = 'NO NOISE？';

            % Create NONOISESwitch
            app.NONOISESwitch = uiswitch(app.Tab_2, 'slider');
            app.NONOISESwitch.ValueChangedFcn = createCallbackFcn(app, @NONOISESwitchValueChanged, true);
            app.NONOISESwitch.Tooltip = {'如果不想加入噪声'; '请打开此开关'};
            app.NONOISESwitch.Position = [37 521 24 10];

            % Create Panel_8
            app.Panel_8 = uipanel(app.Tab_2);
            app.Panel_8.TitlePosition = 'centertop';
            app.Panel_8.Title = '多频噪声（正弦干扰）';
            app.Panel_8.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel_8.Position = [538 464 323 90];

            % Create Fre1EditFieldLabel
            app.Fre1EditFieldLabel = uilabel(app.Panel_8);
            app.Fre1EditFieldLabel.HorizontalAlignment = 'right';
            app.Fre1EditFieldLabel.Position = [3 44 30 22];
            app.Fre1EditFieldLabel.Text = 'Fre1';

            % Create Fre1EditField
            app.Fre1EditField = uieditfield(app.Panel_8, 'numeric');
            app.Fre1EditField.BackgroundColor = [0.949 1 0.9882];
            app.Fre1EditField.Position = [37 44 33 22];
            app.Fre1EditField.Value = 10;

            % Create Fre3EditField_2Label
            app.Fre3EditField_2Label = uilabel(app.Panel_8);
            app.Fre3EditField_2Label.HorizontalAlignment = 'right';
            app.Fre3EditField_2Label.Position = [72 44 30 22];
            app.Fre3EditField_2Label.Text = 'Fre3';

            % Create Fre3EditField_2
            app.Fre3EditField_2 = uieditfield(app.Panel_8, 'numeric');
            app.Fre3EditField_2.BackgroundColor = [0.949 1 0.9882];
            app.Fre3EditField_2.Position = [106 44 39 22];
            app.Fre3EditField_2.Value = 1000;

            % Create Fre5EditFieldLabel
            app.Fre5EditFieldLabel = uilabel(app.Panel_8);
            app.Fre5EditFieldLabel.HorizontalAlignment = 'right';
            app.Fre5EditFieldLabel.Position = [144 44 30 22];
            app.Fre5EditFieldLabel.Text = 'Fre5';

            % Create Fre5EditField
            app.Fre5EditField = uieditfield(app.Panel_8, 'numeric');
            app.Fre5EditField.BackgroundColor = [0.949 1 0.9882];
            app.Fre5EditField.Position = [178 44 64 22];
            app.Fre5EditField.Value = 10000;

            % Create Fre2EditField_2Label
            app.Fre2EditField_2Label = uilabel(app.Panel_8);
            app.Fre2EditField_2Label.HorizontalAlignment = 'right';
            app.Fre2EditField_2Label.Position = [3 11 30 22];
            app.Fre2EditField_2Label.Text = 'Fre2';

            % Create Fre2EditField_2
            app.Fre2EditField_2 = uieditfield(app.Panel_8, 'numeric');
            app.Fre2EditField_2.BackgroundColor = [0.949 1 0.9882];
            app.Fre2EditField_2.Position = [37 11 33 22];
            app.Fre2EditField_2.Value = 100;

            % Create Fre4EditFieldLabel
            app.Fre4EditFieldLabel = uilabel(app.Panel_8);
            app.Fre4EditFieldLabel.HorizontalAlignment = 'right';
            app.Fre4EditFieldLabel.Position = [72 11 30 22];
            app.Fre4EditFieldLabel.Text = 'Fre4';

            % Create Fre4EditField
            app.Fre4EditField = uieditfield(app.Panel_8, 'numeric');
            app.Fre4EditField.BackgroundColor = [0.949 1 0.9882];
            app.Fre4EditField.Position = [106 11 38 22];
            app.Fre4EditField.Value = 5000;

            % Create Fre6EditFieldLabel
            app.Fre6EditFieldLabel = uilabel(app.Panel_8);
            app.Fre6EditFieldLabel.HorizontalAlignment = 'right';
            app.Fre6EditFieldLabel.Position = [145 11 30 22];
            app.Fre6EditFieldLabel.Text = 'Fre6';

            % Create Fre6EditField
            app.Fre6EditField = uieditfield(app.Panel_8, 'numeric');
            app.Fre6EditField.BackgroundColor = [0.949 1 0.9882];
            app.Fre6EditField.Position = [179 11 63 22];
            app.Fre6EditField.Value = 30000;

            % Create Button_5
            app.Button_5 = uibutton(app.Panel_8, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.FontName = '华文新魏';
            app.Button_5.FontSize = 16;
            app.Button_5.Position = [262 21 48 27];
            app.Button_5.Text = '合成';

            % Create Image3_2
            app.Image3_2 = uiimage(app.Tab_2);
            app.Image3_2.ImageClickedFcn = createCallbackFcn(app, @Image3_2Clicked, true);
            app.Image3_2.Tooltip = {'播放当前选择的语音或录音'};
            app.Image3_2.Position = [961 482 61 55];
            app.Image3_2.ImageSource = 'ing.png';

            % Create Button_6
            app.Button_6 = uibutton(app.Tab_2, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.FontName = '华文新魏';
            app.Button_6.FontSize = 20;
            app.Button_6.FontWeight = 'bold';
            app.Button_6.Position = [881 482 62 50];
            app.Button_6.Text = {'噪声'; '叠加'};

            % Create Tab_3
            app.Tab_3 = uitab(app.TabGroup);
            app.Tab_3.Title = '滤波器选型';
            app.Tab_3.BackgroundColor = [0.949 1 0.9882];

            % Create Panel_9
            app.Panel_9 = uipanel(app.Tab_3);
            app.Panel_9.TitlePosition = 'centertop';
            app.Panel_9.Title = '滤波器特性';
            app.Panel_9.BackgroundColor = [0.949 1 0.9882];
            app.Panel_9.Position = [1 0 261 456];

            % Create UIAxes_bar3_1
            app.UIAxes_bar3_1 = uiaxes(app.Panel_9);
            title(app.UIAxes_bar3_1, '相对幅值（db）')
            xlabel(app.UIAxes_bar3_1, 'w(π)')
            ylabel(app.UIAxes_bar3_1, 'Magnitude')
            zlabel(app.UIAxes_bar3_1, 'Z')
            app.UIAxes_bar3_1.Position = [5 240 252 194];

            % Create UIAxes_bar3_2
            app.UIAxes_bar3_2 = uiaxes(app.Panel_9);
            title(app.UIAxes_bar3_2, '绝对幅值')
            xlabel(app.UIAxes_bar3_2, 'Frequency')
            ylabel(app.UIAxes_bar3_2, 'Magnitude')
            zlabel(app.UIAxes_bar3_2, 'Z')
            app.UIAxes_bar3_2.Position = [5 47 252 194];

            % Create defultButton_2
            app.defultButton_2 = uibutton(app.Panel_9, 'push');
            app.defultButton_2.ButtonPushedFcn = createCallbackFcn(app, @defultButton_2Pushed, true);
            app.defultButton_2.Tooltip = {'如果你懒得选择，可点击此按钮'; '（适合Dswdler）'};
            app.defultButton_2.Position = [81 6 100 26];
            app.defultButton_2.Text = 'defult';

            % Create FIRPanel
            app.FIRPanel = uipanel(app.Tab_3);
            app.FIRPanel.TitlePosition = 'centertop';
            app.FIRPanel.Title = 'FIR';
            app.FIRPanel.BackgroundColor = [0.7294 0.9804 0.949];
            app.FIRPanel.Position = [318 464 323 90];

            % Create ButtonGroup_4
            app.ButtonGroup_4 = uibuttongroup(app.FIRPanel);
            app.ButtonGroup_4.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroup_4SelectionChanged, true);
            app.ButtonGroup_4.BorderType = 'none';
            app.ButtonGroup_4.BackgroundColor = [0.7294 0.9804 0.949];
            app.ButtonGroup_4.ButtonDownFcn = createCallbackFcn(app, @ButtonGroup_4ButtonDown, true);
            app.ButtonGroup_4.Position = [3 1 311 69];

            % Create Button_15
            app.Button_15 = uiradiobutton(app.ButtonGroup_4);
            app.Button_15.Text = '矩形窗';
            app.Button_15.Position = [16 41 58 22];
            app.Button_15.Value = true;

            % Create Button_16
            app.Button_16 = uiradiobutton(app.ButtonGroup_4);
            app.Button_16.Text = '巴特利特窗';
            app.Button_16.Position = [16 13 82 22];

            % Create Button_17
            app.Button_17 = uiradiobutton(app.ButtonGroup_4);
            app.Button_17.Text = '汉宁窗';
            app.Button_17.Position = [116 41 65 22];

            % Create Button_18
            app.Button_18 = uiradiobutton(app.ButtonGroup_4);
            app.Button_18.Text = '汉明窗';
            app.Button_18.Position = [116 13 65 22];

            % Create Button_19
            app.Button_19 = uiradiobutton(app.ButtonGroup_4);
            app.Button_19.Text = '布莱克曼窗';
            app.Button_19.Position = [203 41 82 22];

            % Create Button_20
            app.Button_20 = uiradiobutton(app.ButtonGroup_4);
            app.Button_20.Text = '凯塞窗';
            app.Button_20.Position = [203 13 65 22];

            % Create IIRPanel
            app.IIRPanel = uipanel(app.Tab_3);
            app.IIRPanel.TitlePosition = 'centertop';
            app.IIRPanel.Title = 'IIR';
            app.IIRPanel.BackgroundColor = [0.7294 0.9804 0.949];
            app.IIRPanel.Position = [148 463 152 90];

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.IIRPanel);
            app.ButtonGroup_2.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroup_2SelectionChanged, true);
            app.ButtonGroup_2.BorderType = 'none';
            app.ButtonGroup_2.BackgroundColor = [0.7294 0.9804 0.949];
            app.ButtonGroup_2.Position = [9 11 130 48];

            % Create Button_9
            app.Button_9 = uiradiobutton(app.ButtonGroup_2);
            app.Button_9.Text = '脉冲响应不变变换法';
            app.Button_9.Position = [4 26 130 22];
            app.Button_9.Value = true;

            % Create Button_10
            app.Button_10 = uiradiobutton(app.ButtonGroup_2);
            app.Button_10.Text = '双线性变换法';
            app.Button_10.Position = [4 0 94 22];

            % Create Button_7
            app.Button_7 = uibutton(app.Tab_3, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.FontName = '华文新魏';
            app.Button_7.FontSize = 20;
            app.Button_7.Position = [847 485 55 50];
            app.Button_7.Text = {'开始'; '滤波'};

            % Create LPFHzLabel
            app.LPFHzLabel = uilabel(app.Tab_3);
            app.LPFHzLabel.HorizontalAlignment = 'center';
            app.LPFHzLabel.FontName = '隶书';
            app.LPFHzLabel.FontSize = 15;
            app.LPFHzLabel.Position = [16 532 118 22];
            app.LPFHzLabel.Text = 'LPF通带截频(Hz)';

            % Create LPFHzEditField
            app.LPFHzEditField = uieditfield(app.Tab_3, 'numeric');
            app.LPFHzEditField.Position = [15 514 119 22];
            app.LPFHzEditField.Value = 1000;

            % Create Panel_10
            app.Panel_10 = uipanel(app.Tab_3);
            app.Panel_10.TitlePosition = 'centertop';
            app.Panel_10.Title = '小波变换';
            app.Panel_10.BackgroundColor = [0.7294 0.9804 0.949];
            app.Panel_10.Position = [655 464 152 90];

            % Create ButtonGroup_5
            app.ButtonGroup_5 = uibuttongroup(app.Panel_10);
            app.ButtonGroup_5.BorderType = 'none';
            app.ButtonGroup_5.BackgroundColor = [0.7294 0.9804 0.949];
            app.ButtonGroup_5.Position = [9 9 100 48];

            % Create Button_8
            app.Button_8 = uibutton(app.Panel_10, 'push');
            app.Button_8.BackgroundColor = [0.8627 0.9804 0.9804];
            app.Button_8.Tooltip = {'如果你懒得选择，可点击此按钮'; '（适合Dswdler）'};
            app.Button_8.Position = [25 21 100 26];
            app.Button_8.Text = '试验中';

            % Create Image4
            app.Image4 = uiimage(app.Tab_3);
            app.Image4.ImageClickedFcn = createCallbackFcn(app, @Image4Clicked, true);
            app.Image4.Position = [942 468 61 82];
            app.Image4.ImageSource = '播放.png';

            % Create LPFHzLabel_2
            app.LPFHzLabel_2 = uilabel(app.Tab_3);
            app.LPFHzLabel_2.HorizontalAlignment = 'center';
            app.LPFHzLabel_2.FontName = '隶书';
            app.LPFHzLabel_2.FontSize = 15;
            app.LPFHzLabel_2.Position = [16 485 118 22];
            app.LPFHzLabel_2.Text = 'LPF阻带截频(Hz)';

            % Create LPFHzEditField_2
            app.LPFHzEditField_2 = uieditfield(app.Tab_3, 'numeric');
            app.LPFHzEditField_2.Position = [15 467 119 22];
            app.LPFHzEditField_2.Value = 2000;

            % Create Panel_3
            app.Panel_3 = uipanel(app.VoiceSignalProcessingUIFigure);
            app.Panel_3.BackgroundColor = [1 1 1];
            app.Panel_3.Position = [262 47 786 456];

            % Create UIAxes_win1
            app.UIAxes_win1 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win1, 'Time')
            ylabel(app.UIAxes_win1, 'Magnitude')
            zlabel(app.UIAxes_win1, 'Z')
            app.UIAxes_win1.Position = [25 245 255 202];

            % Create UIAxes_win2
            app.UIAxes_win2 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win2, 'Frequency')
            ylabel(app.UIAxes_win2, 'Magnitude')
            zlabel(app.UIAxes_win2, 'Z')
            app.UIAxes_win2.Position = [25 44 255 202];

            % Create UIAxes_win3
            app.UIAxes_win3 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win3, 'Time')
            ylabel(app.UIAxes_win3, 'Magnitude')
            zlabel(app.UIAxes_win3, 'Z')
            app.UIAxes_win3.Position = [281 245 255 202];

            % Create UIAxes_win4
            app.UIAxes_win4 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win4, 'Frequency')
            ylabel(app.UIAxes_win4, 'Magnitude')
            zlabel(app.UIAxes_win4, 'Z')
            app.UIAxes_win4.Position = [277 44 255 202];

            % Create UIAxes_win5
            app.UIAxes_win5 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win5, 'Time')
            ylabel(app.UIAxes_win5, 'Magnitude')
            zlabel(app.UIAxes_win5, 'Z')
            app.UIAxes_win5.Position = [531 245 255 202];

            % Create UIAxes_win6
            app.UIAxes_win6 = uiaxes(app.Panel_3);
            xlabel(app.UIAxes_win6, 'Frequency')
            ylabel(app.UIAxes_win6, 'Magnitude')
            zlabel(app.UIAxes_win6, 'Z')
            app.UIAxes_win6.Position = [531 44 255 202];

            % Create Label_6
            app.Label_6 = uilabel(app.Panel_3);
            app.Label_6.BackgroundColor = [0.9412 1 0.9922];
            app.Label_6.FontName = '隶书';
            app.Label_6.FontSize = 18;
            app.Label_6.FontColor = [0.1412 0.651 0.651];
            app.Label_6.Position = [633 13 77 22];
            app.Label_6.Text = '滤波信号';

            % Create Label_5
            app.Label_5 = uilabel(app.Panel_3);
            app.Label_5.BackgroundColor = [0.9412 1 0.9922];
            app.Label_5.FontName = '隶书';
            app.Label_5.FontSize = 18;
            app.Label_5.FontColor = [0.1412 0.651 0.651];
            app.Label_5.Position = [379 13 77 22];
            app.Label_5.Text = '加噪信号';

            % Create Label_2
            app.Label_2 = uilabel(app.Panel_3);
            app.Label_2.BackgroundColor = [0.9412 1 0.9922];
            app.Label_2.FontName = '隶书';
            app.Label_2.FontSize = 18;
            app.Label_2.FontColor = [0.1412 0.651 0.651];
            app.Label_2.Position = [125 13 77 22];
            app.Label_2.Text = '原始信号';

            % Create Label_3
            app.Label_3 = uilabel(app.Panel_3);
            app.Label_3.FontName = '华文楷体';
            app.Label_3.FontSize = 16;
            app.Label_3.FontColor = [0.302 0.7451 0.9333];
            app.Label_3.Position = [3 321 25 62];
            app.Label_3.Text = {'时'; ''; '域'};

            % Create Label_4
            app.Label_4 = uilabel(app.Panel_3);
            app.Label_4.FontName = '华文楷体';
            app.Label_4.FontSize = 16;
            app.Label_4.FontColor = [0.302 0.7451 0.9333];
            app.Label_4.Position = [3 120 25 62];
            app.Label_4.Text = {'频'; ''; '域'};

            % Show the figure after all components are created
            app.VoiceSignalProcessingUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = demo

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.VoiceSignalProcessingUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.VoiceSignalProcessingUIFigure)
        end
    end
end

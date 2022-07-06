function[S] = DC20220627_initSettings_final(S)
PsychDefaultSetup(2);

dir_files = "C:\";

moviename = dir(char(dir_files + "Psychtoolbox\videos"));
moviename = moviename(1:end);
moviename = '*.mp4';

 rand('seed',sum(100*clock));
 
 if nargin < 2 || isempty(windowrect)
     
    windowrect = [];
 end

 KbReleaseWait;
 
screenid = max(Screen('Screens'));

try
 
win = Screen('OpenWindow', screenid, 0, windowrect);

% [movie movieduration fps] = Screen('OpenMovie', win,'C:/toolbox/Psychtoolbox/videos/test.mp4' );

% [ moviePtr (9, 30, 1920 , 1060)]=Screen ['OpenMovie', win,('C:/toolbox/Psychtoolbox/videos/test.mp4' ,[ 'async=0'], [' preloadSecs=1']); 
Screen ['OpenMovie', win,(moviename  ,[ 'async=0'], [' preloadSecs=1']);

framecount = 9 * 30;

Screen('PlayMovie',movie, 1, 0, 0);

while ~KbCheck

[movietexture pts] = Screen('GetMovieImage', win, movie, 1);

if tex<=0

      break;
    end

Screnn('TextSize', win, tsize);

Screen('Flip', win);
        
        % Release texture:
        Screen('Close', tex);
end
    
    % Stop playback:
    Screen('PlayMovie', movie, 0);
    
    % Close movie:
    Screen('CloseMovie', movie);
    
    % Close Screen, we're done:
    sca;
    
catch 
    sca;
    psychrethrow(psychlasterror);
end

return


 
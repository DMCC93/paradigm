% function [S] = SimpleMovieDemo(moviename, windowrect)
function [A] = testupload(windowrect)
% Check if Psychtoolbox is properly installed:



movienames = dir(fullfile([PsychtoolboxRoot 'videos\happy\'], '*.mp4'));

AssertOpenGL;


if nargin < 2 || isempty(windowrect)
    windowrect = [];
end

% Wait until user releases keys on keyboard:
KbReleaseWait;

% Select screen for display of movie:
screenid = max(Screen('Screens'));

try
    % Open 'windowrect' sized window on screen, with black [0] background color:
    win = Screen('OpenWindow', screenid, 0, windowrect);

    for m=1:length(movienames)
    
       
            moviename = [PsychtoolboxRoot 'videos\happy\' movienames(m).name];

    
    % Open movie file:
    movie = Screen('OpenMovie', win, moviename);
    
    % Start playback engine:
    Screen('PlayMovie', movie, 1);
    
    % Playback loop: Runs until end of movie or keypress:
    while ~KbCheck
        % Wait for next movie frame, retrieve texture handle to it
        tex = Screen('GetMovieImage', win, movie);
        
        % Valid texture returned? A negative value means end of movie reached:
        if tex<=0
            % We're done, break out of loop:
            break;
        end
        
        % Draw the new texture immediately to screen:
        Screen('DrawTexture', win, tex);
        
        % Update display:
        Screen('Flip', win);
        
        % Release texture:
        Screen('Close', tex);
    end
    end
    
    % Stop playback:
    Screen('PlayMovie', movie, 0);
    
    % Close movie:
    Screen('CloseMovie', movie);
    
    % Close Screen, we're done:
    sca; 

catch %#ok<CTCH>
    sca;
    psychrethrow(psychlasterror);
end

return

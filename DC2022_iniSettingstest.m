function [s]= DC2022_iniSettings (s)
%     psychDefaultSetup(2);
    rand('seed',sum(100*clock));
    Screen('Preference', 'SkipSyncTests', 1);
    screens= Screen('Screens',2);
    S.screenNumber= max(screens);
    S.white=WhiteIndex(S.screenNumber);
    S.black=BlackIndex(S.screenNumber);
    S.grey= white/2;
%     [S.window,S.windowRect]= PsychImaging('OpenWindow',S.screenNumber,S.blaPck);
%     [S.screenXpixels, S.screenYpixels]= Screen('WindowSize', S.window);
%     S.ifi= Screen('GetFlipInterval',S.window); [S.xCenter, S.yCenter]= RectCenter(S.windowRect);
%     Screen('BlendFunction', S.window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
%     S.frameRate= Screen('FrameRate',S.window);
%     S.vbl= Screen('Flip',S.window);
    S.waitframes= 1;
    topPriorityLevel= MaxPriority(window);
    Priority(topPriorityLevel);
    
    
%      Basic Settings

    S.NrTrials= 90;
    numberInstructions= 9;
    S.instructionTime= 0.9;
    S.fixationTime= 0.8;
    S.imageryTime= 0.9;
    S.restTime= 0.8;
%     S.actionTime= 1;  

    
                                               %     Import Textures
  
%  neutralface= read('C:\toolbox\Psychtoolbox\videos\neutro\neutral_movie.mp4');
 


  testupload;
    morphing_sad=uploadSad;
    morphing_neutro=uploadNeutro;



   
                     %    Setup Textures 
   
    S.Textures= [];
    S.Textures(1)= Screen('MakeTexture',S.window,Faces);
    
                     %     Design Image Rect (HalfScreen (474x540p))
                     
    S.pixelsY= S.screenYpixels/2;
    S.pixelsX= S.pixelsY-66;
    S.textureRect= CenterRectOnPointd([0 0 S.pixelsX S.pixelsY ],S.xCenter,S.yCenter-40);  
    movie Size = [474 540 3];
%     6.085x6.879 cm; 5.8ºx6.6º;

%                                Setup Cross Fixation

    Screen('TextFont', S.window, 'Courier New');
    Screen('TextSize', S.window, 48);
    xCoords= [-S.screenXpixels/15 S.screenXpixels/15 0 0];
    yCoords= [0 0 -S.screenXpixels/15 S.screenXpixels/15];
    S.allCoords= [xCoords; yCoords];
    S.crossWidthPix = 4;
    
%                               Randomise Instructions
    
    numberConditions= S.NrTrials/numberInstructions;
    matBase= repmat(1:2,1,numberConditions);
    
%                             Open 'io64' ports for TRIGGER

  S.ioObj= io64();
    S.status= io64(S.ioObj);
    if(S.status ~= 0)
        disp('inp/outp installation failed!')
    end
    S.address= hex2dec('DFE8');
    S.neutralstrangerTrigger= 131;
    S.neutralsibligsTrigger= 132;
    S.sadstrangerTrigger= 133;
    S.sadsiblingsTrigger= 134;
    S.happystrangerTrigger= 135;
    S.happysiblingsTrigger= 136;
    S.fixationTrigger= 44;
    S.imageryTrigger= 60;
    S.restTrigger= 73;
    S.runEndTrigger= 90;
    
      S.dataMat= nan(18,S.NrTrials);
end
    
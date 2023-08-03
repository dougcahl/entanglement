%% CSHS game, best classical vs. QM with entanglement
clear
Ni = 10^4; % number of iterations

cshs_game           = nan(Ni,1);
cshs_game_qm        = nan(Ni,1);
for i = 1:Ni
    
    % random 0,1 for both bits
    x = randi(2) - 1;
    y = randi(2) - 1;

    % classical best method
    A = 0;
    B = 0;
    cshs_game(i) = xor(A,B) == and(x,y);

    % Quantum (now we have the extra qbit to measure along)
    r = rand();
    if x == 0
        Ap = (1\sqrt(2))^2; % 50% chance of +/- for 1/sqrt(2)(|++> + |-->)
        if Ap > r
            Aq = 1;
        else
            Aq = 0;
        end
    else % x == 1
        Ap = cosd(45)^2; % 50% chance of +/- at off angle but now since it's entangled it will slam this bit to the angle
        if Ap > r
            Aq = 1;
        else
            Aq = 0;
        end
    end

    % now since it's entangled it will slam this bit to the angle it was
    % measured at
    if x == 0 && Aq == 0
        Ath = 0;
    elseif x == 0 && Aq == 1
        Ath = 90;
    elseif x == 1 && Aq == 0
        Ath = 45;
    elseif x == 1 && Aq == 1
        Ath = -45;
    end

    r = rand();
    if y == 0 % measure along +22.5
        Bp = cosd(22.5 - Ath)^2;  
        if Bp > r
            Bq = 0;
        else
            Bq = 1;
        end
    else % y == 1 measure along -22.5     
            Bp = cosd(-22.5 - Ath)^2;  
            if Bp > r
                Bq = 0;
            else
                Bq = 1;
            end
    end
    cshs_game_qm(i) = xor(Aq,Bq) == and(x,y);
    
end
disp(['winning percentage classical: ' num2str(round(100*mean(cshs_game(:)),1)) ' %'])
disp(['winning percentage quantum: '   num2str(round(100*mean(cshs_game_qm(:)),1)) ' %'])

%% CSHS game, best classical vs. QM with entanglement + all 16 classical methods
% Douglas Cahl 2023
%

clear
Ni = 10^4; % number of iterations

cshs_game           = nan(Ni,1);
cshs_game_qm        = nan(Ni,1);
cshs_game_methods   = nan(Ni,16);

for i = 1:Ni
 
    % random 0,1 for both bits
    x = randi(2) - 1;
    y = randi(2) - 1;
    % classical best method
    A = 0;
    B = 0;
    cshs_game(i) = xor(A,B) == and(x,y);

    % method 1
    A = x;
    B = y;
    cshs_game_methods(i,1) = xor(A,B) == and(x,y);
    % method 2
    A = ~x;
    B = y;
    cshs_game_methods(i,2) = xor(A,B) == and(x,y);
    % method 3
    A = x;
    B = ~y;
    cshs_game_methods(i,3) = xor(A,B) == and(x,y);
    % method 4
    A = ~x;
    B = ~y;
    cshs_game_methods(i,4) = xor(A,B) == and(x,y);

    % method 5
    A = 0;
    B = y;
    cshs_game_methods(i,5) = xor(A,B) == and(x,y);
    % method 6
    A = 0;
    B = ~y;
    cshs_game_methods(i,6) = xor(A,B) == and(x,y);
    % method 7
    A = x;
    B = 0;
    cshs_game_methods(i,7) = xor(A,B) == and(x,y);
    % method 8
    A = ~x;
    B = 0;
    cshs_game_methods(i,8) = xor(A,B) == and(x,y);

    % method 9
    A = 1;
    B = y;
    cshs_game_methods(i,9) = xor(A,B) == and(x,y);
    % method 10
    A = 1;
    B = ~y;
    cshs_game_methods(i,10) = xor(A,B) == and(x,y);
    % method 11
    A = x;
    B = 1;
    cshs_game_methods(i,11) = xor(A,B) == and(x,y);
    % method 12
    A = ~x;
    B = 1;
    cshs_game_methods(i,12) = xor(A,B) == and(x,y);

    % method 13
    A = 0;
    B = 0;
    cshs_game_methods(i,13) = xor(A,B) == and(x,y);
    % method 14
    A = 0;
    B = 1;
    cshs_game_methods(i,14) = xor(A,B) == and(x,y);
    % method 15
    A = 1;
    B = 0;
    cshs_game_methods(i,15) = xor(A,B) == and(x,y);
    % method 16
    A = 1;
    B = 1;
    cshs_game_methods(i,16) = xor(A,B) == and(x,y);
    



    

    % Quantum (now we have the extra qbit to measure along)
    if x == 0
        r = rand();
        Ap = (1\sqrt(2))^2; % 50% chance of +/- for 1/sqrt(2)(|++> + |-->)
        if Ap > r
            Aq = 1;
        else
            Aq = 0;
        end
    else % x == 1
        r = rand();
        Ap = cosd(45)^2; % 50% chance of +/- at off angle but now since it's entangled it will slam this bit to the angle
        if Ap > r
            Aq = 1;
        else
            Aq = 0;
        end
    end

    % now since it's entangled it will slam this bit to the angle it was
    % measured at
    if x == 0 && Aq == 0
        Ath = 0;
    elseif x == 0 && Aq == 1
        Ath = 90;
    elseif x == 1 && Aq == 0
        Ath = 45;
    elseif x == 1 && Aq == 1
        Ath = -45;
    end

    r = rand();
    if y == 0 % measure along +22.5
        Bp = cosd(22.5 - Ath)^2;  
        if Bp > r
            Bq = 0;
        else
            Bq = 1;
        end
    else % y == 1 measure along -22.5     
            Bp = cosd(-22.5 - Ath)^2;  
            if Bp > r
                Bq = 0;
            else
                Bq = 1;
            end
    end
    cshs_game_qm(i) = xor(Aq,Bq) == and(x,y);


                   
    
end
disp(['winning percentage classical: ' num2str(round(100*mean(cshs_game(:)),1)) ' %'])
disp(['winning percentage quantum: '   num2str(round(100*mean(cshs_game_qm(:)),1)) ' %'])

for i = 1:16
    disp(['winning percentage classic method ' ...
        num2str(i) ': '   num2str(round(100*mean(cshs_game_methods(:,i)),1)) ' %'])
end



%% Bell test
% Douglas Cahl 2023
% 

clear

for orientation = 1:3
    % orientation = 1; % horizontal
    % orientation = 2; % vertical
    % orientation = 3; % random



    th = 0:2.5:90;
    S = nan(length(th),length(th),length(th),length(th));
    Sq = nan(length(th),length(th),length(th),length(th));

    i = 0;
    ii = 0;
%     disp('starting...')
    for a = th
%         disp([num2str(round(100*i/length(th)^4,1)) ' %'])
        ii = ii + 1;
        jj = 0;
        for b = th
            jj = jj + 1;
            kk = 0;
            for aa = th
                kk = kk + 1;
                ll = 0;
                for bb = th
                    ll = ll + 1;
                    i = i + 1;

                    if orientation == 3
                        or = randi(2,1);
                    else
                        or = orientation;
                    end

                    % a,b measured from horizontal
                    if or == 1
                        ap = cosd(a).^2; % +1 measurement for horizontal at a
                        bp = cosd(b).^2; % +1 measurement for horizontal at b

                        am = sind(a).^2; % -1 measurement for horizontal at a
                        bm = sind(b).^2; % -1 measurement for horizontal at b

                        aap = cosd(aa).^2; % +1 measurement for horizontal at a
                        bbp = cosd(bb).^2; % +1 measurement for horizontal at b

                        aam = sind(aa).^2; % -1 measurement for horizontal at a
                        bbm = sind(bb).^2; % -1 measurement for horizontal at b
                    end

                    if or == 2
                        ap = sind(a).^2; % +1 measurement for horizontal at a
                        bp = sind(b).^2; % +1 measurement for horizontal at b

                        am = cosd(a).^2; % -1 measurement for horizontal at a
                        bm = cosd(b).^2; % -1 measurement for horizontal at b

                        aap = sind(aa).^2; % +1 measurement for horizontal at a
                        bbp = sind(bb).^2; % +1 measurement for horizontal at b

                        aam = cosd(aa).^2; % -1 measurement for horizontal at a
                        bbm = cosd(bb).^2; % -1 measurement for horizontal at b
                    end

                    % classical Mallus' law
                    Eab   = ap*bp   + am*bm   - ap*bm   - am*bp;
                    Eabb  = ap*bbp  + am*bbm  - ap*bbm  - am*bbp;
                    Eaab  = aap*bp  + aam*bm  - aap*bm  - aam*bp;
                    Eaabb = aap*bbp + aam*bbm - aap*bbm - aam*bbp;

                    % Entanglement, measurement on one slams it to that
                    % angle
                    qab = cosd(a-b).^2 - sind(a-b).^2;
                    qaab = cosd(aa-b).^2 - sind(aa-b).^2;
                    qabb = cosd(a-bb).^2 - sind(a-bb).^2;
                    qaabb = cosd(aa-bb).^2 - sind(aa-bb).^2;

                    S(ii,jj,kk,ll) = Eab - Eabb + Eaab + Eaabb; % classical
                    Sq(ii,jj,kk,ll) = qab - qabb + qaab + qaabb; % QM

                end
            end
        end
    end
%     disp('100 %')
%     disp('calculations complete')
    %

    % Classical
    figure
    subplot(521)
    histogram(S(:))
    title(['Classical:  S max = ' num2str(max(S(:)))])
    ii = find(S==max(S(:)));
    for imax = ii
        [ai,bi,ci,di] = ind2sub(size(S),imax);
        %     disp([th(ai)' th(bi)' th(ci)' th(di)'])
        %     disp([th(ai)'-th(bi)'  th(bi)'-th(ci)'  th(ci)'-th(di)'  th(ai)'-th(di)'])
    end


    subplot(523)
    histogram(abs(th(ai)'-th(bi)'),th)
    xticks(0:22.5:90)
    tt = title('Classical: $\alpha-\beta$');
    tt.Interpreter = 'latex';

    subplot(525)
    histogram(abs(th(bi)'-th(ci)'),th)
    xticks(0:22.5:90)
    tt = title('Classical: $\beta''-\alpha$');
    tt.Interpreter = 'latex';

    subplot(527)
    histogram(abs(th(ci)'-th(di)'),th)
    xticks(0:22.5:90)
    tt = title('Classical: $\alpha''-\beta''$');
    tt.Interpreter = 'latex';

    subplot(529)
    histogram(abs(th(ai)'-th(di)'),th)
    xticks(0:22.5:90)
    tt = title('Classical: $\alpha-\beta''$');
    tt.Interpreter = 'latex';

    % Quantum
    subplot(522)
    histogram(Sq(:))
    title(['Quantum:  S_{QM} max = ' num2str(max(Sq(:)))])
    ii = find(Sq==max(Sq(:)));
    for imax = ii
        [ai,bi,ci,di] = ind2sub(size(Sq),imax);
        %     disp([th(ai)' th(bi)' th(ci)' th(di)'])
        %     disp([th(ai)'-th(bi)'  th(bi)'-th(ci)'  th(ci)'-th(di)'  th(ai)'-th(di)'])
    end

    subplot(524)
    histogram(abs(th(ai)'-th(bi)'),th)
    xticks(0:22.5:90)
    tt = title('QM: $\alpha-\beta$');
    tt.Interpreter = 'latex';

    subplot(526)
    histogram(abs(th(bi)'-th(ci)'),th)
    xticks(0:22.5:90)
    tt = title('QM: $\beta''-\alpha$');
    tt.Interpreter = 'latex';

    subplot(528)
    histogram(abs(th(ci)'-th(di)'),th)
    xticks(0:22.5:90)
    tt = title('QM: $\alpha''-\beta''$');
    tt.Interpreter = 'latex';

    subplot(5,2,10)
    histogram(abs(th(ai)'-th(di)'),th)
    xticks(0:22.5:90)
    tt = title('QM: $\alpha-\beta''$');
    tt.Interpreter = 'latex';


    subplot(521)
    if orientation == 1
        text(1,1.4,'Horizontal','units','normalized')
    elseif orientation == 2
        text(1,1.4,'Vertical','units','normalized')
    elseif orientation == 3
        text(1,1.4,'Random','units','normalized')
    end

end

%%
clear
th = 0:2.5:90;
dth = nan(length(th), length(th));
E = nan(length(th), length(th));
Eq = nan(length(th), length(th));

ii = 0;
for a = th
    ii = ii + 1;
    jj = 0;
    for b = th
        jj = jj + 1;
        i = i + 1;

        % particle pair at random orientations
        %         or = randi(2,1);
        or = 1; % horizontal
        %         or = 2; % vertical

        % a,b measured from horizontal
        if or == 1
            ap = cosd(a).^2; % +1 measurement for horizontal at a
            bp = cosd(b).^2; % +1 measurement for horizontal at b

            am = sind(a).^2; % -1 measurement for horizontal at a
            bm = sind(b).^2; % -1 measurement for horizontal at b
        end

        if or == 2
            ap = sind(a).^2; % +1 measurement for horizontal at a
            bp = sind(b).^2; % +1 measurement for horizontal at b

            am = cosd(a).^2; % -1 measurement for horizontal at a
            bm = cosd(b).^2; % -1 measurement for horizontal at b
        end

        Eab   = ap*bp   + am*bm   - ap*bm   - am*bp;

        dth(ii,jj) = a-b;
        E(ii,jj) = Eab;
        Eq(ii,jj) = cosd(a-b).^2 - sind(a-b).^2;

    end
end
% disp(1)
%

figure
subplot(221)
plot(dth(:),E(:),'k.')
grid on
% xlabel('\theta')
tt = title('Classical $E(\vec{a},\vec{b})$');
tt.Interpreter ='latex';

subplot(222)
plot(dth(:),Eq(:),'k.')
grid on
xlabel('\theta')
tt = title('Quantum $E(\vec{a},\vec{b})$');
tt.Interpreter ='latex';

subplot(223)
pcolor(th,th,E)
shading interp
colorbar
xlabel('\theta_\alpha')
ylabel('\theta_\beta')
title('Classical')

subplot(224)
pcolor(th,th,Eq)
shading interp
colorbar
xlabel('\theta_\alpha')
ylabel('\theta_\beta')
title('Quantum')




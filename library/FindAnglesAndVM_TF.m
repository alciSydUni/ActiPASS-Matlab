%%% ---> put signalZ in the library folder before running
function FindAnglesAndVM_TF(SF, Fc)
   %%% -> sample data -> create new one
   t=linspace(0,10,SF*10);
   signalX=sin(2*pi*1*t);
   signalY=0.5*sin(2*pi*0.5*t);
   %%% -> signalZ -> skip next step and import signal.csv
   %signalZ=0.3*randn(size(t));
   signalZ=csvread('signalZ.csv');
   %%% -> signalX + signalY + signalZ -> combime col arrays
   signal=[signalX(:),signalY(:),signalZ(:)];
   %%% -> run FindAnglesAndVM
   [V,AccFilt,SVM,normAcc] = FindAnglesAndVM(signal,SF,Fc); 
   %%% -> plot results
   figure('Name', 'Matlab','Position',[100,100,900,400]);
   labels={'Inclination (X)', 'Roll (Z)', 'Pitch (Y)'};
   for i=1:3
      plot(t, rad2deg(V(:,i)),'DisplayName', labels{i}); hold on;
   end
   title('Angles against time');
   xlabel('Time (s)');
   ylabel('Angle (deg)');
   legend();
   grid on;
   %%% -> extra print values
   fprintf('Extra print values:\n');
   fprintf('Length of t: %d\n',length(t));
   fprintf('First 10 values of t:\n'); fprintf('%g\t', t(1:10)); fprintf('\n');
   fprintf('Length of V: %d Shape of V: [%d %d]',length(V),size(V)); fprintf('\n');
   fprintf('Length of AccFilt: %d Shape of AccFilt [%d %d]', length(AccFilt), size(AccFilt)); fprintf('\n');
   fprintf('Length of SVM: %d Shape of SVM [%d %d]', length(SVM), size(SVM)); fprintf('\n');
   fprintf('Length of normAcc: %d Shape of normAcc [%d %d]', length(normAcc), size(normAcc)); fprintf('\n');
end

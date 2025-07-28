import matlab.engine

eng = matlab.engine.start_matlab()
eng.addpath('/Users/alpopp/Documents/Work/Al/2025 USYD/VS/ActiPASS - Matlab/ActiPASS/library')
eng.FindAnglesAndVM_TF(25, 2, nargout=0)

eng.quit()


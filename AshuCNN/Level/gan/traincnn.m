% function cnn=traincnn(cnn,image,label, no_of_epochs, batch_size, quantType, erMult)

function cnn=traincnn(cnn,image,label, no_of_epochs, batch_size, optimizer, train_d)
erMult = 1;
quantType = 'none';
cnn.loss_array=[];


%only images either grayvalues or RGB
if size(image,4) > 1 %RGB
    n_input = size(image,4);
    dim_image = 4; %example index
else
    n_input = size(image,3);
    dim_image = 3;
end
no_of_batches = n_input/batch_size; %should be integer
if rem(n_input, batch_size) ~=0
    error('no_of_batches should be integer');
end

if cnn.loss_func == 'auto'
   cnn.loss_func = 'quad'; % quadtratic
   if cnn.layers{cnn.no_of_layers}.act_func == 'sigm'
       cnn.loss_func = 'cros' ; % cross_entropy';
%       cnn.loss_func = 'quad' ; % cross_entropy';       
   elseif cnn.layers{cnn.no_of_layers}.act_func == 'tanh'
       cnn.loss_func = 'quad';
   
       
   end
elseif strcmp(cnn.loss_func, 'cros') == 1 & strcmp(cnn.layers{cnn.no_of_layers}.act_func, 'sigm') == 0
    display 'Not tested for gradient checking for cross entropy cost function other than sigm layer'
end

cnn.CalcLastLayerActDerivative =1;
if cnn.loss_func == 'cros' 
    if cnn.layers{cnn.no_of_layers}.act_func == 'soft'
        cnn.CalcLastLayerActDerivative = 0;
    elseif cnn.layers{cnn.no_of_layers}.act_func == 'sigm'
        cnn.CalcLastLayerActDerivative = 0;
    end    
end

if cnn.layers{cnn.no_of_layers}.act_func == 'none'
    cnn.CalcLastLayerActDerivative = 0;
end

% display 'training started...'

for i = 1 : no_of_epochs    
    for j = 1 : batch_size : n_input
        tStart = tic;
        if dim_image == 4
            batch = image(:,:,:,j:j+batch_size-1);
        else
            batch = image(:,:,j:j+batch_size-1);
        end
        label_in = label(:,j:j+batch_size-1);
        cnn = ffcnn(cnn, batch, quantType);
        cnn = bpcnn(cnn,label_in, erMult);
        if train_d
            switch optimizer
                case 'gd'
                    cnn = gradientdescentcnn(cnn);
                case 'mom'
                    
                    cnn = momentumcnn(cnn,0.9);
                case 'adam'
                    cnn = Adamcnn(cnn,0.9, 0.999, 10^(-8), i);
                case 'rms'
                    cnn = RMSpropcnn(cnn,0.9,10^(-10));
                otherwise
                    error 'not implemented yet'
            end     
        else
            fprintf(2,'discriminator not trained\n\n')
        end
        cnn.loss_array = [cnn.loss_array cnn.loss];        
        tElapsed = toc(tStart);
        tTotoal_left =  ((n_input-j-1)/batch_size + (no_of_epochs-i)*(n_input/batch_size))*tElapsed;
%         display([num2str(floor(tTotoal_left/60)),' min/',num2str(round(tTotoal_left - floor(tTotoal_left/60)*60)),' s left for training....'])
    end
end
% subplot(2,2,1)
% plot(cnn.loss_array)
% title('Discriminatot Loss')
%drawnow;
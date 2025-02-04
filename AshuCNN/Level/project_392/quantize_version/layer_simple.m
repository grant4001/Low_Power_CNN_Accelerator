
global bit_scale;
dataPath                = './MNIST/';
batch_size              = 1;
n_shrinkData_train      = 1;
n_shrinkData_test       = 1;
n_epoch                 = 100;
input_enlarge           = 8; % Increase value of input(image)
bit_scale               = 0;           % (bit_scale-2) of integer bit
learning_rate           = 0.01 * 2^bit_scale;  % 0.01
erMult                  = 5;
optimizer               = 'mom';

%==========================================================================

% *************************************************************************

%=========================
% //reading train image //
%=========================
train_img(:,:,1) = [0 1 1 1 0 ; 
                    0 1 0 1 0 ; 
                    0 1 0 1 0 ;
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,2) = [0 0 1 0 0 ; 
                    0 0 1 0 0 ; 
                    0 0 1 0 0 ;
                    0 0 1 0 0 ; 
                    0 0 1 0 0 ];
train_img(:,:,3) = [0 1 1 1 0 ; 
                    0 0 0 1 0 ; 
                    0 1 1 1 0 ;
                    0 1 0 0 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,4) = [0 1 1 1 0 ; 
                    0 0 0 1 0 ; 
                    0 1 1 1 0 ;
                    0 0 0 1 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,5) = [0 1 0 1 0 ; 
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ;
                    0 0 0 1 0 ; 
                    0 0 0 1 0 ];
train_img(:,:,6) = [0 1 1 1 0 ; 
                    0 1 0 0 0 ; 
                    0 1 1 1 0 ;
                    0 0 0 1 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,7) = [0 1 1 1 0 ; 
                    0 1 0 0 0 ; 
                    0 1 1 1 0 ;
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,8) = [0 1 1 1 0 ; 
                    0 0 0 1 0 ; 
                    0 0 0 1 0 ;
                    0 0 0 1 0 ; 
                    0 0 0 1 0 ];
train_img(:,:,9) = [0 1 1 1 0 ; 
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ;
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ];
train_img(:,:,10) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     0 1 1 1 0 ];

train_img(:,:,11) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 0 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,12) = [0 0 1 0 0 ; 
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ;
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ];
train_img(:,:,13) = [0 1 1 1 0 ; 
                     1 0 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,14) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 1 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,15) = [0 1 0 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 0 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ];
train_img(:,:,16) = [0 1 1 1 0 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 1 1 0 ];
train_img(:,:,17) = [0 1 1 0 0 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,18) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ];
train_img(:,:,19) = [0 1 1 1 0 ; 
                     0 1 1 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,20) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 1 1 0 ];

train_img(:,:,21) = [1 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 0 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,22) = [0 0 1 0 1 ; 
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ;
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ];
train_img(:,:,23) = [0 1 1 1 0 ; 
                     1 0 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 0 0 ; 
                     0 1 1 1 1 ];
train_img(:,:,24) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     1 1 1 1 0 ;
                     0 0 1 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,25) = [0 0 0 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ];
train_img(:,:,26) = [0 1 1 1 0 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 1 1 1 0 ];
train_img(:,:,27) = [0 1 1 1 1 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,28) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 0 0 ];
train_img(:,:,29) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 0 1 1 0 ];
train_img(:,:,30) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 1 1 1 0 ];
train_img(:,:,31) = [0 1 1 0 0 ; 
                     0 1 0 1 0 ; 
                     0 1 0 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,32) = [0 0 0 0 0 ; 
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ;
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ];
train_img(:,:,33) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 0 0 ; 
                     0 0 1 1 1 ];
train_img(:,:,34) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     1 1 1 1 0 ;
                     0 0 1 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,35) = [0 1 0 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 1 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ];
train_img(:,:,36) = [0 1 1 1 0 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 1 0 1 0 ];
train_img(:,:,37) = [0 1 0 1 1 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,38) = [1 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 0 0 ];
train_img(:,:,39) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 0 0 ];
train_img(:,:,40) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 0 1 1 0 ];
                 
train_img(:,:,41) = [0 1 1 0 0 ; 
                     0 1 0 1 0 ; 
                     0 1 0 0 1 ;
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,42) = [0 0 0 1 0 ; 
                     0 0 1 0 0 ; 
                     0 0 1 0 0 ;
                     0 0 1 0 0 ; 
                     0 0 1 1 0 ];
train_img(:,:,43) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 0 0 ; 
                     0 1 1 0 1 ];
train_img(:,:,44) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     1 1 1 1 0 ;
                     0 0 1 1 0 ; 
                     0 1 1 0 0 ];
train_img(:,:,45) = [0 0 0 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 1 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ];
train_img(:,:,46) = [0 1 1 1 1 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 1 0 1 0 ];
train_img(:,:,47) = [0 1 0 1 1 ; 
                     0 1 0 0 0 ; 
                     0 1 1 1 0 ;
                     1 1 0 1 0 ; 
                     0 1 1 1 0 ];
train_img(:,:,48) = [0 1 1 1 0 ; 
                     0 0 0 1 0 ; 
                     0 0 0 1 0 ;
                     0 0 0 1 0 ; 
                     0 0 0 1 1 ];
train_img(:,:,49) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 1 0 1 0 ; 
                     0 1 1 0 1 ];
train_img(:,:,50) = [0 1 1 1 0 ; 
                     0 1 0 1 0 ; 
                     0 1 1 1 0 ;
                     0 0 0 1 0 ; 
                     1 0 1 1 0 ]; 

                 
train_label = [ 1 0 0 0 0 0 0 0 0 0; 
                0 1 0 0 0 0 0 0 0 0; 
                0 0 1 0 0 0 0 0 0 0; 
                0 0 0 1 0 0 0 0 0 0; 
                0 0 0 0 1 0 0 0 0 0; 
                0 0 0 0 0 1 0 0 0 0; 
                0 0 0 0 0 0 1 0 0 0; 
                0 0 0 0 0 0 0 1 0 0; 
                0 0 0 0 0 0 0 0 1 0; 
                0 0 0 0 0 0 0 0 0 1; 
                1 0 0 0 0 0 0 0 0 0; 
                0 1 0 0 0 0 0 0 0 0; 
                0 0 1 0 0 0 0 0 0 0; 
                0 0 0 1 0 0 0 0 0 0; 
                0 0 0 0 1 0 0 0 0 0; 
                0 0 0 0 0 1 0 0 0 0; 
                0 0 0 0 0 0 1 0 0 0; 
                0 0 0 0 0 0 0 1 0 0; 
                0 0 0 0 0 0 0 0 1 0;
                0 0 0 0 0 0 0 0 0 1;
                1 0 0 0 0 0 0 0 0 0; 
                0 1 0 0 0 0 0 0 0 0; 
                0 0 1 0 0 0 0 0 0 0; 
                0 0 0 1 0 0 0 0 0 0; 
                0 0 0 0 1 0 0 0 0 0; 
                0 0 0 0 0 1 0 0 0 0; 
                0 0 0 0 0 0 1 0 0 0; 
                0 0 0 0 0 0 0 1 0 0; 
                0 0 0 0 0 0 0 0 1 0;
                0 0 0 0 0 0 0 0 0 1;
                1 0 0 0 0 0 0 0 0 0; 
                0 1 0 0 0 0 0 0 0 0; 
                0 0 1 0 0 0 0 0 0 0; 
                0 0 0 1 0 0 0 0 0 0; 
                0 0 0 0 1 0 0 0 0 0; 
                0 0 0 0 0 1 0 0 0 0; 
                0 0 0 0 0 0 1 0 0 0; 
                0 0 0 0 0 0 0 1 0 0; 
                0 0 0 0 0 0 0 0 1 0;
                0 0 0 0 0 0 0 0 0 1;
                1 0 0 0 0 0 0 0 0 0; 
                0 1 0 0 0 0 0 0 0 0; 
                0 0 1 0 0 0 0 0 0 0; 
                0 0 0 1 0 0 0 0 0 0; 
                0 0 0 0 1 0 0 0 0 0; 
                0 0 0 0 0 1 0 0 0 0; 
                0 0 0 0 0 0 1 0 0 0; 
                0 0 0 0 0 0 0 1 0 0; 
                0 0 0 0 0 0 0 0 1 0;
                0 0 0 0 0 0 0 0 0 1]';
            
%========================
% //reading test image //
%========================
test_img(:,:,1) = [0 1 1 1 0 ; 
                   0 1 0 1 0 ; 
                   0 1 0 1 0 ;
                   0 1 0 1 0 ; 
                   0 1 1 1 0 ];
test_img(:,:,2) = [0 0 1 0 0 ; 
                   0 0 1 0 0 ; 
                   0 0 1 0 0 ;
                   0 0 1 0 0 ;
                   0 0 1 0 0 ];
test_img(:,:,3) = [0 1 1 1 0 ; 
                   0 0 0 1 0 ; 
                   0 1 1 1 0 ;
                   0 1 0 0 0 ;  
                   0 1 1 1 0 ];
test_img(:,:,4) = [0 1 1 1 0 ; 
                   0 0 0 1 0 ; 
                   0 1 1 1 0 ;
                   0 0 0 1 0 ; 
                   0 1 1 1 0 ];
test_img(:,:,5) = [0 1 0 1 0 ; 
                   0 1 0 1 0 ; 
                   0 1 1 1 0 ;
                   0 0 0 1 0 ; 
                   0 0 0 1 0 ];
test_img(:,:,6) = [0 1 1 1 0 ; 
                   0 1 0 0 0 ; 
                   0 1 1 1 0 ;
                   0 0 0 1 0 ; 
                   0 1 1 1 0 ];
test_img(:,:,7) = [0 1 1 1 0 ; 
                   0 1 0 0 0 ; 
                   0 1 1 1 0 ;
                   0 1 0 1 0 ; 
                   0 1 1 1 0 ];
test_img(:,:,8) = [0 1 1 1 0 ; 
                   0 0 0 1 0 ; 
                   0 0 0 1 0 ;
                   0 0 0 1 0 ; 
                   0 0 0 1 0 ];
test_img(:,:,9) = [0 1 1 1 0 ; 
                   0 1 0 1 0 ; 
                   0 1 1 1 0 ;
                   0 1 0 1 0 ; 
                   0 1 1 1 0 ];
test_img(:,:,10) = [0 1 1 1 0 ; 
                    0 1 0 1 0 ; 
                    0 1 1 1 0 ;
                    0 0 0 1 0 ; 
                    0 1 1 1 0 ];
                


test_label = [ 1 0 0 0 0 0 0 0 0 0;
               0 1 0 0 0 0 0 0 0 0; 
               0 0 1 0 0 0 0 0 0 0; 
               0 0 0 1 0 0 0 0 0 0; 
               0 0 0 0 1 0 0 0 0 0; 
               0 0 0 0 0 1 0 0 0 0; 
               0 0 0 0 0 0 1 0 0 0; 
               0 0 0 0 0 0 0 1 0 0; 
               0 0 0 0 0 0 0 0 1 0;
               0 0 0 0 0 0 0 0 0 1]';

           
           
h = 5;
w = 5;
%==========================================================================
% Main Function
%***************************************
% initialize cnn
cnn.namaste = 1; 
cnn = initcnn(cnn, batch_size, [h w],learning_rate);
cnn = cnnAddFCLayer(cnn, 20, 'rect');
cnn = cnnAddFCLayer(cnn, 10, 'rect');
display 'training started...Wait for ~200 seconds...'
tic
cnn = traincnn(cnn, 1*train_img, 1*train_label, n_epoch, batch_size, optimizer, 1);
toc
display '...training finished.'
display 'testing started....'
tic
    cnn.layers{1,2}.W = round(cnn.layers{1,2}.W);
    cnn.layers{1,2}.b = round(cnn.layers{1,2}.b);
    cnn.layers{1,3}.W = round(cnn.layers{1,3}.W);
    cnn.layers{1,3}.b = round(cnn.layers{1,3}.b);
    cnn.layers{1,2}.outputs = round(cnn.layers{1,2}.outputs);

err = testcnn(cnn, batch_size,test_img, test_label);
toc
display '... testing finished. To get minimum error, increase no of epochs while training.'
plot(cnn.loss_array)
% imshow(train_img(:,:,1))

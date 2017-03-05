[car_scale_label,car_scale_inst] = libsvmread('E:\Users\matlab\experience\car_scale');
value=[];
train_value=[];
sigmod =200;
for i=1:10
a=randperm(1330);       
trian_inst_rand = car_scale_inst(a(1:800),:);
trian_label_rand=car_scale_label(a(1:800),:);
test_inst_rand = car_scale_inst(a(801:1330),:);
test_label_rand =car_scale_label(a(801:1330 ),:);
train_inst = trian_inst_rand(:,[1:3,5:9,11:11,13:13,16]);
train_label = trian_label_rand(:,:);
test_inst = test_inst_rand(:,[1:3,5:9,11:11,13:13,16]);
test_label = test_label_rand(:,:);  
train_test_inst = trian_inst_rand(:,[1:3,5:9,11:11,13:13,16]);
train_test_label = trian_label_rand(:,:);
% train_inst = car_scale_inst([16:17,18:68],:);                            
% test_inst = car_scale_inst(1:15,:);
% test_label = car_scale_label(1:15,:);
test_model = svmtrain(train_label,train_inst,'-t 0 -c 1 ');
[predict_label,accuracy,dec_values] = svmpredict(test_label,test_inst,test_model);
value=[value accuracy(1,1)];
[predict_train_label,predict_train_accuracy,dec_train_values] = svmpredict(train_test_label,train_test_inst,test_model);
train_value=[train_value predict_train_accuracy(1,1)];
end
for i=1:10
    accuracy_average = mean(value);
    train_accuracy_average = mean(train_value);
end
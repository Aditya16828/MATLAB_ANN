%[x, target] = bodyfat_dataset();
[x, target] = bioReactor();

resMaxP = 1e7;
maxSize = 1;

while (maxSize <= 50)
    [PTrainarr, PValarr, PTestarr, net, tr] = determineHiddenLayerSize(x, target, maxSize);


    maxValue = 1e7;
    maxValueidx = -1;
    
    for i = 1:maxSize
        if(maxValue > PTestarr(i))
            maxValue = PTestarr(i);
            maxValueidx = i;
        end
    end

    if (resMaxP > maxValue)
        resMaxP = maxValue;
        network = net;
    end

    maxSize = maxSize + 1;
end

disp(resMaxP);

y = network(x);

figure, plotperform(tr);
figure, plottrainstate(tr);
figure, plotregression(target,y);

genFunction(network,'myNeuralNetworkFunction');
y = myNeuralNetworkFunction(x);

disp(y);
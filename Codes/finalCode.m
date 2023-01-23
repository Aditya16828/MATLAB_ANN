[x, target] = bodyfat_dataset();

resMaxP = 0;
maxSize = 1;

while (maxSize <= 60)
    [PTrainarr, PValarr, PTestarr, net, tr] = determineHiddenLayerSize(x, target, maxSize);


    maxValue = 0;
    maxValueidx = -1;
    
    for i = 1:maxSize
        if(maxValue < PTestarr(i))
            maxValue = PTestarr(i);
            maxValueidx = i;
        end
    end

    if (resMaxP < maxValue)
        resMaxP = maxValue;
        network = net;
    end

    maxSize = maxSize + 1;
end

disp(resMaxP);

y = network(x);
e = gsubtract(target, y);

figure, plotperform(tr);
figure, plottrainstate(tr);
figure, ploterrhist(e);
figure, plotregression(target,y);

genFunction(network,'myNeuralNetworkFunction');
y = myNeuralNetworkFunction(x);

disp(y);
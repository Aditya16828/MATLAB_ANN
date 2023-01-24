[x, target] = bodyfat_dataset();

resMinP = 1e7;
maxSize = 1;

while (maxSize <= 30)
    [PTrainarr, PValarr, PTestarr, net, tr] = determineHiddenLayerSize(x, target, maxSize);


    minValue = 1e7;
    minValueidx = -1;
    
    for i = 1:maxSize
        if(minValue > PTestarr(i))
            minValue = PTestarr(i);
            minValueidx = i;
        end
    end

    if (resMinP > minValue)
        resMinP = minValue;
        network = net;
    end

    maxSize = maxSize + 1;
end

disp(resMinP);

y = network(x);
e = gsubtract(target, y);

figure, plotperform(tr);
figure, plottrainstate(tr);
figure, ploterrhist(e);
figure, plotregression(target,y);

genFunction(network,'myNeuralNetworkFunction');
y = myNeuralNetworkFunction(x);

disp(y);
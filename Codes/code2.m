[x, y] = bodyfat_dataset();

for i = 1:13
    x(i, :) = (x(i, :)-min(x(i, :)))/(max(x(i, :))-min(x(i, :)));
end

mdl = fitlm(x, y);

function value = shape_coef(x)

%wartosc skuteczna to pierwiastek mocy sredniej
%moc srednia to moc przez liczbe probek
%energia 
    x_sk = sqrt(power2(x));
    x_srb = sum(abs(x))/length(x);
    value = x_sk/x_srb;
end


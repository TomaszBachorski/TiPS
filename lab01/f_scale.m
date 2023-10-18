function y = f_scale(s)
    old_range = max(s) - min(s);
    new_range = 2;
    y = (((s-min(s))*new_range)/old_range)-1; 
end
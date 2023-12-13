function num = bestValue(searchingFor, vector)
%Znajdowanie wartości która najlepiej pasuje w wektorze
%   ajsdghbiasdbjkhbjkasdk

if(isscalar(searchingFor)==true && ismember(searchingFor, vector)==true)
    num=searchingFor;
elseif(isscalar(searchingFor)==true)
    for i=1:length(vector)-1
        if (abs(vector(i)-searchingFor)<=10) %10 granica tolerancji
            num = vector(i);
            break;
        end
    end
else
    foundMatch = 0;
    for i=1:length(vector)-1
        for k=1:length(searchingFor)-1
            if (abs(vector(i)-searchingFor(k))<=10) %10 granica tolerancji
                foundMatch = vector(i);
                break;
            end
        end
        if (foundMatch~=0) 
            break;
        end
    end
    num = foundMatch;
    end
end
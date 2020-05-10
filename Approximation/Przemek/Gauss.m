function [vectorx] = Gauss(A,b)
    % Gauss elimination method

    s1=size(A);
    s2=size(b);

    vectorx=zeros(s1(1),1);
    if(s1(1)~= s2(1)|s2(2)~=1)
        error('Error.Incorect dimensions of the input')
    end
    Augumented=[A,b];
    if(rank(A)<rank(Augumented))
        error('Error.Matrix is inconsistent')
    end
    if(rank(A)<s1(2))
        error('Error.infinitely many solutions')
    end
    for i=1:1:s1(1)
        if(Augumented(i,i)==0)
            %ensuring that the leading element is non 0
          [M,I]=max(Augumented) ;
          if(I(i)>i)
          temp=Augumented(i,:);
          Augumented(i,:)=Augumented(I(i),:);
          Augumented(I(i),:)=temp;
          else
              for j=i+1:1:s1(1)
                  if(Augumented(j,i)~=0)
                      temp=Augumented(i,:);
                    Augumented(i,:)=Augumented(j,:);
                     Augumented(j,:)=temp;
                     break;
                  end
              end
          end

        end   
        %using single devision scheme
        Augumented(i,:)=Augumented(i,:)./Augumented(i,i);
        for j=i+1:1:s1(1)
           Augumented(j,:)=Augumented(j,:)-Augumented(i,:).*Augumented(j,i);

        end
    end

    for i=s1(1):-1:1

        for j=i:-1:2
            %calculating the unknowns
         Augumented(j-1,:)=Augumented(j-1,:)-Augumented(i,:).*Augumented(j-1,i);
        end

    end
    for i=s1(1):-1:1
        %puting the unknowns into the output vector
        vectorx(i)=Augumented(i,s1(2)+1);
    end

end


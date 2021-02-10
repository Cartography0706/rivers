a1=300;
a2=1000;
a3=1000;


for a=100:100:a1

    for b=50:50:a2
        
        for c=100:100:a3
            
            for d=0.5:0.1:0.7
                
                
                
                k1=a;%最短路径权值
                k2=b;%MST权值
                k3=c;%超像素面积权值
                k4=1;%节点的度权值
                LevelPresever=d;%需要保持多少百分比
                
                Names=strcat(num2str(k1),'_',num2str(k2),'_',num2str(k3),'_',num2str(k4),'_',num2str(LevelPresever));
                
                src=imread('Original River Networks.png');
                
                
                
                superpixelNum=load('superpixelNum.txt');
                superpixelNum2=load('superpixelNum2.txt');
                superpixelNum3=load('superpixelNum3.txt');
                superpixelNum4=load('superpixelNum4.txt');
                
                superpixelNum=superpixelNum';
                superpixelNum2=superpixelNum2';
                superpixelNum3=superpixelNum3';
                superpixelNum4=superpixelNum4';
                
                NrsuperpixelNum = k1*normalize(superpixelNum,'norm',Inf);
                NrsuperpixelNum2 = k2*normalize(superpixelNum2,'norm',Inf);
                NrsuperpixelNum3 = k3*normalize(superpixelNum3,'norm',Inf);
                NrsuperpixelNum4 = k4*normalize(superpixelNum4,'norm',Inf);
                superpixelAll=[NrsuperpixelNum,NrsuperpixelNum2,NrsuperpixelNum3,NrsuperpixelNum4];
                sumQZ=sum(superpixelAll,2);
                %  sumQZ1=normalize(sumQZ,'range');
                sumQZ2=normalize(sumQZ,'norm',Inf);
                max(sumQZ2)
                min(sumQZ2)
                sumQZ1=sort(sumQZ2,'descend')
                
                Presever=sumQZ1(ceil(length(sumQZ1)*LevelPresever))
                
                rgb=src;
                
%                 diplayColor(Names,Presever,rgb,sumQZ2);
                
                
                %根据superpixelNum中的每个节点的次数 按灰度等级 显示每个超像素的重要性
%算法思路 最大的为一个颜色 最小的为一个颜色 中间根据等级数量 l 判断进行显示

bw=im2bw(src);
[L,num] = bwlabel(bw,8);

[maxV,maxL]=max(NrsuperpixelNum2);
[minV,minL]=min(NrsuperpixelNum2);

l=8;%级别数量
chazhi=maxV-minV;
zengzhi=chazhi/l;



R=rgb(:,:,1); %red
G=rgb(:,:,2); %green
B=rgb(:,:,3); %blue



for s=1:num
    level= (NrsuperpixelNum2(s,1)-minV)/zengzhi;  %不同的基本显示不同的灰色 或者颜色
    s
    if  level>=0 && level<1
%         '1'
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 255;
            %             B(mx(v),ny(v)) = 0;
            
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 255;
            B(mx(v),ny(v)) = 255;
        end
        
    end
    
    if  level>=1 && level<2
%         '2'
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 213;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 230;
            B(mx(v),ny(v)) = 217;
        end
        
        
    end
    
    
    if  level>=2 && level<3
%         '3'
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 170;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 203;
            B(mx(v),ny(v)) = 179;
        end
        
        
    end
    
    if  level>=3 && level<4
%         '4'
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 128;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 173;
            B(mx(v),ny(v)) = 134;
        end
        
        
    end
    
    
    if  level>=4 && level<5
%         '5'
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 85;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 143;
            B(mx(v),ny(v)) = 89;
        end
        
        
    end
    
    if  level>=5 && level<6
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 43;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 255;
            G(mx(v),ny(v)) = 88;
            B(mx(v),ny(v)) = 9;
        end
        
    end
    
        if  level>=6 && level<7
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            %             R(mx(v),ny(v)) = 255;
            %             G(mx(v),ny(v)) = 43;
            %             B(mx(v),ny(v)) = 0;
            R(mx(v),ny(v)) = 217;
            G(mx(v),ny(v)) = 70;
            B(mx(v),ny(v)) = 0;
        end
        
    end
            if  level>=7 && level<8
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
        
            R(mx(v),ny(v)) = 162;
            G(mx(v),ny(v)) = 52;
            B(mx(v),ny(v)) = 0;
        end
        
            end
    
    if  level>=8 
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
                      R(mx(v),ny(v)) = 100;
                     G(mx(v),ny(v)) = 33;
                      B(mx(v),ny(v)) = 0;
          
        end
        
    end
            
end



outrgb(:,:,1)=R(:,:);
outrgb(:,:,2)=G(:,:);
outrgb(:,:,3)=B(:,:);



figure(1);
imshow(outrgb);


imwrite(outrgb,'NrsuperpixelNum2.png');
                
       imwrite(outrgb,'mstlevel.png');
         
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            end
            
            
        end
        
    end
    
end







function []=diplayColor(Names,LevelPresever,src,sumQZ)

sumQZ
bw=im2bw(src);
[L,num] = bwlabel(bw,8);


R=src(:,:,1); %red
G=src(:,:,2); %green
B=src(:,:,3); %blue

[maxV,maxL]=max(sumQZ);
maxV
[minV,minL]=min(sumQZ);
minV

l=8;%级别数量
chazhi=maxV-minV;
zengzhi=chazhi/l;

for s=1:num
    %     level= (sumQZ(s,1)-minV)/zengzhi;  %不同的基本显示不同的灰色 或者颜色
    s
    level= sumQZ(s,1);
    if  level>LevelPresever
        
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            R(mx(v),ny(v)) = 150;
            G(mx(v),ny(v)) = 150;
            B(mx(v),ny(v)) = 150;
        end
    else
        colorRegion=(L==s);
        [mx,ny]=find(colorRegion==1);
        
        for v=1:length(mx)
            R(mx(v),ny(v)) = 50;
            G(mx(v),ny(v)) = 50;
            B(mx(v),ny(v)) = 50;
        end
        
    end
end

outrgb(:,:,1)=R(:,:);
outrgb(:,:,2)=G(:,:);
outrgb(:,:,3)=B(:,:);



% figure(100),title('总的加权值');
% imshow(outrgb);
imwrite(outrgb,strcat(Names,'result.png'));
% 
% for ks=1:num
%     ks
%     TempAs=(L==ks);
%     supixelAs = regionprops(TempAs,'Centroid');
%     centrexAs=supixelAs.Centroid(1,1);
%     centreyAs=supixelAs.Centroid(1,2);
%     text(centrexAs,centreyAs,['(',num2str(sumQZ(ks,1)),')'],'color','g','FontSize',13);
%     
%     
% end



end




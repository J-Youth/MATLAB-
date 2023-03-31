```ad-toc
```
```toc
```


---



## （一）、离散时间系统的单位脉冲响应与零极点分析

### 实验目的

- 熟悉系统函数的单位脉冲响应、零极点分布图等概念并利用MATLAB完成仿真及绘制

### 实验原理

#### 单位脉冲响应

当LTI离散系统的激励为单位序列 $δ(k)$ 时 ，系统的零状态响应称为单位序列响应或单位脉冲响应，用$h(k)$ 表示。它的作用与连续时间系统的冲激响应 $h(t)$ 相类似 。
求解系统的单位脉冲响应可用求解差分方程法或 $z$ 变换法。

#### 零极点分析

离散时间系统的系统函数定义为$$H(z)=\frac{Y(z)}{X(z)} $$
如果系统函数的有理函数表达式为$$H(z)=\frac{b_{1}z^{m}+b_{2}z^{m-1}+\cdots +b_{m}z+b_{m+1}}{a_{1}z^{n}+a_{2}z^{n-1}+\cdots +a_{n}z+a_{n+1}} $$
在MATLAB中，系统函数的零极点就可以通过函数 $roots$ 得到，也可以借助函数 $tf2zp$ 将系统函数的有理分式形式转换为零极点增益形式，即$$H(z)=k\frac{(z-z_{1})(z-z_{2})\cdots (z-z_{m})}{(z-p_{1})(z-p_{2})\cdots (z-p_{n})} $$绘制零极点图常用 $zplane(z,p)$ 函数，其中列向量 $z$ 表示零点，列向量 $p$ 表示极点。


### 实验内容

#### 题目
设系统的差分方程为 $y(k)-y(k-1)-2y(k-2)=f(k)-(k-2)$ ,求系统的单位脉冲响应。

#### 纸笔演算
略
### MATLAB源程序



```matlab
k=-2:5; %输出序列的取值范围
a=[1,-1,-2];    %差分方程左端系数向量
b=[1,0,-1];     %差分方程右端系数向量
h=impz(b,a,k)   %求系统单位冲激响应
figure(1)
stem(k,h)    %绘制单位冲激响应
xlabel('n');ylabel("h(n)");title('单位冲激响应') ;
p=roots(a)      %求极点
z=roots(b)      %求零点
figure(2)
zplane(z,p)     %绘制零极图
```

### 实验结果
```matlab
h =

     0
     0
     1
     1
     2
     4
     8
    16


p =

     2
    -1


z =

    -1
     1
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/e466c90182de43e1812596a88494830f.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/4f68165a0ce24233b70cc5f2d14d7e23.png)

### 结果分析
- MATLAB仿真结果与演算结果一致，但由于此响应函数呈指数增长，故figure不宜呈现过多数据，否则难以分辨前端的数值变化。
- 由于此响应函数对相同的零点和极点并没有做抵消处理，故可以看到零极图中-1j出现零极点重合的情况，应寻找方法加以完善。

---

## （二）、离散时间系统的幅频、相频的分析方法

### 实验目的

- 熟悉系统函数的系统频率响应等概念，并利用MATLAB绘制

### 实验原理

设输入序列是频率为 $ω$ 的复指数序列，即 $x(n)=e^{j\omega n}$ ,线性时不变系统的单位冲激响应为 $h(n)$ ,根据卷积公式可得系统输出$$x(n)=\sum_{m=-\infty }^{\infty }  h(m)e^{j\omega (n-m)}=e^{j\omega n} \sum_{m=-\infty }^{\infty }  h(m)e^{-j\omega m}=H(e^{j\omega })e^{j\omega n}$$
其中，$H(e^{j\omega })=\sum_{m=-\infty }^{\infty }  h(m)e^{-j\omega m}$ 称为线性时不变系统的频率响应。


频率响应也可表示为
$$H(e^{j\omega })=H(z)\mid _{z=e^{j\omega }}=\mid H(e^{j\omega })\mid e^{j\psi (\omega )} $$
其中，$\mid H(e^{j\omega })\mid$ 为离散系统的幅频特性，$\psi (\omega )$ 为离散系统的相频特性，$H(e^{j\omega })$ 是以 $2\pi$  为周期的周期函数，只要分析 $H(e^{j\omega })$ 在 $\mid \omega \mid\le\pi$ 的范围内的情况，便可分析出整个系统的频率特性。    ^d3fc7e




### 实验内容

#### 题目
已知系统函数为$$H(z)=\frac{z}{z-0.5} $$绘制其频响曲线。

#### 纸笔演算

略
### 实验原始记录

#### 函数使用规则
在MATLAB中，函数$freqz$ 用于求离散时间系统频响特性。使用规则如下：
```matlab
[H,w]=freqz(B,A,N)
[H,w]=freqz(B,A,N,'whole')
%B,A表示H（z）的分子与分母多项式的系数向量
%N为正整数，默认值512.返回值w包含0到π范围内的N个频率等分点
%H表示频响在N个频率等分点对应的值
```

#### 源程序

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-g0juzbkJ-1679996111438)(MATLAB源代码/chp1sec1_2.m)]
```matlab
B=[1 -0.5];
A =[1 0];
[H,w]=freqz(A,B,400,'whole');
Hf=abs(H);
Hx=angle(H); 
subplot(121)
plot(w/pi,Hf)
title('离散系统幅频特性曲线');
xlabel('角频率/π');ylabel('幅度');grid on
subplot(122)
plot(w/pi,Hx)
xlabel('角频率/π');ylabel('幅度');grid on
title('离散系统相频特性曲线')
```

### 实验结果
![](https://img-blog.csdnimg.cn/f7e86ec373574a90bd425fd283cc274c.png)

### 结果分析
MATLAB仿真结果与演算结果一致。

---

## （三）、离散卷积的计算

### 实验目的

- 熟悉离散卷积的概念，并利用MATLAB计算离散卷积

### 实验原理
离散时间信号的卷积定义为$$y(n)=x(n)*h(n)=\sum_{m=-\infty }^{\infty } x(m)h(n-m)$$在MATLAB中，$conv$ 函数用来计算两个离散序列卷积和的函数，其调用函数为$$c=conv(a,b)$$ 式中，a、b 分别为待卷积的两序列的向量表示，c是卷积结果。向量c的长度为a、b两向量长度和减1 。


### 实验内容

#### 题目
输入序列  $x(n)=[1,2,3,4,5]$ , 单位脉冲序列为 $h(n)=[6,2,3,6,4,2]$ ,求输出序列

#### 纸笔演算
略
### MATLAB源程序

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-2yTx4yJo-1679996111439)(MATLAB源代码/chp1sec1_3.m)]
```matlab
clear;
x=[1,2,3,4,5];
h=[6,2,3,6,4,2];
n=0:length(x)-1;
m=0:length(h)-1;
s=0:(length(x)+length(h)-2);
y=conv(x,h)
subplot(131);stem(n,x);axis([-2 8 0 7]);
xlabel('n');ylabel('x');title('x(n)');
subplot(132);stem(m,h);axis([-2 8 0 7]);
xlabel('m');ylabel('h');title('h(n)');
subplot(133);stem(s,y);axis([-2 11 0 70]);
xlabel('s');ylabel('y');title('y(n)=x(n)*h(n)');
```

### 实验结果

```matlab
y =

     6    14    25    42    63    50    55    52    28    10
```
![](https://img-blog.csdnimg.cn/96403bc1d1a544048b0ef8c367ec7cb5.png)


### 结果分析
仿真结果与实际计算结果一致。

---


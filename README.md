# Statistical-Computing

📌 HW2 [以python進行]

<img width="150" height="200" alt="螢幕擷取畫面 2025-07-28 161204" src="https://github.com/user-attachments/assets/882bd6e8-c948-45e8-a38e-fa46b9c78ff3" />


模擬銅板是否公正，並分兩種情況假設速度(v)及加速度(w)：

(情況一) 假設速度及加速度皆服從 Unifrom 分布

(情況二) 假設速度及加速度皆服從 Noramal 分布

經由執行程式碼後，可以知道銅板是否公正以及得到銅板在執行過程的所有結果

📌 HW3

與 HW2 相同，一樣為檢驗銅板是否公正、使用兩個不同情形 (假設為 Uniform 與 Normal)

step1. 為了估計真實機率，將模擬次數設定為 1,000,000 次。根據中央極限定理，重複抽樣所產生的平均值將近似於母體參數，因此能有效估計理論真值。

step2. 利用 jackknife 以及 Bootstrap 方法 (兩者次數皆採用1000次)，透過MSE值看出與真值差異

step3. 以大小順序排序在 Bootstrap 方法得到的估計值，接著以 Simple Method、 Percentile Method、 BC、 BCa 四種方法建立 95% CI。
       透過t-test檢驗與真值是否相同。


📌 HW4

進行 gibb sampling 並比較與真實posteriot下之 數值、 圖形 、 CI 差異

實作以下兩種情形：

1.
<img width="150" height="150" alt="螢幕擷取畫面 2025-07-28 164516" src="https://github.com/user-attachments/assets/cecdb7b6-4938-413a-bbf6-707a1a28e378" />

2.
<img width="150" height="50" alt="螢幕擷取畫面 2025-07-28 165003" src="https://github.com/user-attachments/assets/496aae87-7bbc-469e-bce2-ff827f2fb7c9" />

gibb sampling 設定兩種不同執行次數：

(方法一) 執行次數與paper(In paper, Explaining the Gibbs Sampler George Casella; Edward I. George The American Statistician, Vol. 46, No. 3. (Aug., 1992), pp. 167-174.)相同，設置為500次


📌 HW5






(方法二) 執行次數設置到收斂為止

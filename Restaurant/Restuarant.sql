-- 📊 عدد الطلبات الكلي
SELECT COUNT(OrderID) AS Total_Orders
FROM restaurant_data_cleaned;

-- 💰 إجمالي الإيرادات والإكراميات
SELECT 
    SUM(TotalPrice) AS Total_Revenue,
    SUM(TipAmount) AS Total_Tips
FROM restaurant_data_cleaned;

-- 👑 أعلى 10 عملاء صرفًا
SELECT 
    CustomerName,
    COUNT(OrderID) AS Orders_Count,
    SUM(TotalPrice) AS Total_Spent
FROM restaurant_data_cleaned
GROUP BY CustomerName
ORDER BY Total_Spent DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 🥇 الأصناف الأكثر مبيعًا
SELECT 
    Item,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY Item
ORDER BY Total_Quantity_Sold DESC;

-- 🧾 تحليل حسب الفئة (Category)
SELECT 
    Category,
    COUNT(*) AS Orders_Count,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY Category
ORDER BY Revenue DESC;

-- 💳 تحليل طرق الدفع
SELECT 
    PaymentMethod,
    COUNT(*) AS Payment_Count,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

-- 🏢 أداء الفروع
SELECT 
    Branch,
    COUNT(*) AS Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(Rating) AS Avg_Rating
FROM restaurant_data_cleaned
GROUP BY Branch;

-- ⏱️ متوسط زمن التحضير
SELECT 
    AVG([PreparationTime_min]) AS Avg_Preparation_Minutes
FROM restaurant_data_cleaned;

-- 🍽️ تحليل حسب نوع الطلب (Dine-in / Takeaway)
SELECT 
    DineInTakeaway,
    COUNT(*) AS Orders,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY DineInTakeaway;

-- 🧑‍💼 أفضل 5 أفراد خدمة بناءً على الإيرادات
SELECT 
    WaiterName,
    COUNT(*) AS Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(Rating) AS Avg_Rating
FROM restaurant_data_cleaned
GROUP BY WaiterName
ORDER BY Revenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 📅 الطلبات لكل يوم
SELECT 
    Date,
    COUNT(*) AS Orders,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY Date
ORDER BY Date;

-- ⏰ تحليل بالساعات (من عمود Time)
SELECT 
    LEFT(Time, 2) + ':00' AS Hour,
    COUNT(*) AS Orders,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY LEFT(Time, 2)
ORDER BY Hour;

-- 🌟 تقييمات العملاء حسب الفرع
SELECT 
    Branch,
    AVG(Rating) AS Avg_Rating,
    COUNT(*) AS Total_Reviews
FROM restaurant_data_cleaned
GROUP BY Branch
ORDER BY Avg_Rating DESC;

-- 🧾 تحليل الإيرادات حسب كل صنف وفئة
SELECT 
    Category,
    Item,
    SUM(TotalPrice) AS Revenue
FROM restaurant_data_cleaned
GROUP BY Category, Item
ORDER BY Revenue DESC;
-- 💼 عدد الطلبات والإيرادات حسب كل موظف
SELECT 
    WaiterName,
    COUNT(OrderID) AS Orders_Count,
    SUM(TotalPrice) AS Total_Revenue
FROM restaurant_data_cleaned
GROUP BY WaiterName
ORDER BY Total_Revenue DESC;

USE DWH;
GO

CREATE PROCEDURE DailyTransaction
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    SELECT 
        TransactionDate AS [Date],
        COUNT(TransactionID) AS TotalTransactions,
        SUM(Amount) AS TotalAmount
    FROM FactTransaction
    WHERE TransactionDate BETWEEN @start_date AND @end_date
    GROUP BY TransactionDate
    ORDER BY TransactionDate;
END
GO
select * from [Bank Loan] 

SELECT COUNT(id) AS Total_Applications FROM [Bank Loan]

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM [Bank Loan]
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2023

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM [Bank Loan]
where month(issue_date) = 11 and YEAR(issue_date) = 2023

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM [Bank Loan]
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2023

SELECT round(AVG(int_rate)* 100,4) AS PMTD_Avg_Int_Rate FROM [Bank Loan]
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2023

SELECT round(AVG(dti)*100,4) AS PMTD_Avg_Dept_To_Income FROM [Bank Loan]
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2023

SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/ 
	COUNT(id) AS Good_Loan_Percentage
FROM [Bank Loan]

select loan_status from [Bank Loan]

SELECT COUNT(id) AS Good_Loan_Applications FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM [Bank Loan]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' or loan_status = 'late' THEN id END)*100) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM [Bank Loan]

SELECT COUNT(id) AS Bad_Loan_Applications FROM [Bank Loan]
WHERE loan_status = 'Charged Off' or loan_status = 'late'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM [Bank Loan]
WHERE loan_status = 'Charged Off' or loan_status = 'late'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM [Bank Loan]
WHERE loan_status = 'Charged Off' or loan_status = 'late'

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        Round(AVG(int_rate ),2) AS Interest_Rate,
        Round(AVG(dti ),2) AS DTI
    FROM
        [Bank Loan]
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM [Bank Loan]
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY address_state
ORDER BY address_state

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY emp_length
ORDER BY emp_length

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY purpose
ORDER BY count(id) DESC

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
GROUP BY home_ownership
ORDER BY home_ownership

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan]
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose


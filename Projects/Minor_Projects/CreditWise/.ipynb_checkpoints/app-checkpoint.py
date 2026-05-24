import streamlit as st
import numpy as np
import joblib

# Load model and scaler
model = joblib.load("model_lr.pkl")
scaler = joblib.load("scaler.pkl")

st.title("CreditWise Loan System")

# Numerical Inputs
Applicant_Income = st.number_input("Applicant Income")
Coapplicant_Income = st.number_input("Coapplicant Income")
Age = st.number_input("Age")
Dependents = st.number_input("Dependents")
Credit_Score = st.number_input("Credit Score")
Existing_Loans = st.number_input("Existing Loans")
DTI_Ratio = st.number_input("DTI Ratio")
Savings = st.number_input("Savings")
Collateral_Value = st.number_input("Collateral Value")
Loan_Amount = st.number_input("Loan Amount")
Loan_Term = st.number_input("Loan Term")
Education_Level = st.number_input("Education Level")

# Encoded Binary Inputs
Employment_Status_Salaried = st.selectbox(
    "Salaried",
    [0, 1]
)

Employment_Status_Self_employed = st.selectbox(
    "Self-employed",
    [0, 1]
)

Employment_Status_Unemployed = st.selectbox(
    "Unemployed",
    [0, 1]
)

Marital_Status_Single = st.selectbox(
    "Single",
    [0, 1]
)

Loan_Purpose_Car = st.selectbox("Loan Purpose Car", [0, 1])
Loan_Purpose_Education = st.selectbox("Loan Purpose Education", [0, 1])
Loan_Purpose_Home = st.selectbox("Loan Purpose Home", [0, 1])
Loan_Purpose_Personal = st.selectbox("Loan Purpose Personal", [0, 1])

Property_Area_Semiurban = st.selectbox(
    "Semiurban",
    [0, 1]
)

Property_Area_Urban = st.selectbox(
    "Urban",
    [0, 1]
)

Gender_Male = st.selectbox("Male", [0, 1])

Employer_Category_Government = st.selectbox(
    "Government Employee",
    [0, 1]
)

Employer_Category_MNC = st.selectbox(
    "MNC Employee",
    [0, 1]
)

Employer_Category_Private = st.selectbox(
    "Private Employee",
    [0, 1]
)

Employer_Category_Unemployed = st.selectbox(
    "Employer Unemployed",
    [0, 1]
)

# Prediction
if st.button("Predict"):

    data = np.array([[
        Applicant_Income,
        Coapplicant_Income,
        Age,
        Dependents,
        Credit_Score,
        Existing_Loans,
        DTI_Ratio,
        Savings,
        Collateral_Value,
        Loan_Amount,
        Loan_Term,
        Education_Level,
        Employment_Status_Salaried,
        Employment_Status_Self_employed,
        Employment_Status_Unemployed,
        Marital_Status_Single,
        Loan_Purpose_Car,
        Loan_Purpose_Education,
        Loan_Purpose_Home,
        Loan_Purpose_Personal,
        Property_Area_Semiurban,
        Property_Area_Urban,
        Gender_Male,
        Employer_Category_Government,
        Employer_Category_MNC,
        Employer_Category_Private,
        Employer_Category_Unemployed
    ]])

    # Scale input
    data_scaled = scaler.transform(data)

    # Predict
    prediction = model.predict(data_scaled)[0]

    if prediction == 1:
        st.success("Loan Approved")
    else:
        st.error("Loan Rejected")
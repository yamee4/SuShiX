import random
import csv
from datetime import datetime, timedelta

# Helper functions
def mapping_price(dishid):
    prices = [50000, 60000, 45000, 55000, 65000, 60000, 70000, 75000, 80000, 85000, 100000, 30000, 35000, 40000, 50000, 20000, 30000, 40000, 15000, 40000, 35000, 150000, 200000, 250000, 180000, 25000, 30000, 35000, 50000, 30000, 15000, 40000, 35000, 50000, 60000, 55000, 40000, 65000, 80000, 150000, 120000]
    return prices[dishid - 1]

def random_date(start, end):
    delta = end - start
    random_days = random.randint(0, delta.days)
    return start + timedelta(days=random_days)


def generate_employee(num_employees):
    employees = []
    for i in range(num_employees):
        empID = f"{i+1:05d}"
        first_name = f"FirstName{i+1}"
        last_name = f"LastName{i+1}"
        birth_date = random_date(datetime(1990, 1, 1), datetime(2003, 12, 31))
        gender = random.choice(["Nam", "Nu"])
        salary = random.randint(5000000, 20000000)
        branch_manager = 0
        employees.append([empID, first_name, last_name, birth_date, gender, salary, branch_manager])
    return employees


def generate_customers(num_customers):
    customers = []
    for i in range(num_customers):
        cccd = f"{i+1:010d}"
        first_name = f"FirstName{i+1}"
        last_name = f"LastName{i+1}"
        phone = f"{random.randint(1000000000, 9999999999)}"
        email = f"customer{i+1}@example.com"
        gender = random.choice(["Nam", "Nu"])
        is_member = random.choice([0, 1])
        is_registered = random.choice([0, 1])
        customers.append([cccd, first_name, last_name, phone, email, gender, is_member, is_registered])
    return customers

def generate_online_customers(customers):
    online_customers = []
    for customer in customers:
        if customer[7] == 1:
            password = f"pass{customer[0]}"
            online_customers.append([customer[0], password])
    return online_customers

def generate_customer_members(customers):
    customer_members = []
    for customer in customers:
        if customer[6] == 1:
            member_card = f"MC{random.randint(10000, 99999)}"
            created_date = random_date(datetime(2015, 1, 1), datetime(2024, 1, 1))
            support_emp = f"E{random.randint(1, 100):05d}"
            rank = random.choice(["MEMBER", "SILVER", "GOLD"])
            points = random.randint(0, 10000)
            acquired_rank_date = created_date + timedelta(days=random.randint(30, 365))
            customer_members.append([customer[0], member_card, created_date, support_emp, rank, points, acquired_rank_date])
    return customer_members

def generate_order_tickets(customers, emp):
    order_tickets = []
    ticket_types = ["ONL", "PRE", "STD"]
    for customer in customers:
        ticket_id = f"TKT{random.randint(10000, 99999):07d}"
        ticket_type = random.choice(ticket_types)
        branch_id = random.randint(1, 50)
        emp_id = random.choice(emp)
        discount = 0
        total_price = 0
        created_date = random_date(datetime(2020, 1, 1), datetime(2024, 1, 1))
        order_tickets.append([ticket_id, ticket_type, branch_id, customer[0], emp_id, discount, total_price, created_date])
    return order_tickets

def generate_standard_order_tickets(order_tickets, emp):
    standard_tickets = []
    for ticket in filter(lambda x: x[1] == "STD", order_tickets):
        table_name = f"Table{random.randint(1, 100)}"
        support_employee = random.choice(emp)
        standard_tickets.append([ticket[0], table_name, support_employee])
    return standard_tickets

def generate_pre_order_tickets(order_tickets):
    pre_tickets = []
    for ticket in filter(lambda x: x[1] == "PRE", order_tickets):
        branch_name = {random.randint(1, 15)}
        area = f"Area {random.randint(1, 4)}"
        num_customers = random.randint(1, 10)
        pre_order_note = f"Note for {ticket[0]}"
        pre_tickets.append([ticket[0], branch_name, area, num_customers, pre_order_note])
    return pre_tickets

def generate_online_tickets(order_tickets):
    online_tickets = []
    for ticket in filter(lambda x: x[1] == "ONL", order_tickets):
        online_tickets.append([ticket[0]])
    return online_tickets

def generate_ticket_details(order_tickets, ticket_type):
    ticket_details = []
    for ticket in filter(lambda x: x[1] == ticket_type, order_tickets):
        dish_id = random.randint(1, 40)
        order_time = random_date(datetime(2023, 1, 1), datetime(2024, 12, 31))
        quantity = random.randint(1, 5)
        price = quantity * mapping_price(dish_id)
        ticket_details.append([ticket[0], dish_id, order_time, quantity, price])
    return ticket_details

def save_to_csv(filename, data, headers):
    with open(filename, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(headers)
        writer.writerows(data)

# Generate data
employees = generate_employee(5000)
customers = generate_customers(100000)
online_customers = generate_online_customers(customers)
customer_members = generate_customer_members(customers)
order_tickets = generate_order_tickets(customers, employees)
standard_tickets = generate_standard_order_tickets(order_tickets, employees)
pre_tickets = generate_pre_order_tickets(order_tickets)
online_tickets = generate_online_tickets(order_tickets)
online_ticket_details = generate_ticket_details(order_tickets, "ONL")
pre_order_ticket_details = generate_ticket_details(order_tickets, "PRE")
standard_order_ticket_details = generate_ticket_details(order_tickets, "STD")

# Save to CSV
save_to_csv("CUSTOMER.csv", customers, ["CCCD", "CustomerFirstName", "CustomerLastName", "PhoneNumber", "Email", "Gender", "isMember", "isRegistered"])
save_to_csv("ONLINE_CUSTOMER.csv", online_customers, ["OCCCD", "O_password"])
save_to_csv("CUSTOMER_MEMBER.csv", customer_members, ["MCCCD", "MemberCardNumber", "CreatedDate", "SupportEmp", "MemberCardRank", "MemberCardPoints", "MemberCardAcquiredRankDate"])
save_to_csv("ORDER_TICKET.csv", order_tickets, ["TicketID", "TicketType", "BranchID", "CCCD", "EmpID", "Discount", "TotalPrice", "CreatedDate"])
save_to_csv("STANDARD_ORDER_TICKET.csv", standard_tickets, ["SOTicketID", "TableName", "SupportEmployee"])
save_to_csv("PRE_ORDER_TICKET.csv", pre_tickets, ["PTicketID", "BranchName", "Area", "NumberofCustomer", "PreOrderNote"])
save_to_csv("ONLINE_TICKET.csv", online_tickets, ["OTicketID"])
save_to_csv("ONLINE_TICKET_DETAIL.csv", online_ticket_details, ["OTicketID", "DishID", "OrderTime", "Quantity", "Price"])
save_to_csv("PRE_ORDER_TICKET_DETAIL.csv", pre_order_ticket_details, ["PTicketID", "DishID", "OrderTime", "Quantity", "Price"])
save_to_csv("STANDARD_ORDER_DETAIL.csv", standard_order_ticket_details, ["SOTicketID", "DishID", "OrderTime", "Quantity", "Price"])

from faker import Faker
fake = Faker('pt-BR')
 
for i in range(0, 10):  
    users = []
    users[i]['name'] = fake.name()
    users[i]['email'] = fake.email()
    users[i]['password'] = fake.password()
    users[i]['administrador'] = "true"   
    users.append()
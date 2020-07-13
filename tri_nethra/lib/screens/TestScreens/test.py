# d={"Type of crime": {
#       "Street Crime": {
#         "Burglary": "Location Block",
#         "Auto Theft": " Theft Location Block",
#         "Rape": "Location Block",
#         "Robbery": "Location Block",
#         "Other": "Default Block"
#       },
#       "Death": {
#         "Homicide": "Location Block",
#         "Suicide": "Location Block",
#         "Other": "Default Block"
#       },
#       "Drug Crime": "Default Block",
#       "Cyber Crime": {
#         "Phishing": "Default Block",
#         "Identity Theft": "Default Block",
#         "Spread of Fake content/Hatred": "Default Block",
#         "Pornography": "Default Block",
#         "Other": "Default Block"
#       },
#       "White-Collar Crime": {
#         "Bribe": "Location Block",
#         "Price Fixing": "Location Block",
#         "Other": "Default Block"
#       },
#       "Report an Accident": "Location Block"}}
# t=d["Type of crime"]
# while(len(t)!=0):
#     print('len',len(t))
#     l=[]
#     for i in t:
#         print(i)
#         l.append(i)
#     print("Enter choice:")
#     o=int(input())
#     t=t[l[o]]
#     if( type(t) == str):
#             print('finish')
#             break
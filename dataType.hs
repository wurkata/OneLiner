data Person = Person { firstName :: String  
                         , lastName :: String  
                         , age :: Int 
                         } 

createPerson = Person (firstName = "Yavor", lastName = "Edipov", age = 20)
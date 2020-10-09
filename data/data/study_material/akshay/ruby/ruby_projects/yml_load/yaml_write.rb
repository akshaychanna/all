require 'yaml'
recipe = { title: "Coffee", 
           ingredients: [ { ingredient_name: "Water", 
                            quantity: 8,
                            unit_of_measurement: "oz" },
                          { ingredient_name: "Coffee Grounds", 
                            quantity: 1,
                            unit_of_measurement: "tbsp" } ],
           directions: "Make coffee."  }
File.open("coffee.yml", "w") { |file| file.write(recipe.to_yaml) }

For this project my main goal was to go above and beyond the spec required.

I began with implementing a simple splash screen to greet the user when opening the application:
![Moneybox-splash](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/5f4bb7c5-1a0e-4304-8f16-45987e0deed2)




After that i built a simple login screen only using static variables for authentication:

![Moneybox-Login](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/df3ecb46-c6c0-4785-9971-fb674a11add8)

Next i added in Create pin and Enter pin functionality to mimic the real moneyBox application:

![Moneybox-enterPin](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/b2093fbc-d474-4bb6-bd85-23d578ff0dd0)
![Moneybox-createPin](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/79f0eddd-e6a2-44b8-ad22-079b31139730)


My Next step was to develop logout functionality to allow the user to easily return to the login screen:

![MoneyBox-logout](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/fe9fbb12-eef1-4b2f-a012-76233b74ccdc)


Next i built the functionality to fetch and store the users moneyBox account data into a custom model, then displayed via a custom Card component, the idea here was to keep it minimilistic and simple:

![MoneyBox-cards](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/895d9351-75bb-4cf3-9c17-d0b06930ff61)


Finally i added in a navigation link for each card and passed the data through in an efficient manor, i implemented logic to show more account details dependent on the account type, and built a modern yet simplistic add money
section which allows users to add money to their moneybox in multiples of 5:

![Moneybox-details](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/057f0456-338a-426d-ab49-bf235f15f100)



I Followed an MVVM design pattern throughout the project, Ensured the UI fit into each iPhone model and made sure that all of the core functions had unit tests.
I chose to use SwiftUI as that is what im most familiar with.


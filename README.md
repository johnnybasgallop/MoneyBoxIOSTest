For this project my main goal was to go above and beyond the spec required.

I began with implementing a simple splash screen to greet the user when opening the application:

![IMG_3706](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/18d08654-8df7-4df6-a920-e50864a05c98)

After that i built a simple login screen only using static variables for authentication:

![IMG_3711](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/927f3a64-748a-4931-b597-f8575392bd7c)

Next i added in Create pin and Enter pin functionality to mimic the real moneyBox application:

![IMG_3712![IMG_3707](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/2aa02140-d556-45f3-ac21-d42a2fd68476)
](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/e60ecf3f-92c2-408c-9d48-b65d9cb5c08e)

My Next step was to develop logout functionality to allow the user to easily return to the login screen:

![IMG_3709](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/05ea62f0-e8fd-45b6-b718-492cc905709e)

Next i built the functionality to fetch and store the users moneyBox account data into a custom model, then displayed via a custom Card component, the idea here was to keep it minimilistic and simple:

![IMG_3708](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/b2039abb-59df-47fe-bd15-d93a830d8b2a)

Finally i added in a navigation link for each card and passed the data through in an efficient manor, i implemented logic to show more account details dependent on the account type, and built a modern yet simplistic add money
section which allows users to add money to their moneybox in multiples of 5:

![IMG_3710](https://github.com/johnnybasgallop/MoneyBoxIOSTest/assets/94317860/10c2418a-6368-424c-a873-79af9174917c)



I Followed an MVVM design pattern throughout the project, Ensured the UI fit into each iPhone model and made sure that all of the core functions had unit tests.
I chose to use SwiftUI as that is what im most familiar with.


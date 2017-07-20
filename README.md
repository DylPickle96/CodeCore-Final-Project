## Vagabond Buy N Sell

Vagabond Buy N Sell is a website whose primary focus is the purchase and sale of vehicles or parts. The website is aimed at a target demographic, 'Car Guys', who view vehicles as more than just something that gets them from point A to B. I decided to create this website to demonstrate what I had learnt over the course of the Bootcamp and to combine my love of computers with my love for cars.

### If you would like to test this in development

once you have cloned the repository to your local machine please doing the following:

* ```bundle```
* ```rails db:create db:migrate db:seed```

### Technologies used in this project:

* Built in Ruby on Rails (5.1.1).
* JavaScript and jQuery for interactivity.
* WebSockets via ActionCable to establish a persistent connection between the client and server.
* AJAX to avoid page reloading when messages are sent.
* HTML5 & CSS3 for the layout and styling.
* Google Maps API to apply a visual element to where the cars or parts are located.
* PostgreSQL for my database.

Instant messaging offered the greatest challenge through the course of building this project. ActionCable provided a fairly simple approach to WebSockets in which I was able to open a unique channel for each conversation between two users. Through this I was able to apply JavaScript and jQuery to append messages on the recipient end and using AJAX re-render the sender's message list. Channels were identified by a unique ID which was passed to the subscription through a custom jQuery event. 

### If you would like to view a live version of this website:

[Vagabond Buy N Sell](https://vagabond-buy-and-sell.herokuapp.com/)

I welcome all feedback and suggestions! Thank you for taking the time to view my project.

# README
API:         
**Users**
* GET | /users | Display all users
* GET | /users/:id/edit | Display form to edit user
* GET | /users/:id | Display information about individual user
* PUT/PATCH | /users/:id | Update user information
* DELETE | /users/:id | Delete user

**Channels**
* GET | /channels | Display all channels
* POST | /channels | Create new channel
* GET | /channels/new | Display form
* DELETE | /channels/ | Delete channel
* POST | /messages/:id | Create message
* GET | /chat/:id | Display chat channel

Features:
--------
* Channel subscriptions (Slack-ish).
* Email verification for account creation.
* OAuth?
* Chat encryption
* alias lowercase

Optimizations:
--------------
* Caching chat messages.
* Archive older messages?
* Dynamic loading of messages in chat box.
* DB
  * Raw SQL (then need to worry about injection).
  * Horizontal scaling - (more machines).
    * Messages separated by channel. Spread geographically?
  * Vertical scaling - (more power)
    * increase cache size?

Security:
---------
* API key.
* No check for channel in message submission.
* Tokens?

Mistakes:
---------
* Way too much time on devise.
* Should have started with chat first, not login/registration and extra
  features.
* Trim bloat from scaffolding.
* Tried to learn too much while writing (devise, sockets in rails, partials, ).

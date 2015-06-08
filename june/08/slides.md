# [fit] The
# [fit] Internet

![](http://media.boingboing.net/wp-content/uploads/2013/06/il_fullxfull.403564681_gahb1.jpg)

---

# [fit] Client *⇔* Server

![A Series of Tubes](http://www.theroguenews.com/wp-content/uploads/2012/04/The-internet-is-like-a-series-of-tubes-you-see-e1334785633324.jpg)

---

# *Client*

Makes a *Request*
* Clicking a link (`GET`)
* Submitting a form (`POST` or `GET`)
* Running JavaScript (??)

---

# *Server*

* Queries or updates the databse
* Sends emails
* Runs programs
* Makes requests to other services

---

# *Server*

Sends back a *Response*
* Often `HTML` (containing links and forms and JavaScript)
* Often `JSON` / `XML` data

---

# [fit] Client *:* Request *::* Server *:* Response

---

# [fit] The Request-Response Loop

![](http://upload.wikimedia.org/wikipedia/commons/3/32/Chrysopoea_of_Cleopatra_1.png)

---

^ The domain (like `google.com` is routed to a server via `DNS`)
^ The server uses the path and verb to decide which action to take

# *Request*

* Location - domain, path / endpoint
* Verb - `GET`, `POST`, `DELETE`, `PUT`, `PATCH`, ...
* Data - headers, params, `POST` body

---

# *Response*

* Headers
* Status code - `200`, `404`, `500`, ...
* Body - `HTML`, `JSON`, ...

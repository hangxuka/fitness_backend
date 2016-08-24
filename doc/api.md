User Api
--------
* ####update_manager
  **URL**: [https://fit-ness-backend.herokuapp.com/api/managers/:id](api/managers/:id)

  **Method**: **PUT**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `manager[full_name]: type: string`
    + `manager[user_name]: type: string, presence: true`
    + `manager[birthday]: type: string`
    + `manager[address]: type: string`
    + `manager[tel_number]: type: string`
    + `manager[avatar]: type: string`

  **Request example**:
    + `PUT:
    {"manager"=>{"full_name"=>"Tran Van Quy", "user_name"=>"Quy", "birthday"=>"02-04-1994", "address"=>"Ha Phong", "tel_number"=>"0902004984", "avatar"=>"image"}, "id"=>"1"}`

  **Response**:

    + `{"full_name":"Tran Van Quy","user_name":"Quy","birthday":"02-04-1994","address":"Ha Phong","tel_number":"0902004984","avatar":"image","messages":"update manager success!"}`

* ####all items
  **URL**: [https://fit-ness-backend.herokuapp.com/api/items](api/items)

  **Method**: **GET**

  **Param request**:

    + `- auth_token: type: string, presence: true`
  **Request example**:

  **Response**:

    + `[{"id":1,"name":"coca","price":122.0},{"id":2,"name":"pepsi","price":122.0}]`

* ####show item
  **URL**: [https://fit-ness-backend.herokuapp.com/api/items/:id](api/items/:id)

  **Method**: **GET**

  **Param request**:

    + `- auth_token: type: string, presence: true`
  **Request example**:

  **Response**:

    + `[{"id":1,"name":"coca","price":122.0}]`
####create item
  **URL**: [https://fit-ness-backend.herokuapp.com/api/items](api/items)

  **Method**: **POST**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `item[name]: type: string, presence: true`
    + `item[price]: type: float, presence: true`
    + `item[manager_id]: type: int`
  **Request example**:
    {"item"=>{"name"=>"coca", "price"=>"100", "manager_id"=>"1"}, "auth_token"=>"7CuypTkZoTScPcHgLpWs"}

  **Response**:

    + `{
      "id": 4,
      "name": "coca",
      "price": 100,
      "messages": "Create item success!"
    }`

* ####update item
  **URL**: [https://fit-ness-backend.herokuapp.com/api/items/:id](api/items/:id)

  **Method**: **PUT**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `item[name]: type: string`
    + `item[price]: float`
    + `item[manager_id]: int`
  **Request example**:
    + `{"item"=>{"name"=>"Pepsi1"}, "id"=>"2"}`
  **Response**:

    + `  {"item":{"id":2,"name":"Pepsi1","price":20.0,"manager_id":1,"created_at":"2016-08-23T09:23:29.000Z","updated_at":"2016-08-23T09:28:37.000Z"},"messages":"update item success!"}`
* ####destroy item
  **URL**: [https://fit-ness-backend.herokuapp.com/api/items/:id](api/items/:id)

  **Method**: **DELETE**

  **Param request**:

     + `- auth_token: type: string, presence: true`
  **Request example**:
  **Response**:

    + ` {"messages":"delete item success!"}`

* ####all user
  **URL**: [https://fit-ness-backend.herokuapp.com/api/users](api/users)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`
     + `role: type: string {trainer|customer}`
  **Request example**:

  **Response**:
    + `[
  {
    "id": 2,
    "full_name": "Tran Van Quy",
    "birthday": "Quy",
    "tel_number": "0902004984",
    "address": "Ha Noi",
    "role": "trainer",
    "manager_id": 1,
    "meeting_money": 100,
    "salary": 100
  },
  {
    "id": 3,
    "full_name": "Tran Van Quy",
    "birthday": "Quy",
    "tel_number": "0902004984",
    "address": "Ha Noi",
    "role": "trainer",
    "manager_id": 1,
    "meeting_money": 100,
    "salary": 100
  }
]`
* ####Create user
  **URL**: [https://fit-ness-backend.herokuapp.com/api/users](api/users)

  **Method**: **POST**

  **Param request**:

     + `- auth_token: type: string, presence: true`
    + `user[full_name], type: string, presence: true`
    + `user[birthday], type: string `
    + `user[tel_number], type: string presence: true`
    + `user[address], type: string`
    + `user[salary], type: float`
    + `user[meeting_money] type: float`
    + `user[registry_date] type: string`
    + `user[expiry_date] type: string`
    + `user[avatar] type: string`
    + `user[role], type: trainer|customer presence: true`

  **Request example**:
  `POST:  {"user"=>{"full_name"=>"Tran Van Quy", "birthday"=>"Quy", "tel_number"=>"0902004984", "address"=>"Ha Noi", "salary"=>"100", "meeting_money"=>"100", "registry_date"=>"", "expiry_date"=>"", "avatar"=>"image", "role"=>"trainer"}, "text/plain"=>[""], "auth_token"=>"7CuypTkZoTScPcHgLpWs"}
`

  **Response**:

    + `{
        "id": 3,
        "full_name": "Tran Van Quy",
        "birthday": "Quy",
        "tel_number": "0902004984",
        "address": "Ha Noi",
        "role": "trainer",
        "manager_id": 1,
        "meeting_money": 100,
        "salary": 100,
        "messages": "create trainer success!"
      }`
* ####update user
  **URL**: [https://fit-ness-backend.herokuapp.com/api/users/:id](api/users)

  **Method**: **PUT**

  **Param request**:

     + `- auth_token: type: string, presence: true`
    + `user[full_name], type: string, presence: true`
    + `user[birthday], type: string `
    + `user[tel_number], type: string presence: true`
    + `user[address], type: string`
    + `user[salary], type: float`
    + `user[meeting_money] type: float`
    + `user[registry_date] type: string`
    + `user[expiry_date] type: string`
    + `user[avatar] type: string`
    + `user[role], type: trainer|customer presence: true`

  **Request example**:
 Parameters: {"user"=>{"full_name"=>"Tran Hai Anh", "birthday"=>"02-04-1994", "tel_number"=>"0902004984", "address"=>"Ha Noi", "salary"=>"100", "meeting_money"=>"100", "registry_date"=>"", "expiry_date"=>"", "avatar"=>"image", "role"=>"trainer"}, "text/plain"=>[""], "auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"2"}`

  **Response**:

    + `{
      "id": 2,
      "full_name": "Tran Hai Anh",
      "birthday": "02-04-1994",
      "tel_number": "0902004984",
      "address": "Ha Noi",
      "role": "trainer",
      "manager_id": 1,
      "meeting_money": 100,
      "salary": 100,
      "messages": "update trainer success!"
    }`

* ####destroy user
  **URL**: [https://fit-ness-backend.herokuapp.com/api/users/:id](api/users)

  **Method**: **DELETE**

  **Param request**:

     + `- auth_token: type: string, presence: true`

  **Request example**:

    DELETE `"auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"2"}`


  **Response**:

    + `{
      "messages": "delete user success!"
    }`
* ####show user
  **URL**: [https://fit-ness-backend.herokuapp.com/api/users/:id](api/users/:id)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`

  **Request example**:

    GET `"auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"2"}`


  **Response**:

    + `{
      "messages": "delete user success!"
    }`
* ####all order
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders](api/orders/)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`

  **Request example**:

    GET `"auth_token"=>"7CuypTkZoTScPcHgLpWs"}`

  **Response**:

    + `[
      {
        "id": 3,
        "user_id": null,
        "created_date": null,
        "total_price": 122
      },
      {
        "id": 4,
        "user_id": null,
        "created_date": null,
        "total_price": 122
      },
    ]`
* ####filter transaction by date
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders](api/orders/)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`
     + `- filter_type: type: string[day| month| year], presence: true`
     + `- date: type: string, presence: true`
  **Request example**:

    GET `
    {"auth_token"=>"7CuypTkZoTScPcHgLpWs", "filter_type"=>"year", "date"=>"2016-08-23 17:00:00  0000"}`

  **Response**:

    + `[
      {
        "id": 3,
        "user_id": null,
        "created_date": null,
        "total_price": 122
      },
      {
        "id": 4,
        "user_id": null,
        "created_date": null,
        "total_price": 122
      },
    ]`
* ####create order
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders](api/orders/)

  **Method**: **POST**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `order[order_items_attributes][0][item_id]: type: int, presence: true`
    + `order[order_items_attributes][0][quantity]: type: int, presence: true`
    + `order[user_id]: type: int, presence: true`
  **Request example**:

    POST `
    {"order"=>{"user_id"=>"1", "order_items_attributes"=>{"0"=>{"item_id"=>"1", "quantity"=>"1"}}}, "auth_token"=>"7CuypTkZoTScPcHgLpWs"}
`

  **Response**:

    + `{
      "id": 7,
      "user_id": 1,
      "created_at": "2016-08-23T15:20:19.000Z",
      "total_price": 122,
      "messages": "create order success!"
    }`

* ####show order
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders/:id](api/orders/:id)

  **Method**: **GET**

  **Param request**:

    + `- auth_token: type: string, presence: true`
  **Request example**:

    GET `
{"auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"7"}`

  **Response**:

    + `{
  "id": 7,
  "user_id": 1,
  "created_at": "2016-08-23T15:20:19.000Z",
  "total_price": 122,
  "order_items": [
    {
      "id": 5,
      "order_id": 7,
      "item_id": 1,
      "quantity": 1,
      "created_at": "2016-08-23T15:20:19.000Z",
      "updated_at": "2016-08-23T15:20:19.000Z"
    }
  ]
}`
* ####update order
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders/:id](api/orders/:id)

  **Method**: **PUT**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `order[order_items_attributes][0][item_id]: type: int, presence: true`
    + `order[order_items_attributes][0][quantity]: type: int, presence: true`
    + `order[user_id]: type: int, presence: true`
    + `order[order_items_attributes][0][id] type: int, presence: true`
  **Request example**:

    PUT `{"order"=>{"user_id"=>"1", "order_items_attributes"=>{"0"=>{"item_id"=>"1", "quantity"=>"2", "id"=>"5"}}}, "auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"7"}
`

  **Response**:

    + `{
  "id": 7,
  "user_id": 1,
  "created_at": "2016-08-23T15:20:19.000Z",
  "total_price": 488,
  "messages": "update order success!",
  "order_items": [
    {
      "order_id": 7,
      "id": 5,
      "item_id": 1,
      "quantity": 2,
      "created_at": "2016-08-23T15:20:19.000Z",
      "updated_at": "2016-08-23T15:30:47.000Z"
    },
  ]
}`
* ####delete order
  **URL**: [https://fit-ness-backend.herokuapp.com/api/orders/:id](api/orders/:id)

  **Method**: **DELETE**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `- id: type: int, presence: true`

  **Request example**:

    DELETE ``

  **Response**:

    + `{
      "messages": "delete order success!"
    }`
* ####all meetings
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings](api/meetings/)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`

  **Request example**:

    GET `"auth_token"=>"7CuypTkZoTScPcHgLpWs"}`

  **Response**:
    + `[
        {
          "id": 10,
          "from_date": "2015-02-04T00:00:00.000Z",
          "to_date": "2015-02-05T00:00:00.000Z",
          "manager_id": 1,
          "user_meetings": [
            {
              "id": 6,
              "user_id": 1,
              "meeting_id": 10,
              "created_at": "2016-08-23T15:41:56.000Z",
              "updated_at": "2016-08-23T15:41:56.000Z"
            }
          ]
        },
        {
          "id": 8,
          "from_date": "2016-08-21T00:00:00.000Z",
          "to_date": "2016-08-21T00:00:00.000Z",
          "manager_id": 1,
          "user_meetings": [
            {
              "id": 2,
              "user_id": 1,
              "meeting_id": 8,
              "created_at": "2016-08-23T06:33:47.000Z",
              "updated_at": "2016-08-23T06:33:47.000Z"
            }
          ]
        }
      ]`

* ####filter meetings by date
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings](api/meetings/)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`
     + `- date: type: string, presence: true`
  **Request example**:

    GET `
   {"auth_token"=>"7CuypTkZoTScPcHgLpWs", "date"=>"2015-02-04T00:00:00.000Z"}`

  **Response**:

    + `[
     {
          "id": 10,
          "from_date": "2015-02-04T00:00:00.000Z",
          "to_date": "2015-02-05T00:00:00.000Z",
          "manager_id": 1,
          "user_meetings": [
            {
              "id": 6,
              "user_id": 1,
              "meeting_id": 10,
              "created_at": "2016-08-23T15:41:56.000Z",
              "updated_at": "2016-08-23T15:41:56.000Z"
            }
          ]
        }
    ]`
* ####show meetings
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings/:id](api/meetings/:id)

  **Method**: **GET**

  **Param request**:

     + `- auth_token: type: string, presence: true`
     + ` id: type: int, presence: true`
  **Request example**:

    GET `
   {"auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"10"}`

  **Response**:
    + `[
     {
          "id": 10,
          "from_date": "2015-02-04T00:00:00.000Z",
          "to_date": "2015-02-05T00:00:00.000Z",
          "manager_id": 1,
          "user_meetings": [
            {
              "id": 6,
              "user_id": 1,
              "meeting_id": 10,
              "created_at": "2016-08-23T15:41:56.000Z",
              "updated_at": "2016-08-23T15:41:56.000Z"
            }
          ]
        }
    ]`
* ####create meetings
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings/](api/meetings/)

  **Method**: **POST**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + `meeting[from_date] type: string, presence: true`
    + `meeting[to_date] type: string, presence: true`
    + `meeting[user_meetings_attributes][0][user_id] type: string, presence: true`
  **Request example**:

    POST `{"meeting"=>{"from_date"=>"2016-02-04", "to_date"=>"2016-02-05", "manager_id"=>"1", "user_meetings_attributes"=>{"0"=>{"user_id"=>"4"}}}, "auth_token"=>"7CuypTkZoTScPcHgLpWs"}`

  **Response**:
    + `{
  "id": 11,
  "from_date": "2016-02-04T00:00:00.000Z",
  "to_date": "2016-02-05T00:00:00.000Z",
  "manager_id": 1,
  "messages": "create meeting success!",
  "user_meetings": [
    {
      "id": 7,
      "user_id": 4,
      "meeting_id": 11,
      "created_at": "2016-08-23T16:06:49.000Z",
      "updated_at": "2016-08-23T16:06:49.000Z"
    }
  ]
}`

* ####update meetings
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings/:id](api/meetings/:id)

  **Method**: **PUT**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + ` id: type: int, presence: true`
    + `meeting[from_date] type: string, presence: true`
    + `meeting[to_date] type: string, presence: true`
    + `meeting[user_meetings_attributes][0][user_id] type: string, presence: true`
    + `meeting[user_meetings_attributes][0][id] type: string, presence: true`
  **Request example**:

    PUT `{"meeting"=>{"from_date"=>"2015-02-04", "to_date"=>"2015-02-05", "manager_id"=>"1", "user_meetings_attributes"=>{"0"=>{"user_id"=>"4", "id"=>"2"}}}, "auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"8"}
`

  **Response**:
    + `{
  "id": 8,
  "from_date": "2015-02-04T00:00:00.000Z",
  "to_date": "2015-02-05T00:00:00.000Z",
  "manager_id": 1,
  "messages": "update meeting success!",
  "user_meetings": [
    {
      "id": 2,
      "user_id": 4,
      "meeting_id": 8,
      "created_at": "2016-08-23T06:33:47.000Z",
      "updated_at": "2016-08-23T16:01:37.000Z"
    }
  ]
}`
* ####DELETE meetings
  **URL**: [https://fit-ness-backend.herokuapp.com/api/meetings/:id](api/meetings/:id)

  **Method**: **DELETE**

  **Param request**:

    + `- auth_token: type: string, presence: true`
    + ` id: type: int, presence: true`
  **Request example**:

    DELETE `{"auth_token"=>"7CuypTkZoTScPcHgLpWs", "id"=>"11"}
`

  **Response**:
    + `{
  "messages": "delete meeting success!"
}`

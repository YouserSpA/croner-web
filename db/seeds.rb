User.create!([
  {email: "mlandaetasanchez@gmail.com", encrypted_password: "$2a$10$S431r99Ce2YqDy9rFsjei.b1c4rK/ptrYbRWvW2QMRvJZRP6j0lxq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2014-12-08 19:48:48", last_sign_in_at: "2014-12-08 08:50:45", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: nil, address: nil, country: nil, customer_id: 1}
])
Attendance.create!([
  {event: "Ingreso", latitude: "-33.430009", longitude: "-70.625485", marked_at: "2014-12-02 08:13:00", employee_id: 1},
  {event: "Egreso", latitude: "-33.430008", longitude: "-70.625484", marked_at: "2014-12-03 13:22:00", employee_id: 1},
  {event: "Ingreso", latitude: "-33.430011", longitude: "-70.625487", marked_at: "2014-12-02 08:41:00", employee_id: 2},
  {event: "Egreso", latitude: "-33.430018", longitude: "-70.625490", marked_at: "2014-12-02 14:42:00", employee_id: 2},
  {event: "Ingreso", latitude: "-33.430111", longitude: "-70.625500", marked_at: "2014-12-02 08:45:00", employee_id: 3},
  {event: "Ingreso", latitude: "-34.430111", longitude: "-72.625485", marked_at: "2014-12-02 08:37:00", employee_id: 4},
  {event: "Ingreso", latitude: "-34.430111", longitude: "-69.625484", marked_at: "2014-12-02 08:41:00", employee_id: 4},
  {event: "Egreso", latitude: "-33.430111", longitude: "-59.625484", marked_at: "2014-12-02 17:56:00", employee_id: 4},
  {event: "Egreso", latitude: "-33.429001", longitude: "-70.625485", marked_at: "2014-12-02 19:46:00", employee_id: 3}
])
BranchOffice.create!([
  {name: "Casa central", country: "Chile", region: "Metropolitana", address: "Rafael Cañas #114 Oficina 1A. Metro Salvador Providencia", customer_id: 1}
])
Customer.create!([
  {name: "Requies", clientType: "SpA", status: 1, rut: "12222222222", email: "hola@requies.cl"}
])
Device.create!([
  {meid: "111111 11111 111", esn: "121212121221", imei: "1111 111111 11", wlanMacAddress: "12:32:23:23", employee_id: 1},
  {meid: "111111 11111  222", esn: "133212121221", imei: "1111 111111 22", wlanMacAddress: "12:32:23:25", employee_id: 2},
  {meid: "333333 11111  222", esn: "444444441221", imei: "2222 111111 22", wlanMacAddress: "12:32:23:31", employee_id: 3},
  {meid: "111111 333333 111", esn: "222244441221", imei: "1111 11122 11", wlanMacAddress: "12:32:23:66", employee_id: 4}
])
Employee.create!([
  {worker_id: "1", run: "1-9", names: "Mosheh-efra Osvaldo", lastnames: "Landaeta Sanchez", email: "mlandaetasanchez@gmail.com", addres: "Embajador Quintana 4368", birthdate: "2009-12-08", customer_id: 1, weekly_hours: 40, contract_type: "Diurno", avatar_file_name: "yo.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 6932, avatar_updated_at: "2014-12-08 08:12:20"},
  {worker_id: "2", run: "1-3", names: "Mario Luis", lastnames: "Lopez Landes", email: "mlopezlandes@gmail.com", addres: "San Pablo #7777", birthdate: "2009-12-08", customer_id: 1, weekly_hours: 45, contract_type: "Diurno", avatar_file_name: "mario.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 70684, avatar_updated_at: "2014-12-08 08:40:37"},
  {worker_id: "3", run: "15-1", names: "Javier", lastnames: "Cáceres", email: "wolfden00@gmail.com", addres: "Enla Otracuadra 4444", birthdate: "2009-12-08", customer_id: 1, weekly_hours: 45, contract_type: "Diurno", avatar_file_name: "javier.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 48416, avatar_updated_at: "2014-12-08 08:45:03"}
])

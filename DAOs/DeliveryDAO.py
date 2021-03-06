import random
from DAOs import db


class DeliveryDAO:
    def __init__(self):
        self.db = db.get_db()

    def getDelivery(self, order_id):
        return self.db.execute('SELECT * FROM placed_order WHERE order_id=?', (order_id,)).fetchone()

    def getDeliveries(self, client_id):
        return self.db.execute('SELECT order_id FROM client_order WHERE client_id=?', (client_id,)).fetchall()

    def getProductList(self, order_id):
        return self.db.execute('SELECT product_id, quantity FROM product_order WHERE order_id=?', (order_id,)) \
            .fetchall()

    def getTrackHistory(self, track_number):
        return self.db.execute('SELECT location, hub_date FROM delivery_history WHERE track_number=? '
                               'ORDER BY hub_date ASC', (track_number,)).fetchall()

    def addDelivery(self, client_id, payment_id):
        order_id = self.db.execute('SELECT MAX(order_id) FROM placed_order').fetchone()[0] + 1
        delivery_companies = ["LOGEN", "HYUNDAI", "CJ"]

        self.db.execute('INSERT INTO placed_order (track_number, delivery_company, last_status) VALUES (?, ?,?)',
                        (order_id, random.choice(delivery_companies), 0))
        self.db.execute('INSERT INTO client_order (client_id, order_id) VALUES (?, ?)', (client_id, order_id))
        self.db.execute('INSERT INTO payment_order (order_id, payment_id) VALUES (?, ?)', (order_id, payment_id))
        self.db.commit()

    def setStatus(self, order_id, status):
        self.db.execute('UPDATE placed_order SET last_status=? WHERE order_id=?', (status, order_id))
        self.db.commit()

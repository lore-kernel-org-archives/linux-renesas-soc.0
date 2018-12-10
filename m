Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC/RFT 01/10] i2c: add 'is_suspended' flag for i2c adapters
Date: Mon, 10 Dec 2018 22:02:59 +0100
Message-Id: <20181210210310.12677-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
References: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-pm@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some drivers open code handling of suspended adapters. It should be
handled by the core, though, to ensure generic handling. This patch adds
the flag and an accessor function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 1 +
 include/linux/i2c.h         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 28460f6a60cc..9f89e258c8ff 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1232,6 +1232,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (!adap->lock_ops)
 		adap->lock_ops = &i2c_adapter_lock_ops;
 
+	adap->is_suspended = false;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
 	mutex_init(&adap->userspace_clients_lock);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 65b4eaed1d96..9852038ee3a7 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -680,6 +680,7 @@ struct i2c_adapter {
 	int timeout;			/* in jiffies */
 	int retries;
 	struct device dev;		/* the adapter device */
+	unsigned int is_suspended:1;	/* owned by the I2C core */
 
 	int nr;
 	char name[48];
@@ -762,6 +763,14 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline void i2c_mark_adapter_suspended(struct i2c_adapter *adap,
+					      bool suspended)
+{
+	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
+	adap->is_suspended = suspended;
+	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
+}
+
 /*flags for the client struct: */
 #define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
 #define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

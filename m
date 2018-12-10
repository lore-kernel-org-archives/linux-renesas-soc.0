Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC/RFT 09/10] i2c: s3c2410: use core helper to mark adapter
 suspended
Date: Mon, 10 Dec 2018 22:03:07 +0100
Message-Id: <20181210210310.12677-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
References: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Rejecting transfers should be handled by the core. Also, this will
ensure proper locking which was forgotten in this open coded version.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 2f2e28d60ef5..7c76edb25514 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -104,7 +104,6 @@ enum s3c24xx_i2c_state {
 struct s3c24xx_i2c {
 	wait_queue_head_t	wait;
 	kernel_ulong_t		quirks;
-	unsigned int		suspended:1;
 
 	struct i2c_msg		*msg;
 	unsigned int		msg_num;
@@ -703,9 +702,6 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	unsigned long timeout;
 	int ret;
 
-	if (i2c->suspended)
-		return -EIO;
-
 	ret = s3c24xx_i2c_set_master(i2c);
 	if (ret != 0) {
 		dev_err(i2c->dev, "cannot get bus (error %d)\n", ret);
@@ -1246,7 +1242,7 @@ static int s3c24xx_i2c_suspend_noirq(struct device *dev)
 {
 	struct s3c24xx_i2c *i2c = dev_get_drvdata(dev);
 
-	i2c->suspended = 1;
+	i2c_mark_adapter_suspended(&i2c->adap, true);
 
 	if (!IS_ERR(i2c->sysreg))
 		regmap_read(i2c->sysreg, EXYNOS5_SYS_I2C_CFG, &i2c->sys_i2c_cfg);
@@ -1267,7 +1263,7 @@ static int s3c24xx_i2c_resume_noirq(struct device *dev)
 		return ret;
 	s3c24xx_i2c_init(i2c);
 	clk_disable(i2c->clk);
-	i2c->suspended = 0;
+	i2c_mark_adapter_suspended(&i2c->adap, false);
 
 	return 0;
 }
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

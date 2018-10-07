Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Stefan Lengfeld <contact@stefanchrist.eu>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.or, j-keerthy@ti.com,
        t-kristo@ti.com, grygorii.strashko@ti.com,
        andriy.shevchenko@linux.intel.com
Subject: [RFC PATCH 1/3] i2c: imx: implement master_xfer_irqless callback
Date: Sun,  7 Oct 2018 17:39:35 +0200
Message-Id: <20181007153937.16787-2-contact@stefanchrist.eu>
In-Reply-To: <20181007153937.16787-1-contact@stefanchrist.eu>
References: <20180923202034.qugs4fxucj7h4vri@porty>
 <20181007153937.16787-1-contact@stefanchrist.eu>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Rework the read and write code paths in the driver to support operation
in IRQ disabled contexts. The patch is currently tested only on a
phyCORE-i.MX6 Solo board.

The driver supports normal operation, DMA transfers and now the polling
mode or also called sleep-free or IRQ-less operation. It makes the code
not simpler or easier to read, but IRQ less I2C transfers are needed on
some hardware configurations, e.g. to trigger reboots on an external
PMIC chip.

Signed-off-by: Stefan Lengfeld <contact@stefanchrist.eu>
---
 drivers/i2c/busses/i2c-imx.c | 128 +++++++++++++++++++++++++++++++------------
 1 file changed, 93 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c406700789e1..af72a1cbedbe 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -404,7 +404,7 @@ static void i2c_imx_dma_free(struct imx_i2c_struct *i2c_imx)
 	dma->chan_using = NULL;
 }
 
-static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy)
+static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool polling)
 {
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
@@ -434,15 +434,39 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy)
 				"<%s> I2C bus is busy\n", __func__);
 			return -ETIMEDOUT;
 		}
-		schedule();
+		if (!polling)
+			schedule();
+		else
+			udelay(100);
 	}
 
 	return 0;
 }
 
-static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx)
+static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool polling)
 {
-	wait_event_timeout(i2c_imx->queue, i2c_imx->i2csr & I2SR_IIF, HZ / 10);
+	if (!polling) {
+		wait_event_timeout(i2c_imx->queue, i2c_imx->i2csr & I2SR_IIF, HZ / 10);
+	} else {
+		int counter = 0;
+
+		while (1) {
+			unsigned int reg;
+
+			reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+			i2c_imx->i2csr = reg;
+			if (reg & I2SR_IIF)
+				break;
+
+			if (counter > 1000) {
+				dev_err(&i2c_imx->adapter.dev, "<%s> TXR timeout\n", __func__);
+				return -EIO;
+			}
+			udelay(100);
+			counter++;
+		}
+		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
+	}
 
 	if (unlikely(!(i2c_imx->i2csr & I2SR_IIF))) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Timeout\n", __func__);
@@ -520,7 +544,7 @@ static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
+static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool polling)
 {
 	unsigned int temp = 0;
 	int result;
@@ -533,23 +557,32 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
 	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2CR);
 
 	/* Wait controller to be stable */
-	usleep_range(50, 150);
+	if (!polling)
+		usleep_range(50, 150);
+	else
+		udelay(50);
 
 	/* Start I2C transaction */
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp |= I2CR_MSTA;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-	result = i2c_imx_bus_busy(i2c_imx, 1);
+	result = i2c_imx_bus_busy(i2c_imx, 1, polling);
 	if (result)
 		return result;
 
-	temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
+	if (!polling) {
+		temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
+	} else {
+		temp |= I2CR_MTX | I2CR_TXAK;
+		temp &= ~I2CR_IIEN; /* Disable interrupt */
+	}
+
 	temp &= ~I2CR_DMAEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 	return result;
 }
 
-static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
+static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool polling)
 {
 	unsigned int temp = 0;
 
@@ -571,7 +604,7 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
 	}
 
 	if (!i2c_imx->stopped)
-		i2c_imx_bus_busy(i2c_imx, 0);
+		i2c_imx_bus_busy(i2c_imx, 0, polling);
 
 	/* Disable I2C controller */
 	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
@@ -652,7 +685,7 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	/* The last data byte must be transferred by the CPU. */
 	imx_i2c_write_reg(msgs->buf[msgs->len-1],
 				i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx);
+	result = i2c_imx_trx_complete(i2c_imx, false);
 	if (result)
 		return result;
 
@@ -711,7 +744,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 
 	msgs->buf[msgs->len-2] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 	/* read n byte data */
-	result = i2c_imx_trx_complete(i2c_imx);
+	result = i2c_imx_trx_complete(i2c_imx, false);
 	if (result)
 		return result;
 
@@ -724,7 +757,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-		i2c_imx_bus_busy(i2c_imx, 0);
+		i2c_imx_bus_busy(i2c_imx, 0, false);
 	} else {
 		/*
 		 * For i2c master receiver repeat restart operation like:
@@ -742,7 +775,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	return 0;
 }
 
-static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
+static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bool polling)
 {
 	int i, result;
 
@@ -751,7 +784,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx);
+	result = i2c_imx_trx_complete(i2c_imx, polling);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -765,7 +798,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
 			"<%s> write byte: B%d=0x%X\n",
 			__func__, i, msgs->buf[i]);
 		imx_i2c_write_reg(msgs->buf[i], i2c_imx, IMX_I2C_I2DR);
-		result = i2c_imx_trx_complete(i2c_imx);
+		result = i2c_imx_trx_complete(i2c_imx, polling);
 		if (result)
 			return result;
 		result = i2c_imx_acked(i2c_imx);
@@ -775,7 +808,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
 	return 0;
 }
 
-static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bool is_lastmsg)
+static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bool is_lastmsg, bool polling)
 {
 	int i, result;
 	unsigned int temp;
@@ -788,7 +821,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bo
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx);
+	result = i2c_imx_trx_complete(i2c_imx, polling);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -821,7 +854,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bo
 	for (i = 0; i < msgs->len; i++) {
 		u8 len = 0;
 
-		result = i2c_imx_trx_complete(i2c_imx);
+		result = i2c_imx_trx_complete(i2c_imx, polling);
 		if (result)
 			return result;
 		/*
@@ -849,7 +882,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bo
 				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 				temp &= ~(I2CR_MSTA | I2CR_MTX);
 				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-				i2c_imx_bus_busy(i2c_imx, 0);
+				i2c_imx_bus_busy(i2c_imx, 0, polling);
 			} else {
 				/*
 				 * For i2c master receiver repeat restart operation like:
@@ -880,8 +913,8 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs, bo
 	return 0;
 }
 
-static int i2c_imx_xfer(struct i2c_adapter *adapter,
-						struct i2c_msg *msgs, int num)
+static int i2c_imx_xfer_impl(struct i2c_adapter *adapter,
+			     struct i2c_msg *msgs, int num, bool polling)
 {
 	unsigned int i, temp;
 	int result;
@@ -895,11 +928,11 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 		goto out;
 
 	/* Start I2C transfer */
-	result = i2c_imx_start(i2c_imx);
+	result = i2c_imx_start(i2c_imx, polling);
 	if (result) {
 		if (i2c_imx->adapter.bus_recovery_info) {
 			i2c_recover_bus(&i2c_imx->adapter);
-			result = i2c_imx_start(i2c_imx);
+			result = i2c_imx_start(i2c_imx, polling);
 		}
 	}
 
@@ -917,7 +950,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 			temp |= I2CR_RSTA;
 			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-			result = i2c_imx_bus_busy(i2c_imx, 1);
+			result = i2c_imx_bus_busy(i2c_imx, 1, polling);
 			if (result)
 				goto fail0;
 		}
@@ -941,13 +974,17 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 			(temp & I2SR_SRW ? 1 : 0), (temp & I2SR_IIF ? 1 : 0),
 			(temp & I2SR_RXAK ? 1 : 0));
 #endif
-		if (msgs[i].flags & I2C_M_RD)
-			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg);
-		else {
-			if (i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
-				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
-			else
-				result = i2c_imx_write(i2c_imx, &msgs[i]);
+		if (msgs[i].flags & I2C_M_RD) {
+			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, polling);
+		} else {
+			if (!polling) {
+				if (i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
+					result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
+				else
+					result = i2c_imx_write(i2c_imx, &msgs[i], polling);
+			} else {
+				result = i2c_imx_write(i2c_imx, &msgs[i], polling);
+			}
 		}
 		if (result)
 			goto fail0;
@@ -955,7 +992,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 
 fail0:
 	/* Stop I2C transfer */
-	i2c_imx_stop(i2c_imx);
+	i2c_imx_stop(i2c_imx, polling);
 
 	pm_runtime_mark_last_busy(i2c_imx->adapter.dev.parent);
 	pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
@@ -967,6 +1004,18 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
+static int i2c_imx_xfer(struct i2c_adapter *adapter,
+			struct i2c_msg *msgs, int num)
+{
+	return i2c_imx_xfer_impl(adapter, msgs, num, false);
+}
+
+static int i2c_imx_xfer_irqless(struct i2c_adapter *adapter,
+				struct i2c_msg *msgs, int num)
+{
+	return i2c_imx_xfer_impl(adapter, msgs, num, true);
+}
+
 static void i2c_imx_prepare_recovery(struct i2c_adapter *adap)
 {
 	struct imx_i2c_struct *i2c_imx;
@@ -1039,8 +1088,9 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer	= i2c_imx_xfer,
-	.functionality	= i2c_imx_func,
+	.master_xfer = i2c_imx_xfer,
+	.master_xfer_irqless = i2c_imx_xfer_irqless,
+	.functionality = i2c_imx_func,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
@@ -1117,6 +1167,14 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	/* Set up platform driver data */
 	platform_set_drvdata(pdev, i2c_imx);
 
+	/*
+	 * Driver's PM callbacks are safe to be called in IRQ disabled
+	 * contexts. Providing this information to the PM subsystem is required
+	 * for the 'master_xfer_irqless' implementation that calls PM routines
+	 * in IRQ disabled/atomic contexts, too.
+	 */
+	pm_runtime_irq_safe(&pdev->dev);
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
-- 
2.16.4

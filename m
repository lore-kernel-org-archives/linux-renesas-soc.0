Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:36443 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965AbcEDMik (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 4 May 2016 08:38:40 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: wsa@the-dreams.de, linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] i2c: rcar: add DMA support
Date: Wed,  4 May 2016 14:38:23 +0200
Message-Id: <1462365503-8451-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make it possible to transfer i2c message buffers via DMA.
Start/Stop/Sending_Slave_Address and some data is still handled using
the old state machine, it is sending the bulk of the data that is done
via DMA.

The first byte of a transmission and the last two bytes of reception are
sent/received using PIO. This is needed for the HW to have access to the
first byte before DMA transmit and to be able to set the STOP condition
for DMA reception.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |   3 +
 drivers/i2c/busses/i2c-rcar.c                      | 237 ++++++++++++++++++++-
 2 files changed, 236 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index cf8bfc9..5f0cb50 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -19,6 +19,9 @@ Optional properties:
 - clock-frequency: desired I2C bus clock frequency in Hz. The absence of this
   property indicates the default frequency 100 kHz.
 - clocks: clock specifier.
+- dmas: Must contain a list of two references to DMA specifiers, one for
+  transmission, and one for reception.
+- dma-names: Must contain a list of two DMA names, "tx" and "rx".
 
 - i2c-scl-falling-time-ns: see i2c.txt
 - i2c-scl-internal-delay-ns: see i2c.txt
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 68ecb56..058f0a1 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -21,6 +21,8 @@
  */
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -43,6 +45,8 @@
 #define ICSAR	0x1C	/* slave address */
 #define ICMAR	0x20	/* master address */
 #define ICRXTX	0x24	/* data port */
+#define ICDMAER	0x3c	/* DMA enable */
+#define ICFBSCR	0x38	/* first bit setup cycle */
 
 /* ICSCR */
 #define SDBS	(1 << 3)	/* slave data buffer select */
@@ -78,6 +82,16 @@
 #define MDR	(1 << 1)
 #define MAT	(1 << 0)	/* slave addr xfer done */
 
+/* ICDMAER */
+#define RSDMAE	(1 << 3)	/* DMA Slave Received Enable */
+#define TSDMAE	(1 << 2)	/* DMA Slave Transmitted Enable */
+#define RMDMAE	(1 << 1)	/* DMA Master Received Enable */
+#define TMDMAE	(1 << 0)	/* DMA Master Transmitted Enable */
+
+/* ICFBSCR */
+#define TCYC06	0x04		/*  6*Tcyc delay 1st bit between SDA and SCL */
+#define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
+
 
 #define RCAR_BUS_PHASE_START	(MDBS | MIE | ESG)
 #define RCAR_BUS_PHASE_DATA	(MDBS | MIE)
@@ -120,6 +134,12 @@ struct rcar_i2c_priv {
 	u32 flags;
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
+
+	struct resource *res;
+	struct dma_chan *dma_tx;
+	struct dma_chan *dma_rx;
+	struct scatterlist sg;
+	enum dma_data_direction dma_direction;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -287,6 +307,121 @@ static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
 /*
  *		interrupt functions
  */
+static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
+{
+	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
+		? priv->dma_rx : priv->dma_tx;
+
+	/* Disable DMA Master Received/Transmitted */
+	rcar_i2c_write(priv, ICDMAER, 0);
+
+	/* Reset default delay */
+	rcar_i2c_write(priv, ICFBSCR, TCYC06);
+
+	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
+			 priv->msg->len, priv->dma_direction);
+
+	priv->dma_direction = DMA_NONE;
+}
+
+static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv)
+{
+	if (priv->dma_direction == DMA_NONE)
+		return;
+	else if (priv->dma_direction == DMA_FROM_DEVICE)
+		dmaengine_terminate_all(priv->dma_rx);
+	else if (priv->dma_direction == DMA_TO_DEVICE)
+		dmaengine_terminate_all(priv->dma_tx);
+
+	rcar_i2c_dma_unmap(priv);
+}
+
+static void rcar_i2c_dma_callback(void *data)
+{
+	struct rcar_i2c_priv *priv = data;
+
+	priv->pos += sg_dma_len(&priv->sg);
+
+	rcar_i2c_dma_unmap(priv);
+}
+
+static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
+{
+	struct device *dev = rcar_i2c_priv_to_dev(priv);
+	struct i2c_msg *msg = priv->msg;
+	bool read = msg->flags & I2C_M_RD;
+	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	struct dma_chan *chan = read ? priv->dma_rx : priv->dma_tx;
+	struct dma_async_tx_descriptor *txdesc;
+	dma_addr_t dma_addr;
+	dma_cookie_t cookie;
+	unsigned char *buf;
+	int len;
+
+	/* Do not use DMA for messages shorter then 8 bytes */
+	if (msg->len < 8)
+		return;
+
+	if (IS_ERR(chan))
+		return;
+
+	if (read) {
+		/*
+		 * The last two bytes needs to be fetched using PIO in
+		 * order for the STOP phase to work.
+		 */
+		buf = priv->msg->buf;
+		len = priv->msg->len - 2;
+	} else {
+		/*
+		 * First byte in message was sent using PIO.
+		 */
+		buf = priv->msg->buf + 1;
+		len = priv->msg->len - 1;
+	}
+
+	dma_addr = dma_map_single(chan->device->dev, buf, len, dir);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_dbg(dev, "dma map failed, using PIO\n");
+		return;
+	}
+
+	sg_dma_len(&priv->sg) = len;
+	sg_dma_address(&priv->sg) = dma_addr;
+
+	priv->dma_direction = dir;
+
+	txdesc = dmaengine_prep_slave_sg(chan, &priv->sg, 1,
+					 read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
+					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!txdesc) {
+		dev_dbg(dev, "dma prep slave sg failed, using PIO\n");
+		rcar_i2c_cleanup_dma(priv);
+		return;
+	}
+
+	txdesc->callback = rcar_i2c_dma_callback;
+	txdesc->callback_param = priv;
+
+	cookie = dmaengine_submit(txdesc);
+	if (dma_submit_error(cookie)) {
+		dev_dbg(dev, "submitting dma failed, using PIO\n");
+		rcar_i2c_cleanup_dma(priv);
+		return;
+	}
+
+	/* Set delay for DMA operations */
+	rcar_i2c_write(priv, ICFBSCR, TCYC17);
+
+	/* Enable DMA Master Received/Transmitted */
+	if (read)
+		rcar_i2c_write(priv, ICDMAER, RMDMAE);
+	else
+		rcar_i2c_write(priv, ICDMAER, TMDMAE);
+
+	dma_async_issue_pending(chan);
+}
+
 static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
@@ -306,6 +441,12 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 		rcar_i2c_write(priv, ICRXTX, msg->buf[priv->pos]);
 		priv->pos++;
 
+		/*
+		 * Try to use DMA to transmit the rest of the data if
+		 * address transfer pashe just finished.
+		 */
+		if (msr & MAT)
+			rcar_i2c_dma(priv);
 	} else {
 		/*
 		 * The last data was pushed to ICRXTX on _PREV_ empty irq.
@@ -340,7 +481,11 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		return;
 
 	if (msr & MAT) {
-		/* Address transfer phase finished, but no data at this point. */
+		/*
+		 * Address transfer phase finished, but no data at this point.
+		 * Try to use DMA to receive data.
+		 */
+		rcar_i2c_dma(priv);
 	} else if (priv->pos < msg->len) {
 		/* get received data */
 		msg->buf[priv->pos] = rcar_i2c_read(priv, ICRXTX);
@@ -472,6 +617,81 @@ out:
 	return IRQ_HANDLED;
 }
 
+static struct dma_chan *rcar_i2c_request_dma_chan(struct device *dev,
+					enum dma_transfer_direction dir,
+					dma_addr_t port_addr)
+{
+	struct dma_chan *chan;
+	struct dma_slave_config cfg;
+	char *chan_name = dir == DMA_MEM_TO_DEV ? "tx" : "rx";
+	int ret;
+
+	chan = dma_request_slave_channel_reason(dev, chan_name);
+	if (IS_ERR(chan)) {
+		ret = PTR_ERR(chan);
+		dev_dbg(dev, "request_channel failed for %s (%d)\n",
+			chan_name, ret);
+		return chan;
+	}
+
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.direction = dir;
+	if (dir == DMA_MEM_TO_DEV) {
+		cfg.dst_addr = port_addr;
+		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	} else {
+		cfg.src_addr = port_addr;
+		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	}
+
+	ret = dmaengine_slave_config(chan, &cfg);
+	if (ret) {
+		dev_dbg(dev, "slave_config failed for %s (%d)\n",
+			chan_name, ret);
+		dma_release_channel(chan);
+		return ERR_PTR(ret);
+	}
+
+	dev_dbg(dev, "got DMA channel for %s\n", chan_name);
+	return chan;
+}
+
+static void rcar_i2c_request_dma(struct rcar_i2c_priv *priv,
+				 struct i2c_msg *msg)
+{
+	struct device *dev = rcar_i2c_priv_to_dev(priv);
+	bool read;
+	struct dma_chan *chan;
+	enum dma_transfer_direction dir;
+
+	read = msg->flags & I2C_M_RD;
+
+	chan = read ? priv->dma_rx : priv->dma_tx;
+	if (PTR_ERR(chan) != -EPROBE_DEFER)
+		return;
+
+	dir = read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+	chan = rcar_i2c_request_dma_chan(dev, dir, priv->res->start + ICRXTX);
+
+	if (read)
+		priv->dma_rx = chan;
+	else
+		priv->dma_tx = chan;
+}
+
+static void rcar_i2c_release_dma(struct rcar_i2c_priv *priv)
+{
+	if (!IS_ERR(priv->dma_tx)) {
+		dma_release_channel(priv->dma_tx);
+		priv->dma_tx = ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (!IS_ERR(priv->dma_rx)) {
+		dma_release_channel(priv->dma_rx);
+		priv->dma_rx = ERR_PTR(-EPROBE_DEFER);
+	}
+}
+
 static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 				struct i2c_msg *msgs,
 				int num)
@@ -493,6 +713,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
+		rcar_i2c_request_dma(priv, msgs + i);
 	}
 
 	/* init first message */
@@ -504,6 +725,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	time_left = wait_event_timeout(priv->wait, priv->flags & ID_DONE,
 				     num * adap->timeout);
 	if (!time_left) {
+		rcar_i2c_cleanup_dma(priv);
 		rcar_i2c_init(priv);
 		ret = -ETIMEDOUT;
 	} else if (priv->flags & ID_NACK) {
@@ -516,6 +738,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 out:
 	pm_runtime_put(dev);
 
+
 	if (ret < 0 && ret != -ENXIO)
 		dev_err(dev, "error %d : %x\n", ret, priv->flags);
 
@@ -591,7 +814,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 {
 	struct rcar_i2c_priv *priv;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct i2c_timings i2c_t;
 	int irq, ret;
@@ -606,8 +828,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->io = devm_ioremap_resource(dev, res);
+	priv->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	priv->io = devm_ioremap_resource(dev, priv->res);
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
@@ -626,6 +849,11 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	i2c_parse_fw_timings(dev, &i2c_t, false);
 
+	/* Init DMA */
+	sg_init_table(&priv->sg, 1);
+	priv->dma_direction = DMA_NONE;
+	priv->dma_rx = priv->dma_tx = ERR_PTR(-EPROBE_DEFER);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 	ret = rcar_i2c_clock_calculate(priv, &i2c_t);
@@ -673,6 +901,7 @@ static int rcar_i2c_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	i2c_del_adapter(&priv->adap);
+	rcar_i2c_release_dma(priv);
 	if (priv->flags & ID_P_PM_BLOCKED)
 		pm_runtime_put(dev);
 	pm_runtime_disable(dev);
-- 
2.8.2

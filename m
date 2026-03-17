Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6323CB2CD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752819; cv=none; b=spJWF+1HxX2ZW2r1qAjEdr5V+a/WKm9qpLfkoQe7/StTynIHHUvsYS365HMM/xdGdr2jnWIXqktRxWwC033NtlV7+2s/0Nz13WKBUF1tXrLZ1MyCy7rbQ7XfuXnVNpUFNSnHqS9dxKZ1FErQoxHuxxu26aoyj1DqsOnDkDVCtMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752819; c=relaxed/simple;
	bh=gaP2BF6uTIp8tmP1ihOfCRsjwAXcQE4ggeO5pfRtL7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH3nOZdbyjC0MhVe+w73FZaRZrK+likeIHgvOog0bDUou/DFWcd1OHr417RChWdxnX9SVRD+jP/XerLRLfXEBNnVytTvJaH2+G6batm3MIu/qPXoMkZD6KLsLN5koSxGsqMdESKrfpT+ENGd8xuEXk2b4dqHmgNsYg2lzCOYcuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LwznLAF/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LwznLAF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xdWoHSZWX+22gooZFZs/PDMfqpwJKA5xPignriyUEDI=; b=LwznLA
	F/Y3JLRER9eIYqG5NLdQBy/Nf9G5ArdE9cqukE25VJ9+4UT85CdwqNhjsnUc/tGH
	IKX4aIMDqWhG2pS/fAG0uJoq78kH2fW43EkNF1vSRhkoaoMYN1RkjZjkxckFd9ma
	c16guL9Zdr/5dNnZN/0/c0yIq872Rpmp7BPrOjUT16ZVLl2dcWxaE9eFwTDSiraE
	GQNiIw4XUwYlPfcx35EWPYZuxSOakTqIra7Ddy93qt5FgqLiLmgS28IcRE/RElmh
	021OfbOiT+8pHbUTn6NGmX1hYi/kvS5ciqzgwfNsmeKU4i2K6sDsoKEs9MZ6bdwe
	cSBGxkd+UL1XWpog==
Received: (qmail 287651 invoked from network); 17 Mar 2026 14:06:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 14:06:55 +0100
X-UD-Smtp-Session: l3s3148p1@ZiF6AjhN+I8+XdJ7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
Date: Tue, 17 Mar 2026 14:06:35 +0100
Message-ID: <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas R-Car MFIS offers multiple features but most importantly
mailboxes and hwspinlocks. Because they share a common register space
and a common register unprotection mechanism, a single driver was chosen
to handle all dependencies. (MFD and auxiliary bus have been tried as
well, but they failed because of circular dependencies.)

In this first step, the driver implements common register access and a
mailbox controller. hwspinlock support will be added incrementally, once
the subsystem allows out-of-directory drivers.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This driver is already prepared for upcoming r8a78001 support which will
break away from the IICR/EICR register pair. Actual support will be
added later once HW is available.

 drivers/soc/renesas/Kconfig     |   9 +
 drivers/soc/renesas/Makefile    |   1 +
 drivers/soc/renesas/rcar-mfis.c | 325 ++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)
 create mode 100644 drivers/soc/renesas/rcar-mfis.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 26bed0fdceb0..6c472c951ab3 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -465,6 +465,15 @@ config ARCH_R9A07G043
 
 endif # RISCV
 
+config RCAR_MFIS
+	tristate "Renesas R-Car MFIS driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on MAILBOX
+	help
+	  Select this option to enable the Renesas R-Car MFIS core driver for
+	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
+	  is needed to communicate with the SCP.
+
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 655dbcb08747..21eb78a05fc0 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SYS_R9A09G056)	+= r9a09g056-sys.o
 obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
+obj-$(CONFIG_RCAR_MFIS)		+= rcar-mfis.o
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
 obj-$(CONFIG_RZN1_IRQMUX)	+= rzn1_irqmux.o
diff --git a/drivers/soc/renesas/rcar-mfis.c b/drivers/soc/renesas/rcar-mfis.c
new file mode 100644
index 000000000000..5fb9cd352b76
--- /dev/null
+++ b/drivers/soc/renesas/rcar-mfis.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Renesas R-Car MFIS (Multifunctional Interface) driver
+ *
+ * Copyright (C) Renesas Solutions Corp.
+ * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ * Wolfram Sang <wsa+renesas@sang-engineering.com>
+ */
+#include <dt-bindings/mailbox/renesas,r8a78000-mfis.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define MFISWPCNTR	0x0900
+#define MFISWACNTR	0x0904
+
+#define MFIS_UNPROTECT_KEY 0xACCE0000
+
+struct mfis_priv;
+
+struct mfis_reg {
+	void __iomem *base;
+	resource_size_t start;
+	struct mfis_priv *priv;
+};
+
+struct mfis_info {
+	u32 unprotect_mask;
+	unsigned int mb_num_channels;
+	unsigned int mb_reg_comes_from_dt:1;
+	unsigned int mb_tx_uses_eicr:1;
+	unsigned int mb_channels_are_unidir:1;
+};
+
+struct mfis_per_chan_priv {
+	u32 reg;
+	int irq;
+};
+
+struct mfis_priv {
+	struct device *dev;
+	struct mfis_reg common_reg;
+	struct mfis_reg mbox_reg;
+	const struct mfis_info *info;
+
+	/* mailbox private data */
+	struct mbox_controller mbox;
+	struct mfis_per_chan_priv *per_chan_privs;
+};
+
+static u32 mfis_read(struct mfis_reg *mreg, unsigned int reg)
+{
+	return ioread32(mreg->base + reg);
+}
+
+static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
+{
+	struct mfis_priv *priv = mreg->priv;
+	u32 unprotect_mask = priv->info->unprotect_mask;
+	u32 unprotect_code;
+
+	/*
+	 * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
+	 * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
+	 */
+	unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
+			 ((mreg->start | reg) & unprotect_mask);
+
+	iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
+	iowrite32(val, mreg->base + reg);
+}
+
+/****************************************************
+ *			Mailbox
+ ****************************************************/
+
+#define mfis_mb_mbox_to_priv(_m) container_of((_m), struct mfis_priv, mbox)
+
+static irqreturn_t mfis_mb_iicr_interrupt(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
+
+	mbox_chan_received_data(chan, NULL);
+	/* Stop remote(!) doorbell */
+	mfis_write(&priv->mbox_reg, per_chan_priv->reg, 0);
+
+	return IRQ_HANDLED;
+}
+
+static int mfis_mb_startup(struct mbox_chan *chan)
+{
+	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
+	int ret = 0;
+
+	if (per_chan_priv->irq)
+		ret = request_irq(per_chan_priv->irq, mfis_mb_iicr_interrupt, 0,
+				  dev_name(chan->mbox->dev), chan);
+
+	return ret;
+}
+
+static void mfis_mb_shutdown(struct mbox_chan *chan)
+{
+	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
+
+	free_irq(per_chan_priv->irq, chan);
+}
+
+static int mfis_mb_iicr_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
+
+	/* Our doorbell still active? */
+	if (mfis_read(&priv->mbox_reg, per_chan_priv->reg) & 1)
+		return -EBUSY;
+
+	/* Start our doorbell */
+	mfis_write(&priv->mbox_reg, per_chan_priv->reg, 1);
+
+	return 0;
+}
+
+static bool mfis_mb_iicr_last_tx_done(struct mbox_chan *chan)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
+	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
+
+	/* Our doorbell still active? */
+	return !(mfis_read(&priv->mbox_reg, per_chan_priv->reg) & 1);
+}
+
+/* For MFIS variants using the IICR/EICR register pair */
+static const struct mbox_chan_ops mfis_iicr_ops = {
+	.startup = mfis_mb_startup,
+	.shutdown = mfis_mb_shutdown,
+	.send_data = mfis_mb_iicr_send_data,
+	.last_tx_done = mfis_mb_iicr_last_tx_done,
+};
+
+static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
+					  const struct of_phandle_args *sp)
+{
+	struct mfis_priv *priv = mfis_mb_mbox_to_priv(mbox);
+	struct mfis_per_chan_priv *per_chan_priv;
+	struct mbox_chan *chan;
+	u32 chan_num, chan_flags;
+	bool tx_uses_eicr, is_only_rx;
+
+	if (sp->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	chan_num = sp->args[0];
+	chan_flags = sp->args[1];
+
+	/* Channel layout is described in mfis_mb_probe() */
+	if (priv->info->mb_channels_are_unidir) {
+		is_only_rx = chan_flags & MFIS_CHANNEL_RX;
+		chan = mbox->chans + 2 * chan_num + is_only_rx;
+	} else {
+		is_only_rx = false;
+		chan = mbox->chans + chan_num;
+	}
+
+	if (priv->info->mb_reg_comes_from_dt) {
+		tx_uses_eicr = chan_flags & MFIS_CHANNEL_EICR;
+		if (tx_uses_eicr)
+			chan += mbox->num_chans / 2;
+	} else {
+		tx_uses_eicr = priv->info->mb_tx_uses_eicr;
+	}
+
+	per_chan_priv = chan->con_priv;
+	per_chan_priv->reg = chan_num * 0x1000 + (tx_uses_eicr ^ is_only_rx) * 4;
+
+	if (!priv->info->mb_channels_are_unidir || is_only_rx) {
+		char irqname[8];
+		char suffix = tx_uses_eicr ? 'i' : 'e';
+
+		/* "ch0i" or "ch0e" */
+		scnprintf(irqname, sizeof(irqname), "ch%d%c", chan_num, suffix);
+
+		per_chan_priv->irq = of_irq_get_byname(mbox->dev->of_node, irqname);
+		if (per_chan_priv->irq < 0)
+			return ERR_PTR(per_chan_priv->irq);
+		else if (per_chan_priv->irq == 0)
+			return ERR_PTR(-ENOENT);
+	}
+
+	return chan;
+}
+
+static int mfis_mb_probe(struct mfis_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct mbox_chan *chan;
+	struct mbox_controller *mbox;
+	unsigned int i, num_chan = priv->info->mb_num_channels;
+
+	if (priv->info->mb_channels_are_unidir)
+		/* Channel layout: Ch0-TX, Ch0-RX, Ch1-TX... */
+		num_chan *= 2;
+
+	if (priv->info->mb_reg_comes_from_dt)
+		/* Channel layout: <n> IICR channels, <n> EICR channels */
+		num_chan *= 2;
+
+	chan  = devm_kcalloc(dev, num_chan, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	priv->per_chan_privs = devm_kcalloc(dev, num_chan, sizeof(*priv->per_chan_privs),
+					    GFP_KERNEL);
+	if (!priv->per_chan_privs)
+		return -ENOMEM;
+
+	mbox = &priv->mbox;
+
+	for (i = 0; i < num_chan; i++)
+		chan[i].con_priv = &priv->per_chan_privs[i];
+
+	mbox->chans = chan;
+	mbox->num_chans = num_chan;
+	mbox->txdone_poll = true;
+	mbox->ops = &mfis_iicr_ops;
+	mbox->dev = dev;
+	mbox->of_xlate = mfis_mb_of_xlate;
+
+	return mbox_controller_register(mbox);
+}
+
+/****************************************************
+ *		Common
+ ****************************************************/
+static int mfis_reg_probe(struct platform_device *pdev, struct mfis_priv *priv,
+			  struct mfis_reg *mreg, const char *name, bool required)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+
+	/* If there is no mailbox resource, registers are in the common space */
+	if (!res && !required) {
+		priv->mbox_reg = priv->common_reg;
+	} else {
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		mreg->base = base;
+		mreg->start = res->start;
+		mreg->priv = priv;
+	}
+
+	return 0;
+}
+
+static int mfis_probe(struct platform_device *pdev)
+{
+	struct mfis_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->info = of_device_get_match_data(dev);
+
+	ret = mfis_reg_probe(pdev, priv, &priv->common_reg, "common", true);
+	if (ret)
+		return ret;
+
+	ret = mfis_reg_probe(pdev, priv, &priv->mbox_reg, "mboxes", false);
+	if (ret)
+		return ret;
+
+	return mfis_mb_probe(priv);
+}
+
+static const struct mfis_info mfis_info_r8a78000 = {
+	.unprotect_mask	= 0x000fffff,
+	.mb_num_channels = 64,
+	.mb_reg_comes_from_dt = true,
+	.mb_channels_are_unidir = true,
+};
+
+static const struct mfis_info mfis_info_r8a78000_scp = {
+	.unprotect_mask	= 0x000fffff,
+	.mb_num_channels = 32,
+	.mb_tx_uses_eicr = true,
+	.mb_channels_are_unidir = true,
+};
+
+static const struct of_device_id mfis_mfd_of_match[] = {
+	{ .compatible = "renesas,r8a78000-mfis", .data = &mfis_info_r8a78000, },
+	{ .compatible = "renesas,r8a78000-mfis-scp", .data = &mfis_info_r8a78000_scp, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mfis_mfd_of_match);
+
+static struct platform_driver mfis_driver = {
+	.driver = {
+		.name = "rcar-mfis",
+		.of_match_table = mfis_mfd_of_match,
+	},
+	.probe	= mfis_probe,
+};
+module_platform_driver(mfis_driver);
+
+MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
+MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Renesas R-Car MFIS driver");
-- 
2.51.0


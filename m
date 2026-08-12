Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E984435AA1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535421; cv=none; b=n80XzhtjNGgY34THMqLW5fMMrBZ7D3P5DvfbO2N4bxOELza4Pz+O7bPdk9ZkD77KLZI80f4pG+KQLBbOkqEHZgNabWpiBAjj1frpQtrDROoZWixlzk87YMb4me59JwPrDE2+zmpitpqv1VVUt8tElL1muqX5G4SDHvXOIOFmCC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535421; c=relaxed/simple;
	bh=O3XwjStOaxxkm6S+xsfQIly9TfHEqpXVApRGfmtkooE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoYS21qH9hQ1L9aInAq1k1Q06y7FAJ4qovooL5fE8YyEkF85orPJkF1V/uqKSCT8XJRoQ47u2NbhmDEV5bqsdPrXe2p/6oDLj4Q+PG46gSWV1QAPVDgrhr2WU7D4/URJcY/HwYsWmVZZZkzgoPe0XstzDHJhcywkvSVPNN4NLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXu+mgbV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXu+mgbV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956242332dso7623075e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786535416; x=1787140216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkkjL7JZr7VOG0pjsLKe6o2AuEC+HHEDjz0jBPa85Ow=;
        b=YXu+mgbVPNMjTX98vL19/rgiVQNJI57ztjLb6k1SgEB14ZWwMc9++2ikADZ4NDeAM3
         iYOZ1jhmUcLWQypjIviphSzc60KkfdN8YqNJ71YtYxWHbLX6OxDvTTvkyqkFYl9YlrYU
         sI24hGmfe9Fg67mD1C+WOabkKUqZ1skGAX7IedIaCSdPYHSu/ZjkfWu21mwXDbRZtYyI
         14oVV+3CcCPcncyLR/3Lq0p4wFBQnWyVpno6tNlJ4u9soV9L/4578K71fMZVmvt1M/oF
         gu5IBhmpCfsBIYunoz3avQs5evStKI0va2uIU9p3zCiKq5UI8KSPS6/Prx+gRenYqyfN
         Ou0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535416; x=1787140216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkkjL7JZr7VOG0pjsLKe6o2AuEC+HHEDjz0jBPa85Ow=;
        b=HPLBIL2q6FuRXC2Chdgvor9jMHrG2reEU1W3VCBA5Fzuxg7OOOWIPhN9nObEtTAqdD
         n/KJBSxQugmzrK23afQjIRo1vRbQrvbd3C38V0B9x0GL/RoTBz6ZmA9lVsNMV/dC/tet
         0ahM3otOI0me6GuU8oA9Pp3SANhGJNsmehPo50fCXCDRyEdGCozTmoG+w+n4nMRh4jRC
         LyI7fCgqv/IotMJq0F+yyKDhtlJv7+qIavkLHYwTDWUYWuqq/GshvClHMfRp+IBE/LrU
         ltszatHU/GwzfiFAU/0oY/ib8W6DwU4hCOPUOHP3fUaB1yQt8rj809Q16iwVtfZfaw/j
         LY+g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0W6OkwzdRcK8paIJvFvsMuqUGYFHGG30elfmkvHGYlUmQjpneNNNSEwhfx5rvDhm5o4K5hwsFWsoqK7enqkDscA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05el0mOtLaPOq4yOV29avo3ApXnSg5eltHJ+NR/zc0USIQ8gF
	5aRvF+NY8LILGrijg/FV2NYG8/JCUYm8gJt9u47DpcrhPJx1FcILyPUD
X-Gm-Gg: AR+sD12CP8LujPX7wMTBFREafd6+wxPGb1ASbGXrWzMyX/C9JHyeHNHZ6w52BGB+1Hh
	DBx6pDdLsAOWWAUcuU+R1g8p91qshruZQR5KrcyVp7QCMvNc7ArfTF7splkK75jVsmsXBWhskKx
	oMkFkpQVhUhI5AabtJDR9IYKqmfPFdWvf9tbIrfGx//frdBbwAe8VWbT7+xk/I3fWQwe4J5Ae/T
	/FBEaxelEDsIQRdNXlI4meBcq2tQbiAUd5pUXKWd5ajn+KdXeU4sQohXFu77tGaepcpDerQlzNx
	SvzmepgWlpzSB17UPgso0gqVzgT7w0JK5OYh+1XLdleLPL4p/H674mYC7GW90BYWbIw/isv7Htl
	zlwSay+yTutCno4fOd7rNmTPiZyBYpnlZMMNwXdyOAKlxZwnPIS2WdSexOUrkiIGLaj6NRw1mbo
	7/RzMoIb8hV9qw2cyik4uRItH3N3Y6UdlwdQNQbu3DjY8LbtVz58f2Tp/TJImPRaVV3ykVuz9ni
	aOGddGIXJWG9w==
X-Received: by 2002:a05:600c:8b52:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-4997c0e6f2emr70408475e9.3.1786535415543;
        Wed, 12 Aug 2026 04:50:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815231c308sm6219090f8f.11.2026.08.12.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:50:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] power: sequencing: Add Renesas RZ/G3L Power Ready driver
Date: Wed, 12 Aug 2026 12:50:04 +0100
Message-ID: <20260812115010.108322-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
SoC. The driver binds as an auxiliary device to the parent SYSC driver,
using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
{usb,dsi,csi}-pwrrdy pwrseq targets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Kconfig selects AUXILIARY_BUS to avoid compilation issues.
 * Added match for consumer device and added of_device.h header file.
 * Replaced regmap_update_bits()->regmap_assign_bits() and updated
   the function parameter of pwrseq_rzg3l_set_pwrrdy().
 * Simpilfied probe() return with PTR_ERR_OR_ZERO macro.
v1->v2:
 * Added a comment in pwrseq_rzg3l_pwrrdy_match().
 * Dropped dev_get_regmap() from probe as regmap is now part of platform
   data.
 * Added a blank line before devm_pwrseq_device_register() in probe.
 * Dropped the error message devm_pwrseq_device_register() as probe prints
   failure message.
 * Dropped local variables dev and regmap from probe().
---
 drivers/power/sequencing/Kconfig              |   9 ++
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 147 ++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..286d4e300845 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -27,6 +27,15 @@ config POWER_SEQUENCING_QCOM_WCN
 	  this driver is needed for correct power control or else we'd risk not
 	  respecting the required delays between enabling Bluetooth and WLAN.
 
+config POWER_SEQUENCING_RENESAS_PWRRDY
+	tristate "Renesas Power Ready sequencing driver"
+	depends on SYSC_RZ || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  Say Y here to enable the power sequencing driver for the Renesas
+	  Power Ready signals. This driver handles the power ready signals
+	  required to power on the various IP's on RZ/G3L platform.
+
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
 	depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index 0911d4618298..b33d08d82f43 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_POWER_SEQUENCING)		+= pwrseq-core.o
 pwrseq-core-y				:= core.o
 
 obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
+obj-$(CONFIG_POWER_SEQUENCING_RENESAS_PWRRDY) += pwrseq-renesas-pwrrdy.o
 obj-$(CONFIG_POWER_SEQUENCING_TH1520_GPU) += pwrseq-thead-gpu.o
 obj-$(CONFIG_POWER_SEQUENCING_PCIE_M2)	+= pwrseq-pcie-m2.o
diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
new file mode 100644
index 000000000000..8dfc65034a1c
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3L Power Ready driver
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/regmap.h>
+
+#define SYS_PWRRDY_N		0xd70
+#define SYS_PWRRDY_N_USB_MASK	BIT(0)
+#define SYS_PWRRDY_N_DSI_MASK	BIT(1)
+#define SYS_PWRRDY_N_CSI_MASK	BIT(2)
+
+static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
+				   bool val)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+
+	return regmap_assign_bits(regmap, SYS_PWRRDY_N, mask, val);
+}
+
+static int pwrseq_rzg3l_usb_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_USB_MASK, 0);
+}
+
+static int pwrseq_rzg3l_usb_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_USB_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_usb_pwrrdy_unit = {
+	.name = "usb-pwrrdy-power-sequence",
+	.enable = pwrseq_rzg3l_usb_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_usb_pwrrdy_disable,
+};
+
+static int pwrseq_rzg3l_dsi_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_DSI_MASK, 0);
+}
+
+static int pwrseq_rzg3l_dsi_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_DSI_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_dsi_pwrrdy_unit = {
+	.name = "dsi-pwrrdy-sequence",
+	.enable = pwrseq_rzg3l_dsi_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_dsi_pwrrdy_disable,
+};
+
+static int pwrseq_rzg3l_csi_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_CSI_MASK, 0);
+}
+
+static int pwrseq_rzg3l_csi_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_CSI_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_csi_pwrrdy_unit = {
+	.name = "csi-pwrrdy-power-sequence",
+	.enable = pwrseq_rzg3l_csi_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_csi_pwrrdy_disable,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_usb_pwrrdy_target = {
+	.name = "usb-pwrrdy",
+	.unit = &pwrseq_rzg3l_usb_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_dsi_pwrrdy_target = {
+	.name = "dsi-pwrrdy",
+	.unit = &pwrseq_rzg3l_dsi_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_csi_pwrrdy_target = {
+	.name = "csi-pwrrdy",
+	.unit = &pwrseq_rzg3l_csi_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_rzg3l_pwrrdy_targets[] = {
+	&pwrseq_rzg3l_usb_pwrrdy_target,
+	&pwrseq_rzg3l_dsi_pwrrdy_target,
+	&pwrseq_rzg3l_csi_pwrrdy_target,
+	NULL
+};
+
+static int pwrseq_rzg3l_pwrrdy_match(struct pwrseq_device *pwrseq,
+				     struct device *dev)
+{
+	static const struct of_device_id pwrseq_rzg3l_consumer_match[] = {
+		{ .compatible = "renesas,r9a08g046-mipi-dsi" },
+		{ .compatible = "renesas,r9a08g046-usbphy-ctrl" },
+		{ /* sentinel */ }
+	};
+	const struct of_device_id *match;
+
+	match = of_match_device(pwrseq_rzg3l_consumer_match, dev);
+	if (!match)
+		return PWRSEQ_NO_MATCH;
+
+	return PWRSEQ_MATCH_OK;
+}
+
+static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
+				     const struct auxiliary_device_id *id)
+{
+	struct pwrseq_device *pwrseq;
+	struct pwrseq_config config = {
+		.parent = &adev->dev,
+		.owner = THIS_MODULE,
+		.drvdata = adev->dev.platform_data,
+		.match = pwrseq_rzg3l_pwrrdy_match,
+		.targets = pwrseq_rzg3l_pwrrdy_targets,
+	};
+
+	pwrseq = devm_pwrseq_device_register(&adev->dev, &config);
+
+	return PTR_ERR_OR_ZERO(pwrseq);
+}
+
+static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
+	{ .name = "rz_sysc.pwrseq-pwrrdy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, pwrseq_rzg3l_pwrrdy_id_table);
+
+static struct auxiliary_driver pwrseq_rzg3l_pwrrdy_driver = {
+	.driver = {
+		.name = "pwrseq-rzg3l-pwrrdy",
+	},
+	.probe = pwrseq_rzg3l_pwrrdy_probe,
+	.id_table = pwrseq_rzg3l_pwrrdy_id_table,
+};
+module_auxiliary_driver(pwrseq_rzg3l_pwrrdy_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G3L Power Ready Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


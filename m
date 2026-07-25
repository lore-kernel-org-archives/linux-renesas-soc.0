Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D62C027B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982881; cv=none; b=DAgG8i1yO3vyaqXQwzjSBa9wNsOEjLu7G9mdnD2dcHt/g9+MK6UnaBySGZpveE4nbIMjaPzjwrzU93v9VEmPs1DTVGLS9EW0dJn2zjnX6x+OQIsfII2ViEBJuj7CG4TnyhHYtDsgbR7jysjV+7uIaaQyD6GCdGUUFtUhIAEDhQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982881; c=relaxed/simple;
	bh=L0WVuDKRP/b5cP3KizdXNRgqVwhH4DQDmigZOe4VTiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcV+QemVW2d+1OFu3DHC9rbbfniRiKkrvCUToZ9IKQqKXs7rmqCAkY+9mhXQh2K7MjvaUO1Yo1MccLJl+yJ8zFAA8ueNXUUMEVfNaOIXiNa5i4IHSL/0Lu2DpThDD/OeUA8qmYkHcITYLRI5rfkhmOYIp8lDgLt4arQUYrDrRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJWGvGK8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJWGvGK8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so8576085e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784982878; x=1785587678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qayZ8l7j7AjeBsX4zzPyA36rJn8+CC4SmddyzBqzDJU=;
        b=bJWGvGK8W0rfUfzPMpU3wa8Pu/4SBvU4qgwF2oJxv3kWVBl+NsJq/D+zWV26/XqK9G
         6XvI77UHRBRBlrOUwD6YWFpc8TEJtYTrohK3RhlauH3oVjCgPndcpKdltqd5MF5N9Pmy
         mIzYFct6Ljf1fh9Awn/G69vBgHMp8iJ4e4Q1KHv8zUKGdIHiQxNgaEMqSRVP65kazq1P
         VOGj/rkUOM4P2qYEHdGNwyn1qBoBgPT7UZL3bFrhNs7ZagNSm/wHMSIqGEkl3Re+r8TI
         bqKnXujMLrPZnp1i7tGv1OwRN/FvpGpXl6D/xbdsFTTUkOwwSLgbciurAhzzpk3U5g+f
         bqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784982878; x=1785587678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qayZ8l7j7AjeBsX4zzPyA36rJn8+CC4SmddyzBqzDJU=;
        b=FTk1UzyLt7In6atWpZqUwc/EUUOB7lH8CuFr4OmB+O6HkijdfnCNOrDvVS8NSZFHay
         B+e+wOOaQh/9+7GwcQrv0wYO42laVl34IkufYzkmXKz7X/cpClFOWLWoCCBb5KDfnkKp
         RiPgxl+gPfJXtTa7YrYx3S+7c0ok8nUGER2IJg4/RxV6OUetaqZBJjTYwyZlEfxG6yjU
         4zJATtKODuaf6s1588uaYtb+Ed+K/xIWFK3z1CkD76HuWQo2Wfl7yrfQtm1N9I0Exeke
         4o7Szm7VgPtbwJSZ1biXV3Jd2ZySjqYaMdOaKqSebzv3aMFKW1SPew6mutt3WeF1HEXk
         uhBA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz5OxiEVkVQ7s7xnicQg0vd1RvuOHc4jyJCJXv74+bn3Hu1aKbYzr0UmCeLFXsGSEWeWdo33xMlNZb2+mYqSYkZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tc4SpfhOYsm8cjJ6ZFzgifzcb2EdfiHqk1QS8HIR7pu6uasE
	FF2aNU+OOc98f6JiQml1gQei1L6/WTaTHX5qwxeJT9oM3dRgSKtE2i1C
X-Gm-Gg: AR+sD138uEoeG3FPNE9Tbtc90bQNg1wOlLIWaU1gw66JIkBf5qGjSL/xd3Tyl7slyoS
	krMhuvZ902vc36X77bHZb8T8MpZz06v7FXhP234hYcHZ2SZlLUBEwgboSzxr2IfUsyU1Utmyaif
	PN95x5VYaUTUb2yMOe5a7j4J5EcLRLAO1fePHyHAY+hmqwVnEq1CW/H08saCJ3rI0C93PvXsEE5
	vUmXLueNup/oLGaZT1/UsR+zfds+Ue5yjbGsJleefy3Z+4rgau/Eh0P9FmI85cB1yoVQ2oIaDJL
	6U5hgFK95AM0x2QqGfSHIdEtDyxNosnIVQJ6dO502FXdrxUs9W0/dB6T5MHXRdwxJGfgnH/hKEj
	lu3s1644F26VTLJrcZ26sqJAYZEY7xs1WUb0dG98lvrY/417AOhf20ptHrrJVuDryR86KH/KIYe
	YUs9uuUxR+UFWSWMBY5OAdwel56NM=
X-Received: by 2002:a05:600c:4f56:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-496b747487bmr16720785e9.34.1784982877503;
        Sat, 25 Jul 2026 05:34:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:222f:1bcc:b186:8220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858e86sm44563295e9.1.2026.07.25.05.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 05:34:37 -0700 (PDT)
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
Subject: [PATCH 2/3] power: sequencing: Add Renesas RZ/G3L Power Ready driver
Date: Sat, 25 Jul 2026 13:34:29 +0100
Message-ID: <20260725123433.162348-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
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
 drivers/power/sequencing/Kconfig              |   8 +
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 141 ++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..245961cc8123 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -27,6 +27,14 @@ config POWER_SEQUENCING_QCOM_WCN
 	  this driver is needed for correct power control or else we'd risk not
 	  respecting the required delays between enabling Bluetooth and WLAN.
 
+config POWER_SEQUENCING_RENESAS_PWRRDY
+	tristate "Renesas Power Ready sequencing driver"
+	depends on SYSC_RZ || COMPILE_TEST
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
index 000000000000..a3d187dd3247
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3L Power Ready driver
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/regmap.h>
+
+#define SYS_PWRRDY_N		0xd70
+#define SYS_PWRRDY_N_USB_MASK	BIT(0)
+#define SYS_PWRRDY_N_DSI_MASK	BIT(1)
+#define SYS_PWRRDY_N_CSI_MASK	BIT(2)
+
+static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask, u32 val)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+
+	return regmap_update_bits(regmap, SYS_PWRRDY_N, mask, val);
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
+	return PWRSEQ_MATCH_OK;
+}
+
+static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
+				     const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct pwrseq_config config = {};
+	struct pwrseq_device *pwrseq;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(adev->dev.parent, NULL);
+	if (!regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to retrieve parent regmap\n");
+
+	config.parent = dev;
+	config.owner = THIS_MODULE;
+	config.drvdata = regmap;
+	config.match = pwrseq_rzg3l_pwrrdy_match;
+	config.targets = pwrseq_rzg3l_pwrrdy_targets;
+	pwrseq = devm_pwrseq_device_register(dev, &config);
+	if (IS_ERR(pwrseq))
+		return dev_err_probe(dev, PTR_ERR(pwrseq), "Failed to register power sequencer\n");
+
+	return 0;
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


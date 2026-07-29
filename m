Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3743AB294
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317480; cv=none; b=N/jauQ7vJbow0ZWyRe5dBuKiqsw6BjPnDwJSYiwENaV4AzNG6GV4SH2KHihvae179G26E0f5NGkq25XbQCPlX8dpIUCZZJjTPeDge7XI6m2xkblAULpWBoBIXTItyY+KspL0KjTkHCTuU0xTy7x2xhCxWRLtAT3O19zIHsnI4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317480; c=relaxed/simple;
	bh=iVNh9vZzlMsFwb4ZF0Jz4j5wRqJzGgmF7aRnnevvHUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4k7B7FDwmt87Aw5rzFumTu/x5StoSuXMw0JmcdF4od4SHcIs+Mkqw0vu5/3v9G3d+0XloKm3lDEkxyqjMSDt04mtWvSAskY8XK5QryCMRkg6fGAhi3Gg3nMQZTzOwRFdx2yhqGh7+LLh8QF/npNz9CKCSRICLS/9iIMaZbk3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWKKEeHm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWKKEeHm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1230976f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 02:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317477; x=1785922277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I92szghQgPQ6t5MlAj59io8fO+k2eTpgdxA/RVFQPt4=;
        b=JWKKEeHmoE8SCbo2bS0p7NGpLmIV8X41AtiN9tTec4OEgCc6G8Ds838p73WZzvHtw+
         mYfRmWxKoxLVs1IM9VVjwJwRx2LWLkLc9Yz2cnTiZqtJm36jmtoD5PZfufVeYUf2DdZh
         4xOf+zmRG+bQD6kGHUTyEn2T1LU4LSVU1ZkMBnLZFGR8naStnyuyGlwKAm3TNRlCbIVh
         OGPzCUUje1MNxv4DTChmqx5fUpJgV+ZyoZH3U9jNFG27WdjQvOM08d2Qqel4qpnWmlJv
         8aACbsCjAoXQ2BJiaUKQ14wSm+2D6N/xhQxRilwArZkQlIlDu0RyypUZSuc4TRhQiFun
         NNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317477; x=1785922277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I92szghQgPQ6t5MlAj59io8fO+k2eTpgdxA/RVFQPt4=;
        b=aegy48qP84m40IqQGkNJn6FfPx8/8cZy+SEQNJn6LmAQhUZJ536/W7odq8LbmrbNCk
         z4plkArIoD2YIJAZ2qRY9zslNVxAniEmYh30RO3gsGsE/JvqUPPta0UqsXP63nXKRBAs
         e+PnGY3SU9mdceY0Hwy46uAzL4WAP+JTfb4S5tCcDTvtfytV93CXJBgAhAwvGpuHmO+4
         ZT4fA/TwTG8KRC8/i+nz85Nkl9I8Gnf0UVMs/sXuuibIsroxu5m56NYySZtMQszcOYc1
         cr7sc5EPBIEej8SxS41hnm0fLinxnw+CgKNrajqEAi6Gx/l2+JKPIwG2ekfhSsTzScGP
         QPLw==
X-Forwarded-Encrypted: i=1; AHgh+Ror+LOtEtVMuh+KEJbXRixtimTHBTUpGBGnG1F53T3Xnj2+u1FKiqwe1bZDRq2Qm+qpERr6PCZeZCLUFKDEy7O0eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLwjuTzMpbis16FNzbzhx74nVpaaNdQKAebMRHFt8tEWmCoJa
	sJpEGbB6gHjAMEX7l1ZZU43E227rtZPuFBZK3EDcnOh7swTtBeZTlpyc
X-Gm-Gg: AR+sD13SHbOP6QbEWOvdHR1P2b9qHrCtbwyKmuSzm6NT2kjymfqoaU9yfyjGOnNjwbZ
	hsZ2Y0hCfhuQNCYZIuKrJNWQXC+uC43KdiqxBTu80edEyfLhrAj/HE9XgNptfGiAL+hHBJS3CP8
	ir7jJcfEcp84gX2yigDiqYdqgi05PPMOrybqDgMZqrJ653ZsD5CIoDyvnSgEUFeH6eNyVdMA+Wy
	Llf66Fo/BMdmuy+1kMRI64KNeqPS4Pz6x5OGnUW6vNhG9VM+ORsnhK/fObZwGnwMHVGQT53kFAx
	6QBzvA3FcWJn/eK5gpCVRGP0WafQvD0abCREJ0kLKmh0yJn6aO1bMP5rsJL3acXQssW2WxBZ+yH
	r4N0Jn+bGuliwYaOYDqPnmsj2rQhxfr9hGPvs1eGnUqnaXDHZAZfJAxq4+xcPbdB3+BZHmrNdFi
	TwLrSirfFDWsOs6EcSmBwXHLBA8wv/GpGWbR0xfWR6AaOoeKwLBL+5NZkNaAbh2iyuHZd+z0mrc
	B7nP2CFfPNzgA==
X-Received: by 2002:adf:e19b:0:b0:47f:97e9:fe55 with SMTP id ffacd0b85a97d-47fbac001b8mr2134310f8f.22.1785317476692;
        Wed, 29 Jul 2026 02:31:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3935sm6766388f8f.4.2026.07.29.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:31:16 -0700 (PDT)
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
Subject: [PATCH v2 2/3] power: sequencing: Add Renesas RZ/G3L Power Ready driver
Date: Wed, 29 Jul 2026 10:31:07 +0100
Message-ID: <20260729093112.98324-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
References: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Added a comment in pwrseq_rzg3l_pwrrdy_match().
 * Dropped dev_get_regmap() from probe as regmap is now part of platform
   data.
 * Added a blank line before devm_pwrseq_device_register() in probe.
 * Dropped the error message devm_pwrseq_device_register() as probe prints
   failure message.
 * Dropped local variables dev and regmap from probe().
---
 drivers/power/sequencing/Kconfig              |   8 +
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 139 ++++++++++++++++++
 3 files changed, 148 insertions(+)
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
index 000000000000..723d574c3f10
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -0,0 +1,139 @@
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
+	/*
+	 * The pwrrdy provider does not rely on any device-tree phandle/property
+	 * matching, so it unconditionally matches every consumer device that
+	 * requests it.
+	 */
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
+	return IS_ERR(pwrseq) ? PTR_ERR(pwrseq) : 0;
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


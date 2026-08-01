Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB536E46C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594248; cv=none; b=PEmPsmScf8KNPmn+OrNdBsdbc/8o8m7BrgPXwpYlaWWRp+x42C3p/vHbowBkJj78h5Pw4xa91AUPiA+/Dpz9+DS/OgRrZDzCTrzZDS5IF1IGPUXhANf67JAWtAHsFSBIV8+fhOH+EEnSG2myTK7QFB4sDv7KIrbqBb3QIqaKbVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594248; c=relaxed/simple;
	bh=X5anVY72w47Yx0iALhdIiMiKb5wMRfjZSmbn32fjWrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmXHXlUsVNTO0WQe1Mrhj+l2mtjcq8oJehI/+Uuq+AfGyXvWFoanSuwZZ5AMl6gr2/LjXE6EsOR22Eq+Xeik3r0UXKG/iRj/mg0yQ1cyQq5+KIpTkT/pnwqZmtsJwTbjnE+Srv++AUkOhvU2WMMcgvbngp82W/GhPSlCN7016EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmts714q; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmts714q"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so9632725ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594241; x=1786199041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMj13faqjSLW8szbzsAFK56PxmCk8coBE/kG+t4+59o=;
        b=gmts714qJhV3TiQ3O6XR1QPLUxVLF7zvyCuSoUNCOzEUIhiblHj5gne3DXGLTCQ8i4
         6GO3w0EX+o440zOM6+e8y9L7xy4/Mvxtz7PHg5QhHxIF5H5yRB4gtpGmjwHU0EuNQL0i
         rcf4UEqORyaz6T08VJpRRpg8jsqYzWG6e5K1tdiBxcwLAYxvOTNiURlRon8r1DMimZar
         Bo3cP4/Y51t1dQRmYaubNeWmrTfWZDwzrO3/udGOmWj6OlJ57f99CKAO+GXXPht4oBIx
         sVqGV5IBOzj2bJYO/98tmUctmSC2Hvp+bo1cXJi2W4oKtgeVzc7sBnVdOc3cEnAT5/Kf
         44CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594241; x=1786199041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMj13faqjSLW8szbzsAFK56PxmCk8coBE/kG+t4+59o=;
        b=H8ou1Crl8EySoh+76dCXGW3L4DqfYbrh9giYeJf77WVL3Lp9uN8HPuEz22mjsBL0gB
         jjKOIt5a2/6eciYko386W5QGXrI1BZ+RIRknYnQEZHiN5kGlRjecYdtG9J6M22KZH+cS
         wPPK+WAU54cdDSKIUGy5w7gCOUxmDeXdHAk2ZgBVs9bC0O+L67Kc0gKWRaZ9KE8BSjqe
         L0mPGSdfuJ7I8/q8SrxHqUMAK16DJLve1KJQ0XDaI6ux4ibCSEBDZK/ItcEsinwn+zY1
         ftJyFPkdWwlzbqmOa1gd9zSo8ddLpmE2op6Vw6PTwqCg47EO9lbT8qPmD/8YtrjCKgAN
         csOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Pviq8+0qegIw/uPnaFQkrIr+hZYZUuo4UjLDq0cG2PR0nH9Hm8FXLhp8zHbuxBUnQ5IhC7NWY2NpVodEMgGVJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFw4YyEFrinFrdEjz1FcMV+ivUn+FQ/A79lQWls60LfA+zRuvm
	Si2hdZfAgx8tJ3i5kqtvEXjQSWaazMlBIDvDXdmSsRUPL1UBL2qfF8Fu
X-Gm-Gg: AR+sD11sIfzgZdOj6VgOujNCk56DmT0MCrmtuSUVa7C7q4Ig0G+3hnaVplESwGaPUXf
	ux0o5S9sygO1J8wGj0zUfxaZGKNuq49/VN1094CO0V8PTzKHDpC+jATYDt+9rzm3jnQ3lFuLUtF
	sha6TDMBctRiDfXXaDtyBPWgR40POE4vzx9EgnH08clMwp/J1xFeG6okdUvZVh7+tKBpRqF8EBW
	SSe5XoZMkmPsxZ+u3KeITUM6TjLhabsbTVwDq0C0GWq7ZhZzsPvguF5gAdlY+PHCW/e4AEKC/Qf
	/4mo2Y1GjVKMmaNpAk2omEASWGZ70OT9eLoq+PendRyYqXV1geGDttQfhn01M76weg7MNiWfoPl
	8pvA/PUXXAKZrkV9tzUlrukFfTJH1HybXl8adZkvFbpCFOb8hRn1NEBkSbfl/aesBV6hQ7bb76r
	PbavkPWCncbsgvVcMRF6yXqnOT2EpgUW21HSpvXbizdYc/6xNkHI2lg74=
X-Received: by 2002:a17:902:e88f:b0:2ca:ef16:8e8 with SMTP id d9443c01a7336-2d0523fa021mr37177425ad.29.1785594241284;
        Sat, 01 Aug 2026 07:24:01 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:59 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform glue driver
Date: Sat,  1 Aug 2026 22:22:31 +0800
Message-ID: <20260801142244.679437-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 SoC integrates a Synopsys DesignWare XPCS that is accessed
via APB3 memory-mapped registers.
This driver provides the glue logic to make the XPCS accessible to
the generic pcs-xpcs core.

The XPCS block contains four MII ports (0..3), each of which can be
routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
The hardware maps these ports to different MMDs:
  - port 0: MMD 7 (ROCKCHIP_MMD_MII)
  - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
  - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
  - port 3: MMD 4 (ROCKCHIP_MMD_MII3)

This driver creates a virtual MDIO bus that translates MDIO operations
to APB3 register accesses, with proper address remapping for each port.
The generic xpcs driver then creates a phylink_pcs instance on top of
this bus, allowing the MAC to use the PCS via the standard phylink API.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part2%20V1.1-20210301.pdf (Page 2078)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/Kconfig         |  23 ++
 drivers/net/pcs/Makefile        |   7 +-
 drivers/net/pcs/pcs-xpcs-rk.c   | 538 ++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs-rk.h |  11 +
 4 files changed, 575 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index e417fd66f660a..500400e3f4808 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -12,6 +12,29 @@ config PCS_XPCS
 	  This module provides a driver and helper functions for Synopsys
 	  DesignWare XPCS controllers.
 
+if PCS_XPCS
+
+config PCS_XPCS_PLATFORM
+	tristate "Generic XPCS controller support"
+	default PCS_XPCS
+	help
+	  Generic DWXPCS driver for platforms that don't require any
+	  platform specific code to function or is using platform
+	  data for setup.
+
+	  If you have a controller with this interface, say Y or M here.
+
+config PCS_XPCS_ROCKCHIP
+	tristate "Rockchip XPCS controller support"
+	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on PM || COMPILE_TEST
+	help
+	  Support for XPCS controller on Rockchip RK356x SoC.
+
+	  If you have a Rockchip SoC with this interface, say Y or M here.
+
+endif # PCS_XPCS
+
 config PCS_LYNX
 	tristate
 	help
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b900..c809b7f942a51 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,10 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
-pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
-				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
-
-obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
+obj-$(CONFIG_PCS_XPCS) += pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
+obj-$(CONFIG_PCS_XPCS_PLATFORM) += pcs-xpcs-plat.o
+obj-$(CONFIG_PCS_XPCS_ROCKCHIP) += pcs-xpcs-rk.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
 obj-$(CONFIG_PCS_MTK_LYNXI)	+= pcs-mtk-lynxi.o
 obj-$(CONFIG_PCS_RZN1_MIIC)	+= pcs-rzn1-miic.o
diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
new file mode 100644
index 0000000000000..36c1557b83367
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -0,0 +1,538 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip XPCS platform device driver
+ *
+ * Based on the Synopsys DesignWare XPCS platform driver.
+ * Copyright (C) 2024 Serge Semin
+ *
+ * Adapted for Rockchip SoCs, with reference to the Rockchip OEM driver.
+ * Copyright (C) 2026 Coia Prant
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pcs/pcs-xpcs-rk.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/sizes.h>
+
+#include "pcs-xpcs.h"
+
+struct dw_xpcs_rk {
+	struct platform_device *pdev;
+	struct mii_bus *bus;
+	void __iomem *reg_base;
+	struct phy *serdes_phy;
+	struct clk *csr_clk;
+	struct clk *eee_clk;
+};
+
+static ptrdiff_t xpcs_rk_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x70000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static int xpcs_rk_read_reg(struct dw_xpcs_rk *pxpcs, int dev, int reg)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = xpcs_rk_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = readl(pxpcs->reg_base + (csr << 2)) & 0xffff;
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+	return ret;
+}
+
+static int xpcs_rk_write_reg(struct dw_xpcs_rk *pxpcs, int dev, int reg, u16 val)
+{
+	ptrdiff_t csr;
+	int ret;
+
+	csr = xpcs_rk_addr_format(dev, reg);
+
+	ret = pm_runtime_resume_and_get(&pxpcs->pdev->dev);
+	if (ret)
+		return ret;
+
+	writel(val, pxpcs->reg_base + (csr << 2));
+
+	pm_runtime_put(&pxpcs->pdev->dev);
+	return 0;
+}
+
+#define ROCKCHIP_MMD_MII1	2
+#define ROCKCHIP_MMD_MII2	3
+#define ROCKCHIP_MMD_MII3	4
+#define ROCKCHIP_MMD_PMAPMD	6
+#define ROCKCHIP_MMD_MII	7
+
+static bool xpcs_rk_mdio_addr_validate(int addr)
+{
+	return !(addr < 0 || addr > 3);
+}
+
+static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
+{
+	switch (dev) {
+	case MDIO_MMD_PMAPMD:
+		return ROCKCHIP_MMD_PMAPMD;
+	case MDIO_MMD_VEND2:
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	/* read remapping to MII is performed by HW */
+	switch (addr) {
+	case 0:
+		return ROCKCHIP_MMD_MII;
+	case 1:
+		return ROCKCHIP_MMD_MII1;
+	case 2:
+		return ROCKCHIP_MMD_MII2;
+	case 3:
+		return ROCKCHIP_MMD_MII3;
+	default:
+		return -ENODEV;
+	}
+}
+
+static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
+{
+	switch (dev) {
+	case MDIO_MMD_PMAPMD:
+		return ROCKCHIP_MMD_PMAPMD;
+	case MDIO_MMD_VEND2:
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	/* Writable only on MII */
+	switch (reg) {
+	case DW_VR_MII_AN_CTRL:
+	case DW_VR_MII_AN_INTR_STS:
+	case DW_VR_MII_EEE_MCTRL0:
+	case DW_VR_MII_EEE_MCTRL1:
+	case DW_VR_MII_DIG_CTRL2:
+		return ROCKCHIP_MMD_MII;
+	default:
+		break;
+	}
+
+	switch (addr) {
+	case 0:
+		return ROCKCHIP_MMD_MII;
+	case 1:
+		return ROCKCHIP_MMD_MII1;
+	case 2:
+		return ROCKCHIP_MMD_MII2;
+	case 3:
+		return ROCKCHIP_MMD_MII3;
+	default:
+		return -ENODEV;
+	}
+}
+
+static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct dw_xpcs_rk *pxpcs = bus->priv;
+	int dev;
+
+	if (!xpcs_rk_mdio_addr_validate(addr))
+		return -ENODEV;
+
+	dev = xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg);
+	if (dev < 0)
+		return 0xffff;
+
+	return xpcs_rk_read_reg(pxpcs, dev, reg);
+}
+
+static int xpcs_rk_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct dw_xpcs_rk *pxpcs = bus->priv;
+	int dev;
+
+	if (!xpcs_rk_mdio_addr_validate(addr))
+		return -ENODEV;
+
+	dev = xpcs_rk_mdio_write_remapping(addr, MDIO_MMD_VEND2, reg);
+	if (dev < 0)
+		return 0;
+
+	return xpcs_rk_write_reg(pxpcs, dev, reg, val);
+}
+
+static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct dw_xpcs_rk *pxpcs = bus->priv;
+
+	if (!xpcs_rk_mdio_addr_validate(addr))
+		return -ENODEV;
+
+	dev = xpcs_rk_mdio_read_remapping(addr, dev, reg);
+	if (dev < 0)
+		return 0xffff;
+
+	return xpcs_rk_read_reg(pxpcs, dev, reg);
+}
+
+static int xpcs_rk_write_c45(struct mii_bus *bus, int addr, int dev, int reg, u16 val)
+{
+	struct dw_xpcs_rk *pxpcs = bus->priv;
+
+	if (!xpcs_rk_mdio_addr_validate(addr))
+		return -ENODEV;
+
+	dev = xpcs_rk_mdio_write_remapping(addr, dev, reg);
+	if (dev < 0)
+		return 0;
+
+	return xpcs_rk_write_reg(pxpcs, dev, reg, val);
+}
+
+static struct dw_xpcs_rk *xpcs_rk_create_data(struct platform_device *pdev)
+{
+	struct dw_xpcs_rk *pxpcs;
+
+	pxpcs = devm_kzalloc(&pdev->dev, sizeof(*pxpcs), GFP_KERNEL);
+	if (!pxpcs)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, pxpcs);
+
+	return pxpcs;
+}
+
+static int xpcs_rk_serdes_phy_init(struct dw_xpcs_rk *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+
+	pxpcs->serdes_phy = devm_phy_get(dev, "serdes");
+	if (IS_ERR(pxpcs->serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->serdes_phy),
+					"Failed to get SerDes PHY\n");
+
+	return 0;
+}
+
+static void xpcs_rk_serdes_phy_poweroff(void *data)
+{
+	struct dw_xpcs_rk *pxpcs = data;
+	struct device *dev = &pxpcs->pdev->dev;
+
+	phy_power_off(pxpcs->serdes_phy);
+	phy_exit(pxpcs->serdes_phy);
+
+	dev_pm_genpd_rpm_always_on(dev, false);
+}
+
+static int xpcs_rk_serdes_phy_poweron(struct dw_xpcs_rk *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	int ret;
+
+	ret = dev_pm_genpd_rpm_always_on(dev, true);
+	if (ret) {
+		dev_err(dev, "Failed to power on power-domains\n");
+		return ret;
+	}
+
+	ret = phy_init(pxpcs->serdes_phy);
+	if (ret) {
+		dev_err(dev, "Failed to init SerDes PHY\n");
+		goto pm_domain;
+	}
+
+	ret = phy_power_on(pxpcs->serdes_phy);
+	if (ret) {
+		dev_err(dev, "Failed to power on SerDes PHY\n");
+		goto serdes_phy;
+	}
+
+	ret = devm_add_action_or_reset(dev, xpcs_rk_serdes_phy_poweroff, pxpcs);
+	if (ret) {
+		dev_err(dev, "Failed to register devm for SerDes PHY: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+
+serdes_phy:
+	phy_exit(pxpcs->serdes_phy);
+pm_domain:
+	dev_pm_genpd_rpm_always_on(dev, false);
+	return ret;
+}
+
+static int xpcs_rk_init_res(struct dw_xpcs_rk *pxpcs)
+{
+	struct platform_device *pdev = pxpcs->pdev;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "No reg-space found\n");
+		return -EINVAL;
+	}
+
+	if (resource_size(res) < SZ_2M) {
+		dev_err(dev, "Invalid reg-space size\n");
+		return -EINVAL;
+	}
+
+	pxpcs->reg_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pxpcs->reg_base)) {
+		dev_err(dev, "Failed to map reg-space\n");
+		return PTR_ERR(pxpcs->reg_base);
+	}
+
+	return 0;
+}
+
+static void xpcs_rk_exit_clk(void *data)
+{
+	struct dw_xpcs_rk *pxpcs = data;
+
+	clk_disable_unprepare(pxpcs->eee_clk);
+}
+
+static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	int ret;
+
+	pxpcs->csr_clk = devm_clk_get(dev, "csr");
+	if (IS_ERR(pxpcs->csr_clk))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->csr_clk),
+					 "Failed to get CSR clock\n");
+
+	pm_runtime_set_suspended(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		dev_err(dev, "Failed to enable runtime-PM\n");
+		return ret;
+	}
+
+	pxpcs->eee_clk = devm_clk_get(dev, "eee");
+	if (IS_ERR(pxpcs->eee_clk))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->eee_clk),
+					 "Failed to get EEE clock\n");
+
+	ret = clk_prepare_enable(pxpcs->eee_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable EEE clock\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, xpcs_rk_exit_clk, pxpcs);
+	if (ret) {
+		dev_err(dev, "Failed to register devm for EEE clock: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int xpcs_rk_init_bus(struct dw_xpcs_rk *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	static atomic_t id = ATOMIC_INIT(-1);
+	struct mii_bus *bus;
+	int ret;
+
+	bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!bus)
+		return -ENOMEM;
+
+	bus->name = "Rockchip DW XPCS MCI/APB3";
+	bus->read = xpcs_rk_read_c22;
+	bus->write = xpcs_rk_write_c22;
+	bus->read_c45 = xpcs_rk_read_c45;
+	bus->write_c45 = xpcs_rk_write_c45;
+	bus->phy_mask = ~0;
+	bus->parent = dev;
+	bus->priv = pxpcs;
+
+	snprintf(bus->id, MII_BUS_ID_SIZE,
+		 "rockchip_dwxpcs-%x", atomic_inc_return(&id));
+
+	/*
+	 * MDIO-bus here serves as just a back-end engine abstracting out
+	 * the MDIO and MCI/APB3 IO interfaces utilized for the Rockchip DWXPCS CSRs
+	 * access.
+	 */
+	ret = devm_mdiobus_register(dev, bus);
+	if (ret) {
+		dev_err(dev, "Failed to create MDIO bus\n");
+		return ret;
+	}
+
+	pxpcs->bus = bus;
+	return 0;
+}
+
+static int xpcs_rk_probe(struct platform_device *pdev)
+{
+	struct dw_xpcs_rk *pxpcs;
+	int ret;
+
+	pxpcs = xpcs_rk_create_data(pdev);
+	if (IS_ERR(pxpcs))
+		return PTR_ERR(pxpcs);
+
+	/*
+	 * The XPCS may be attached to a power domain (e.g. PD_PIPE). The domain
+	 * must be powered on before any register access, otherwise the SoC will
+	 * trigger a synchronous external abort (SError).
+	 *
+	 * Accessing the XPCS registers also requires a TX clock from the SerDes,
+	 * which is needed for the soft reset.
+	 */
+	ret = xpcs_rk_serdes_phy_init(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_rk_serdes_phy_poweron(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_rk_init_res(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_rk_init_clk(pxpcs);
+	if (ret)
+		return ret;
+
+	ret = xpcs_rk_init_bus(pxpcs);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void xpcs_rk_remove(struct platform_device *pdev)
+{
+	pm_runtime_force_suspend(&pdev->dev);
+}
+
+static const struct of_device_id xpcs_rk_of_ids[] = {
+	{ .compatible = "rockchip,rk3568-xpcs" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
+
+struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *np)
+{
+	struct platform_device *pdev;
+	struct device_node *pcs_np;
+	struct dw_xpcs_rk *pxpcs;
+	struct dw_xpcs *xpcs;
+	u32 port;
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	if (of_property_read_u32(np, "reg", &port))
+		return ERR_PTR(-EINVAL);
+
+	if (!xpcs_rk_mdio_addr_validate((int)port))
+		return ERR_PTR(-EINVAL);
+
+	/* The XPCS pdev is attached to the parent node */
+	pcs_np = of_get_parent(np);
+	if (!pcs_np)
+		return ERR_PTR(-ENODEV);
+
+	if (!of_device_is_available(pcs_np)) {
+		of_node_put(pcs_np);
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (!of_match_node(xpcs_rk_of_ids, pcs_np)) {
+		of_node_put(pcs_np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdev = of_find_device_by_node(pcs_np);
+	of_node_put(pcs_np);
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pxpcs = platform_get_drvdata(pdev);
+	if (!pxpcs || !pxpcs->bus) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	xpcs = xpcs_create_mdiodev(pxpcs->bus, (int)port);
+	if (IS_ERR(xpcs)) {
+		put_device(&pdev->dev);
+		return xpcs;
+	}
+
+	device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	put_device(&pdev->dev);
+	return xpcs;
+}
+EXPORT_SYMBOL_GPL(xpcs_rk_create);
+
+static int xpcs_rk_pm_runtime_suspend(struct device *dev)
+{
+	struct dw_xpcs_rk *pxpcs = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pxpcs->csr_clk);
+
+	return 0;
+}
+
+static int xpcs_rk_pm_runtime_resume(struct device *dev)
+{
+	struct dw_xpcs_rk *pxpcs = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(pxpcs->csr_clk);
+}
+
+static const struct dev_pm_ops xpcs_rk_pm_ops = {
+	SET_RUNTIME_PM_OPS(xpcs_rk_pm_runtime_suspend,
+			   xpcs_rk_pm_runtime_resume,
+			   NULL)
+};
+
+static struct platform_driver xpcs_rk_driver = {
+	.probe = xpcs_rk_probe,
+	.remove = xpcs_rk_remove,
+	.driver = {
+		.name = "rk_xpcs-dwxpcs",
+		.pm = &xpcs_rk_pm_ops,
+		.of_match_table = xpcs_rk_of_ids,
+	},
+};
+module_platform_driver(xpcs_rk_driver);
+
+MODULE_DESCRIPTION("Rockchip XPCS platform device driver");
+MODULE_AUTHOR("Coia Prant <coiaprant@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/pcs/pcs-xpcs-rk.h b/include/linux/pcs/pcs-xpcs-rk.h
new file mode 100644
index 0000000000000..28723d5bd75cc
--- /dev/null
+++ b/include/linux/pcs/pcs-xpcs-rk.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_PCS_XPCS_ROCKCHIP_H
+#define __LINUX_PCS_XPCS_ROCKCHIP_H
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/pcs/pcs-xpcs.h>
+
+struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *np);
+
+#endif /* __LINUX_PCS_XPCS_ROCKCHIP_H */
-- 
2.47.3


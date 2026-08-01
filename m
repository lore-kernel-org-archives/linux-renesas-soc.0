Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25921357702
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594221; cv=none; b=pNBQOseP/JpMKTJ6F12n/K+S5pBWJnnzxoicLmLsCOsgQ58xR9YA+TuU0MtiR9Y7kkTgHSpGoUXQSg3xU8VUwTS1FJvrPIbhX/GwUw7AYPoPosxiClozRd730WUwfm8Cm8hcJ71yV79u3OwLYsQjoy9ukwrYHN+LbVJLkBmyFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594221; c=relaxed/simple;
	bh=3SO0ECLJlUZ37IB7/HpRBQ24ILx8y53kacVLUJ1x/Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOf5FLFnE49ByRNg0f9Er9dv24JeL+fOSXcthBO/kPbRvaGITZvzXR7BkZ0RX2hrZErRfTWFwtULzKdrJpwMEVHWjqD9M8RZ/FclkI5s0xMolhTxMXj9hvK+f4hFfX75TdRS8ov/nQyh7qOX92ozIBXWzqc9G5eOqPUs1wHp47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKvPoNv8; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKvPoNv8"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc7a345f51so14519385ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594214; x=1786199014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTbZp/ChtgSMbHsJmXXDBUtpO1bOy1YQWdOODbeZxQU=;
        b=XKvPoNv879V/97r8b/fQOHuC2Z2Bnxw8Fjth40it6CjyIWmcLW+b9Zw+MKoNPCaeBV
         4h8P5DGOKwxMZxLPVZ9OYJ9HoQD4i3ufISd/xgEwBaOQfeucDhiEnJZZRqnWkVJY0yV0
         9oG8W7K+k974QmL/mxRYocqPidSzmksMBo4dTb62iZ8qIKtIuuaHzxSOWu20//lcOloV
         s9mVPYBOPJ/USO4dn6awCsxHLZCd4Sy5cCSEgpXKOZcuwmvclhJRBwbD38YHJrSfgLGh
         6yN7yTzlZe1JD68j4aBkITmvdkY7FOvxhml2C+qyl8loQKEFc6v0PetLCakpZuG58k6R
         HHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594214; x=1786199014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTbZp/ChtgSMbHsJmXXDBUtpO1bOy1YQWdOODbeZxQU=;
        b=tZt4IsiT8TUfuqKR0F7sqJLaUm/EcSSGLJENedHpCwaq1Z/SekB1uW+aA/4iNfmhJ5
         i7ePv3RA22+F/UWO4o8Z3wEg+8qQ6xNQ6AYvO2+iIIu/jAeRkd7u3oO1milco8D7VZpD
         kEd/ff555P5aLnAtWkUzy3IVfYvfFf4lP8ZE04jjSRJPOlvmMZue1QX3KHkWGe6fHoqC
         o4eFP5VAG9HDhF3zA/gNIfSO6KHmii51QH8LSKIw9Gkwwhv25qYXIZlai915/T6hXOwq
         6nOi8/xiBMJqcKosTjesWFqrNCfI0oF0CIp2+VpOnQ05HSJne3XzHwyWxcIFLc1E9Ep4
         Y3oA==
X-Forwarded-Encrypted: i=1; AHgh+RoHPFBuaH2hZUaDF2Qm7lAjEBeXjnPgiklFcCuJuVuoRYQn6+5F6BOwIfZ9aArMp/9G7LR8I9GBor70JjzuT8pbFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEy1pgTXPF16IHyqSM/ggS50kOU2wYlPhQoQU9hiwBUzOlWjIO
	QLlYu33T+X4WOeXypXdvXBF7wZi1fRlPF/IKummKgDtCDh3StHl6kdus
X-Gm-Gg: AR+sD125+WcZT/Nkuod2hTheOX6jadeT3Uu4FKmMa3dqi0tynMtd7Dwes56v0HwdNQu
	/Vz3SorAM3z7TaB0dZFoEKdB195MTFIMyCglRgZmAYpDfptB/M+j7U9wC7YYbTepVlc1bn7cG6q
	0mUwKDyj/Uzl5XBORdANZMJ+Ouy5z5BYOepHpjmGlg2i7tD2IBXaI85Wb9VXS5kl8iScb91Al0+
	hifUT8jr4Tl2LRxzSnMgwi9eUeKiglZNtgr97SyatXUG5OC9PaJ3d3S/+8pfq7KHBECuFaH3V6W
	UBlzqlMrwqxgvRpHv+8rsYtCneHN+e9wEV1ajj8BOEC287HigUsT9lHogTQIo73j8ifdP9L5ZxL
	kIqzr7ClkTdCHEgByI26fJGYcTmO1AYGyOygXljAot6YwZyVnJPTJedrlavxO3eQA/y7P4tuuIp
	tHTEhcukOBCb15e0RRCUGCR1Ckt1dKSNsyoLXPKiN1sbLxWAAoZJpiRJ0=
X-Received: by 2002:a17:902:d4c7:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d0524a6a1fmr38459995ad.32.1785594213748;
        Sat, 01 Aug 2026 07:23:33 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:33 -0700 (PDT)
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
Subject: [PATCH v2 03/10] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Sat,  1 Aug 2026 22:22:27 +0800
Message-ID: <20260801142244.679437-5-coiaprant@gmail.com>
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing
the "rockchip,sgmii-mac-sel" DT property.

The hardware reset value is GMAC1 (1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 2b0f152f54709..539acd1459948 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_xpcs_phy_ready;
 	struct combphy_reg pipe_pcie1l0_sel;
 	struct combphy_reg pipe_pcie1l1_sel;
+	struct combphy_reg pipe_sgmii_mac_sel;
 	struct combphy_reg u3otg0_port_en;
 	struct combphy_reg u3otg1_port_en;
 };
@@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	priv->sgmii_mac_sel = 1;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					priv->sgmii_mac_sel > 0);
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3


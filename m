Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D238F642
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326003; cv=none; b=hAy7ESXdfljt8KdudFvGPCyHlVaHmSAzb8Ua8B7xbXJ5qmO2nuyCQg2+L3404jzMxMOuvqZYir56kn9FrGDvXkLlTNJ7kv5u83VjQOllzSR51lsw96qDGQ16W7VetEKK2EWgo6OGE0AL1MKgphGv4t93mVwCD6E0Z9KjOh4eTrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326003; c=relaxed/simple;
	bh=DhaNtgMivv6Vp1qmM9I8vpAHsOLNcVSH8e/G7pgxaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnPnQU+qPSGbKRnbxokoQkL8NfLZhxKxmig/SnkMVDwonn83MkNAyJHrEliVZv+9zHoNAeCp9ITA/g8n2/wNqWc/aYXXrdv7ea/9R9O/dhaO0fXwPs+UpZgkEeY5LVUj9kLo+05ni7gZvooIazyJpqyuAc8BuVb+EjRSfzGArG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOVHBOST; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOVHBOST"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d952ac253dso15530865ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326001; x=1789930801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=FOVHBOSTRSEbjmiz/4OKeYJsDwgGH6Ou62G/yFEMYzzTOm//11T21Cwt4TnSZFoAl9
         1RTyzsqbKZR+NRGG+ZdbiKkJG/uTV74WB5TS4hihOOX54Qjz6LeuKMlof+y5Xyh87Hoq
         Mh5WSIVDfWBJP1ULA20tWtsQvehrRInmqq8w10vieyMd/hAk4n2md6lXbnfP5pohKsmB
         uw53LvUv3AZCZcHg4BZGMG09kdhSp+cmET7Lix4X6eO4BaaSQntzt9jSAOVvOTJZnFCY
         w/g0OR8XyCGPrTpXyky6KUKXEVWIUwFaEy1Sd18ueQzM35YpqJTdd1ouur0buyD93lGd
         D8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326001; x=1789930801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=S8+xPFdSA4qn8hAVYXrslWmB+zo5wdJ4VFcG050aAc+7Q+3FyNA+z8M/KR+LXSFmwt
         dtObFOV0p+QnzWRgN3ZiQMYA6KZ4ba0hFoOzsx6CN91K38g678sOKwEtGungCJhLRihY
         nSaZ9o3Pr2IgajF61aATtH9jHRrjvLb+BUJHpEamdD9rZbJeXbBnORiDcRloCJtzVx+v
         A7YljPmvDyNvxkBgD8+eD8wymKepG7RkxQRvXaiSmZapyBnr9z66xIIQOu/L5nroLvTK
         bI2299zRc3+qcCtfT4pS+Ns6Kjsq70oa0GBswG7gAdisSqtbY+g3eHa6QdE6P7WRYP/E
         w/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzACH9dVro/blwVIkohQdjnIjj2vBFPs/YYxljPZJf/PJaYAajCSFXIyu1ZbGYy2/V9MmloLnHbggw/fbd38GMjWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lrToiPhOagAkdqvzPhErVA2pjBhmJN3SH0Q82JyztJJZ4Qe9UJ
	Bgq9LvnQjIQPwBlNyNdilcEaWhMkn1gdqU6mCEbORxxtmVIIT1F7yUMx
X-Gm-Gg: AYBFou2VW/6aG5AzNn4XdKrs8PuoXCAy65dGqHWTk9HW9jE3HXOottS1A+06e+bi39d
	KO3VHuy/uIqUGch9G8Sv8ESHOzrDPIsCcat22v1svNc5xugF2NtC2wPAkl/Tyf6FSoiKJP2GEMT
	Z6Qdf1uC1pmE7USIq4IowffUQDntkTpUNAX6Eqy8EbujwNy51kW24hrkZDCcE9CLMUvSm4J6A93
	cZrbmh1ohJr5731xpiBI0f4wTCGwktX9dMoWkVm1P6jl0lf7VcrwraqdL95xbzJkaaPt5kKOjQj
	hUEEfxXchDU5dtTEvLN4laZ1xNF4vF288pjiVAfDv3fXbNlTbDFZlnoPCRJxnrS5uKT56Wy65Ca
	8+hZTDJxKELnQvCdCLoVincT5/jYpsbGi6khgkrgA5oFH9LQmKUE7FOn5wyRZzRIvFr0IwVnC5p
	8A1Fe8T3VzaDlp94KoBdAuvBX3ZOmN+/9f1fefPSTMu/QUXv5gw7Oq15/wWXHbcO6c1FWUWQ==
X-Received: by 2002:a17:902:ef4d:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2dd4ba93866mr153810795ad.0.1789326000804;
        Sun, 13 Sep 2026 12:00:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:59 -0700 (PDT)
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
Subject: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Mon, 14 Sep 2026 02:58:38 +0800
Message-ID: <20260913185849.907479-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
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

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
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
index 7843356a4dd47..7b867e7520064 100644
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
+					     priv->sgmii_mac_sel > 0);
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


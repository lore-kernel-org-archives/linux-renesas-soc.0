Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552EA4AD7D6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107463; cv=none; b=dN/GUVP51764MPuxPH7OIpXXJbF/46M19imBOogQTF/MFTTwe8sV8pEcbPQb7Hgcb+P4XbGPT1bg30fCmSR5w7JRJsnavIZ13S9ZJQyF9cND2YKfY7wPig+j3rPZV0qwC63Co7z6t38wIZQrSzw79NKOQcGx9PjrOzDa6+Nb4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107463; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r94ywfVIykr1AzJkSkZxiR+iEPevSeRlKwgdCgGI8W426dSp5539lHEvTA+GeMF6dX07k8cqlH5RBBXGeP05vfH+pnzKCE1zXfRiYQZQUhsDDKHs9DDvOOa0jXYPM0vsPgVQBszqWaSyHx5SNMAbmCI58fiPnyW8HpaBdLTAl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2njGY/v; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2njGY/v"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d952ac253dso1214685ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 13:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107451; x=1790712251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=Y2njGY/vJqA0B9SwWL7b9Q8d39A97yp0YX7pW7xGyqXQeffoFWBxKbhZdq1rFpz7DF
         dUG2q9AWrSDKt8axz/8qClE0aKSqOu7EVytCM3mBVNG7LndYG6P/ctfKa7M4P6ohSis3
         JmZUAk6bAN5z1ySx9YnaU6UyUo9QDsy5Fo4PGNIPTPjwNGa/B5gSqrh6s43n+Jj+wBD6
         91sK+vgFNIxN2MVTGZpfEvrflYciCQ9eTwUZrFJIb0Psl5IvDRPIr5jOHknmP+uLbWVw
         SrnHgtaKFrahmqCydHZcPKmNKGKVkS7kPJOME5qQi79crSe8FeyjBHmYpqTbvQmgkXZ8
         2bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107451; x=1790712251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=gWSljCSmDYZ7c4z9YlluIafpx97AP2rQQ0LSBuMppFEtqOKOLlzgxWPiG3OVYaF/zV
         0SYAf8WyuRL3lsm2GlopvLyi2OT13XVLbvs6xoOhphWs63EiBF7J1DQG0ioVm8CURS0A
         DO4JU4ZKBivW1OptJYO/09RozT2XoeWtfJxbtWBSz+ik83Ki7QvqBXpto1jXrMbJ6e6d
         uqfbzHHxpuqAN0SY7FEgEQp5FDBjNcNycKd1/VHPjrxa/7c5qlsiWenYPjy5uQ425orh
         PFKwaJsYNicJ/26MCoj+J34yPwVXGhuLPB9RAnTNfAa6Wo2pP7gTMWaL59p6PBlRSvdM
         BX8g==
X-Forwarded-Encrypted: i=1; AKwUvBy9kIzSxJEcLF9Gx0wY29QNVIVN4Skp3QRW8DOnzDG6GQIxVF81Ox+wmu6Js+3wsK6ak98G7ZpvwLjnqv6q9uVtVQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kT3bq1YEpgv3WiAj9H42N/fKOcBlsbiYu1q2fHG91FQ4uBqhKT
	/ZVa0c1QxZ6jp0VRMo4ukKkCzet9YeTjaldIgPzNMd8QFvlykikqUldx
X-Gm-Gg: AYBFou2YBeX4SN1Le9DCYX4pFNKiG3/qKQyMDpaPKolkmOp//FPwKrCEVh7w0gb+3dU
	CUU7Rhkn/EfmuAiTrmsnA9nYCzSgtWyN35OxSFzj9IVcsCbRjNPDoabaxzGqoo5fSDMQqbLxldm
	vRauA8hhdre0V+AiSGRg5ruoaDTCs73argSJWZ1X2vr0HQ5yBxF7aQrusL7MzDSU4tD8juqLkhr
	M/AkwMP+TaSrnHTB7PNkWIxedbNJ7szuE+rtYk/wmwoVfaIpZmYQ/6IAJtnynSzV1hg06jFTAKF
	nGYx4mFg/b/L3y+OBE8pCSrnpNFWHFSJwikz9FD3zbgeBCSzE+YDn97t/mRFfUb0Uzi+++ilDVa
	dksQ929yigVBo6DQ420D6WfRWAYJqJ0eUsk+SBmOB0YSsnoSm2L8+e91H61WfavuYXOJTUAGWT+
	RyrQhwqGsq4iUXbkBXXQwVcgRXPRIrNiCBqvZE68iR/We6acO6Rz/Gpl+KmidHZGCFERyM
X-Received: by 2002:a17:903:2302:b0:2df:6969:7d5d with SMTP id d9443c01a7336-2df69ddf0c0mr4048995ad.40.1790107450787;
        Tue, 22 Sep 2026 13:04:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:10 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed, 23 Sep 2026 04:03:27 +0800
Message-ID: <20260922200336.2201212-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
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

Out-of-range values are rejected by dtschema, so the driver does not
duplicate the range check.

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


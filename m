Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F74A204A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475917; cv=none; b=rS/gKR4YDl05GhJM/Q6HF3TvmWKRKLq7E7j0NEBW514b9NIofDFKLZhfUnEali3+N51vfL0G30ZjFwKhOlSSbCsajThuhhttIgjQvfrEK960jugM/vSF5J70v2ngIP2pmrttQ5tnBUhuYJus57XTbsbXJxp5P3xhLQHzTAb3NrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475917; c=relaxed/simple;
	bh=gWvVNB1m2Bm2R+CKFSLbBbPCu/GkRF+C5uYpyZkg/fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrbJScjmXIr8uEJkRfA/vnBbAAxJMflN38rOYDrOChQzRYyg8oe+RhPtZ6Xe4xnvLJkUJaLqdAIapq31JmWuKlLW4wNtQJm6vpxGCaTRBA6oe2h6t2wt2A18Vn8gro6SvD65XfGn8aeUum+JS/G4eGBMXLLE1lqc1s2dshZ4rXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkC4FQOk; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkC4FQOk"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-39ded0d7f52so1311872a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475914; x=1790080714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN2MkU81Lz1KMvwh0OIvKliZyK5cNgEHJk5t3+uaHA8=;
        b=rkC4FQOkYSj8jAGGxlWPzH9zM826nS63hyhvDyC+r9+BhTNBnu3uu/2c5yBw34jV3u
         WtHTBN7p4Zw2+jLlqqM1H94AeHS2XmDNX9hu0ktCYfyEBEKYHK2RaxN/WVcr89/6IY6x
         Vfv/KJj5CRuSD9txVibIRQbsq3LL7tcNkGD40/ueQCU/DvucIhv1moC8VPBrILuFcrl6
         21kMojQMye1zJyH4H4ucA2VwTTcCspMAHscPDxCS7oGRJl50ZzhWmaE/8pJ9vXfPOlEs
         Ofxku7n1ShwQcO5do2cPycXOP5XN4EE/AQu10mpjmOzQmL8v0PNuZ2cvN59IFBW5rpoV
         K4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475914; x=1790080714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qN2MkU81Lz1KMvwh0OIvKliZyK5cNgEHJk5t3+uaHA8=;
        b=SdzEnG+9fZpBrQxfDK3IXYKDheodHS5gbO5Y2RJ7SZK8p2N3hKqJsDq0fxkh4adv3D
         PquGsR3cq0Z2I+MS6fRH/2FOA1EolHxXiGp1nzhwlXbMxt9e13Q5J5ak8mRt7nHJeJQc
         Q9d8zVTsxBYp0YM84Mp+QzATYDsmwgdKGkZL9Yf1IZAAlPoLuSFaqBa+N9rXeIxguQWa
         /GATcBn7H11HVqzmyPuayCXACOhf7SH0IpKAeK6XFbPiw81CCXdD1eXUEwWH2Hrst57E
         UkRlGMg5YRa7FmRc3sLy4yX7WjZt4VktEn4IBpPdop785ce2UUpkmwJKoCpf8Gf5TGzh
         X21w==
X-Forwarded-Encrypted: i=1; AKwUvBzFYyANz2gXZfaDrTI1yJUt/9FYk8DV/r5ljjtIRj2hIu9G7JH+1y8CeYyXsCiFDLimlk+CXdfS3pgg4EviXbYJVw==@vger.kernel.org
X-Gm-Message-State: AFuF++kNhTId1t7PWUsAje0DIxVokJ4w4w/1wHzJ2Tpyn0mouZaG7+bx
	pd6C8JU7DVGdbmPpnJFI0ouOiok4KhxpCbspeeGV6s5wQ2ed0ptO2MaT
X-Gm-Gg: AYBFou03VLnhde0Q/oyeKX3TBrLFysWG5wQ3SZ0I79XqJJU3HQeAUmdpmkQ6v3xLKmq
	0q3YVMkmvNWw9CqIX1ghTCYDjnvwcWj2KzNxrueP9065jqc4amSsBkcP/a0Z4ZDaNBSbjEXYPUj
	YRNasp4qoA5JPKRwkf9jfbOkWXyNsNUnm9uk+x59R6RoJlIwUyuqyKpXyVy1gcBTT/SHPmOK0H4
	yV5PNdRJd2JDRvCW8/KJmzOPP6U2KS19UBF88xSDcyASqQFxVBBSjaLM3afvlCgpr7M0jxHw4Ds
	mwiz/vBWpxK2i5PxUiTMu+GNmagDzqEpChQ8bXyla4l9FdBm7sNY4nNlt+rKtO+G6mjuxrl7NQW
	5XONkwmMcdGSyE2pxDvNA66/3yS8ubgep4szdt68iEv6lMxxWYeNhMUeZN2RAChyXsv1EvXdnmF
	uT+AyD7WaEvrureHv49Fn42Im/yVIP08w7gO7Ng4POl6Inr4Aqu+DbzqHFkrN6fWIsfqlZkA==
X-Received: by 2002:a17:90b:1811:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e106b649dmr1483983a91.0.1789475913321;
        Tue, 15 Sep 2026 05:38:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:32 -0700 (PDT)
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
Subject: [PATCH net-next v6 01/11] net: stmmac: move XPCS lifetime management to platform drivers
Date: Tue, 15 Sep 2026 20:37:50 +0800
Message-ID: <20260915123802.1561724-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current XPCS creation logic in stmmac_pcs_setup() is problematic
for several reasons.

First, if a device tree specifies a "pcs-handle" but no select_pcs()
callback is provided by the platform driver, the created XPCS is never
used. The phylink framework requires select_pcs() to actually return
the PCS to the core, so the pcs-handle property becomes effectively
useless without the matching callback. This is confusing for developers
who expect that specifying a pcs-handle in their device tree should be
sufficient to enable the PCS.

Second, and more critically, when a platform driver sets pcs_init()
and creates an XPCS inside that callback, the common code afterwards
still runs unconditionally and overwrites priv->hw->xpcs with the
local xpcs variable, which stays NULL. The platform driver has no way
to prevent this override because the common code runs after the
platform-specific initialization.

After commit 93f84152e4ae ("net: stmmac: clean up
stmmac_mac_select_pcs()"), the common code no longer falls back to
priv->hw->phylink_pcs if select_pcs() is not set. This change
reinforces that each platform must manage its own PCS life cycle
explicitly, but the XPCS creation code in stmmac_pcs_setup() was not
updated to match this new expectation, leaving a gap where platform
drivers have no clean way to take control of XPCS creation.

Address all of these issues by simplifying the existing pcs_init() and
pcs_exit() dispatch in stmmac_pcs_setup() and stmmac_pcs_clean(). The
common stmmac_pcs_setup() now calls plat->pcs_init() if present, and
stmmac_pcs_clean() calls plat->pcs_exit() if present, removing the
confusing and error-prone XPCS creation logic from the common code.

Platforms that do not need an XPCS simply leave the callbacks as NULL
and no change in behavior occurs. Platforms that do need an XPCS can
now create it with the exact configuration they require, including
wrapping it with custom phylink_pcs_ops when necessary.

The Intel mGbE glue is updated to create its XPCS inside its own
pcs_init() implementation, and the renesas-gbeth, rzn1 and socfpga
pcs_exit() callbacks now explicitly clear priv->hw->phylink_pcs after
destroying the PCS to avoid dangling pointer references.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 44 +++++++++++++++++--
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  7 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |  7 ++-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  7 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 39 +++-------------
 5 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f5f9fa67ecd77..4308dccbf2570 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->mdio_bus_data->needs_reset = true;
 }
 
+static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
+{
+	struct fwnode_handle *devnode, *pcsnode;
+	struct dw_xpcs *xpcs;
+	int addr;
+
+	devnode = dev_fwnode(priv->device);
+
+	if (fwnode_property_present(devnode, "pcs-handle")) {
+		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
+		xpcs = xpcs_create_fwnode(pcsnode);
+		fwnode_handle_put(pcsnode);
+	} else {
+		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
+		xpcs = xpcs_create_mdiodev(priv->mii, addr);
+	}
+
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+
+	priv->hw->xpcs = xpcs;
+	return 0;
+}
+
+static void intel_mgbe_pcs_exit(struct stmmac_priv *priv)
+{
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
 static struct phylink_pcs *intel_mgbe_select_pcs(struct stmmac_priv *priv,
 						 phy_interface_t interface)
 {
-	/* plat->mdio_bus_data->has_xpcs has been set true, so there
-	 * should always be an XPCS. The original code would always
-	 * return this if present.
-	 */
+	if (!priv->hw->xpcs)
+		return NULL;
+
 	return xpcs_to_phylink_pcs(priv->hw->xpcs);
 }
 
@@ -733,6 +767,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->pcs_mask = BIT_U32(INTEL_MGBE_XPCS_ADDR);
 		plat->default_an_inband = true;
+		plat->pcs_init = intel_mgbe_pcs_init;
+		plat->pcs_exit = intel_mgbe_pcs_exit;
 		plat->select_pcs = intel_mgbe_select_pcs;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 19f34e18bfef2..9af32c26f9c14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -81,8 +81,11 @@ static int renesas_gmac_pcs_init(struct stmmac_priv *priv)
 
 static void renesas_gmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		miic_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	miic_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
index 13634965bc19a..01df4776edb3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
@@ -35,8 +35,11 @@ static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv)
 
 static void rzn1_dwmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		miic_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	miic_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *rzn1_dwmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d2889..6d4bc1fe8f751 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -539,8 +539,11 @@ static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
 
 static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		lynx_pcs_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	lynx_pcs_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb0..7396b68899c66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -426,35 +426,14 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 int stmmac_pcs_setup(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct fwnode_handle *devnode, *pcsnode;
-	struct dw_xpcs *xpcs = NULL;
-	int addr, ret;
-
-	devnode = dev_fwnode(priv->device);
-
-	if (priv->plat->pcs_init) {
-		ret = priv->plat->pcs_init(priv);
-	} else if (fwnode_property_present(devnode, "pcs-handle")) {
-		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
-		xpcs = xpcs_create_fwnode(pcsnode);
-		fwnode_handle_put(pcsnode);
-		ret = PTR_ERR_OR_ZERO(xpcs);
-	} else if (priv->plat->mdio_bus_data &&
-		   priv->plat->mdio_bus_data->pcs_mask) {
-		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
-		xpcs = xpcs_create_mdiodev(priv->mii, addr);
-		ret = PTR_ERR_OR_ZERO(xpcs);
-	} else {
+	int ret;
+
+	if (!priv->plat->pcs_init)
 		return 0;
-	}
 
+	ret = priv->plat->pcs_init(priv);
 	if (ret)
-		return dev_err_probe(priv->device, ret, "No xPCS found\n");
-
-	if (xpcs)
-		xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
-
-	priv->hw->xpcs = xpcs;
+		return dev_err_probe(priv->device, ret, "Failed to initialize PCS\n");
 
 	return 0;
 }
@@ -463,14 +442,10 @@ void stmmac_pcs_clean(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	if (priv->plat->pcs_exit)
-		priv->plat->pcs_exit(priv);
-
-	if (!priv->hw->xpcs)
+	if (!priv->plat->pcs_exit)
 		return;
 
-	xpcs_destroy(priv->hw->xpcs);
-	priv->hw->xpcs = NULL;
+	priv->plat->pcs_exit(priv);
 }
 
 struct stmmac_clk_rate {
-- 
2.47.3


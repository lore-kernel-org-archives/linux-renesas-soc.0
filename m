Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6663F8232
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326054; cv=none; b=qvm8/fUh3Uys8szYZuaad2jGxoFGbIOOHHKciyYM5bnZCBZ3UdFS0xeGVT3zmL+8/sIWEGCqa/njz3bl4vdLFq0d0crmoURU22V7SF7wpyK5Mk9XWREvU1ZA2ERR9jYQzpNv3DNU37WkfHgMV1p15z/yXR2W1X06GqgEgg/GI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326054; c=relaxed/simple;
	bh=KhDrnFLjrE2outf2eXQW+6k/1sAVUlR09j42bo7Wx2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AreXqnomaI2uRDFHBehypQ6iWCZvSCJQ030kLWa+ZyBfjwSzaaVD0EmNkxiOL/DTTuzU8ZE9bI62RHwvXHBHKwRrTJJD+e1z4pZ1YI1zht6d2y7m44X7AWPIgOxR7Jfrum5bYKc5OqRl59fd7zs6YSYflpDQCJIXzEGobny361A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN3AMe1P; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN3AMe1P"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso19728225ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326032; x=1789930832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NB3JxtKcgkk3OGR3H9wZrN9ovALIkubofDJS6nyEOU4=;
        b=bN3AMe1P3jyju4Ds7y/bKVi/kBvEsQOhZPZEBHnADmeCyerElB5YCId4nRGRtA8qo1
         0ZgC0ObWuZgMqR+AKEw3IxZ4C4cvC6PfDc186fwn/+M3nG04Q17QVWxIxSr8MR8J11Os
         182ptU+nIric9TC6aYkg0Pbsf3NCMOUyte0z4WZuNINYMuAhLykPSq22AgSPD9+0Nygb
         2iThU/t1JTY0ZsMjtvGnaZOvkt3XVejB+ILLssdCR2NfdY45gAVYRby/B7/LSTCb8kL/
         fO3Skf6AueiivfTxiY13QDuG4m2yt6P4rhj3TYLqo+bY/cypAxOsUQqVTS/HlPv/OYaW
         85Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326032; x=1789930832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NB3JxtKcgkk3OGR3H9wZrN9ovALIkubofDJS6nyEOU4=;
        b=GM/0X+Znvu8rsXboCNwMA/Ccwxmd0e2Ru9BgXdPX3861Mp/Ptwyde8DRXfjKOgsf51
         z6jFvw/BkDSWYSyUiTb4dcRQsvtvNsb4OOCWLpiZQi70p7NNDeiUdWWrhkAbrzCnFgS4
         rRM66J/y0t7ra6v0GNn7pA6e6TzpW8z3G8kztwxR1WpiJVAXWg4yuwQgzom+zJ76n0S4
         OwDVBE+BrAJujeFF6BL6WmWvQ25jmtrtHX15ufG3oLbmU0HHjNTqXvgx9qYVhS2XF/nB
         LRcuwauhwrZFqUeURrArMAt4SrUz0hiweqnNNRxSydhi/Shc9VDNPOa4g/ALVweuT3Ky
         s/qQ==
X-Forwarded-Encrypted: i=1; AKwUvBw630tyUZJ4goIlXP9yc0yJ8mxX9mwV8sMLF1YjSK/oATQGh2vDSc0686nQdtM/pnYEg1A+M2VDulO9zUjvlqMaCw==@vger.kernel.org
X-Gm-Message-State: AFuF++mMlTh4+BJZAz4wFNKwtbNxx+ow7Vr/Nm48cdG7AR4jLmlfsTiV
	O+sc3ZPKYNv3V5qJqhRjmxseSzMCJZWiOptl4nUAOGCbZKT8LR3xBDTt
X-Gm-Gg: AYBFou1DE6/bLCuLk+QpBhkvFeq0FroMWO9lkRwc35YApBWYQpQxSbEectgyo/yF5G5
	W5nK4iUYLfyzzeIlgSp3Bh0Fv4AbylcOi2mOidvaA2WS0JG5PhO69XZHZ1PSlJ1qi+0rE5D1CkU
	jt6X2sqwezIoR1cg13+mwTVxA/AaZIpIPxsNXFcAjyQh2mg+YBAbygcLsx5ZNg0VAEO04LfKrHO
	d76L8Yxlb6/j2V1X761bVgb79hN1xnGfeRVwLC8yDt/XTPOezWspFBQ2cDwEuk21WUPmn6IjxuB
	ZwOCUqOMDkZHW9qqHgEsV5s17PjqVznsCiG2M9cni4CwSFnxD+Aph44UZ/vAgVh/BZZa0KRI3sW
	SIFGxNYkXtV8mwgQUtODZ5Gk8I+t0w1E2RCXkEkxoDRUGrI61SeG4+cZ67AeRrTZxaBVejtEGTz
	ERa/MRzMOpAAt8MIYCExj5hcbM0Q6fe05fjmOPuUSFb1g+9KGz0EriNvN1nJw1stZACmmawA==
X-Received: by 2002:a17:902:f60d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd2a34fd91mr276627985ad.17.1789326032455;
        Sun, 13 Sep 2026 12:00:32 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:31 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v5 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Mon, 14 Sep 2026 02:58:41 +0800
Message-ID: <20260913185849.907479-7-coiaprant@gmail.com>
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

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process. Propagate the return value of the restart so
   errors are not silently ignored.

Update the comment in xpcs_config_aneg_c37_sgmii() to note that although
the DesignWare databook says AN restart is not needed for MAC side SGMII,
some implementations (e.g. Rockchip RK3568) require it to recover the
link after a disconnect.

This is not a fix for an existing mainline platform: the affected
platform (RK3568 XPCS) is introduced later in the same series.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..8c3875b6985b9 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -761,7 +761,9 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *    DW xPCS used with DW EQoS MAC is always MAC side SGMII.
 	 * 4) VR_MII_DIG_CTRL1 Bit(9) [MAC_AUTO_SW] = 1b (Automatic
 	 *    speed/duplex mode change by HW after SGMII AN complete)
-	 * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 * 5) VR_MII_AN_INTR_STS = 0x0 (Clear CL37 AN complete status)
+	 * 6) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 *    VR_MII_MMD_CTRL Bit(9) [AN_RESTART] = 1b (Restart SGMII AN)
 	 *
 	 * Note that VR_MII_MMD_CTRL is MII_BMCR.
 	 *
@@ -769,7 +771,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *	 SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
 	 *	 PHY about the link state change after C28 AN is completed
 	 *	 between PHY and Link Partner. There is also no need to
-	 *	 trigger AN restart for MAC-side SGMII.
+	 *	 trigger AN restart for MAC-side SGMII on most devices.
+	 *
+	 * Note: While the DesignWare databook states that AN restart is
+	 *	 not needed for MAC side SGMII, some implementations (e.g.
+	 *	 Rockchip RK3568) exhibit a timing quirk when integrated with
+	 *	 phylink and do not restart AN automatically when the link
+	 *	 comes back up. An explicit AN restart is required on those
+	 *	 parts to recover the link after a disconnect.
 	 */
 	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
 	if (mdio_ctrl < 0)
@@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
-		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
+		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Initiate the next round of AN */
+		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				  BMCR_ANRESTART);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.47.3


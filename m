Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF484AF9C3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475960; cv=none; b=hwQ0h66B1yeXq7C2nwZUNf6F4KByLmSEzKMs8LQyNV3ixuF7ZBUclIgYmUd6HzbYctrhcZb9SLDCzBvCfOTcM/8u+DayIeyiYG7nEQgxLtldQ7MFjsiyaDzq9QRT9w/D5Ct3YkEnhAbh+ZIuQAEwc5hFVXofKduixfTIZ1XoiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475960; c=relaxed/simple;
	bh=rn553Ps3qysqjj0bF2NRCTgDBT8uYIS5tlYEIlbEX3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDDIBIDa8Dm9eEVAAf8QnPGDxORLIbf5d2RWqbKpQJkpmjQ4JSB0VRO0LlejXe6cFn6TD86pya4Ql6hy8ihN5VrCFaz3DotRDtg1eExHUfrK9RvSpVaVucjbGBysbrN9kDub9wl34qr5KUDFWQe/xrhKVgHYszGKAlDCrxfUrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV3tWDT/; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV3tWDT/"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3989fdf58bcso265456a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475956; x=1790080756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yjmztt9FS1A5qxNaZfWYg6PvzN0Znz9LRYwH9/qf2Qg=;
        b=VV3tWDT/Be8zKTKBBtaT6I6Lri4lQUDNveGX7SkKh8BQKvDjVqPLHrnTJUeXax/RIw
         kfhyYEgVV9BGpBURUTH2ixxuEoPQTMQacKt6p9oaBFdnc9zkA4hGZ9CggqOCV9gl1b8v
         ESU1+AhLPb49f/l1w2hA+4Yfj9veS2kSmatsw5mn79gZMBgJSLWq9hdCkW7Mb2/r1mzG
         euXxotylDqlZXH9XkJrpSjMpm/oH2WVA9TWt81FcCtZeIp3pqSCFu6NNs8syJQ9WNpLm
         qTanwrzwZqvMu7H0FT5eAsfc6S1zBoHicRNExSbB4km6ntLl/D3NSpjwfDQCBDcjMJRR
         R4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475956; x=1790080756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yjmztt9FS1A5qxNaZfWYg6PvzN0Znz9LRYwH9/qf2Qg=;
        b=NDouiCGXxVW6EL39r1O++u01s4hHlx6xzYxkZDiGqd18s9VIAalA9gfUsntstDf7Fv
         fGMJ1f4GIoxycr2L8f2dL2Nz0118dW82P1Jgkq1dfALsEUNxF48gHV5GjI6QvSjMx8zG
         zi9AOg6uJb2BSPkqaKi+g/dH4FgoQs+pdjnXhr6Rb00YmmKr5RsoduzwNbeEsPETlykn
         j9S1PTgf2uKohbbMfl+qh0ILvzP6ZNo8piAaQrke5wCi8w++Fb9R9bRl9OYn8jfPNHUH
         C2YcVz9zwLio/Unozol9a3KiYG+iiwmPrlk6Walduji++YGE1EGtI4CWv/MFIJptzCst
         SkmA==
X-Forwarded-Encrypted: i=1; AKwUvBzi0ORHmT70j7Wyl0eG+YWbNoMsCFS9YnZTKV8Geh1qGFOhVy0lCXLUSGQvRHrrNY0NWlrir5f9EHPj0LaWrCe//w==@vger.kernel.org
X-Gm-Message-State: AFuF++kFphYJI0S4DotLr4FYntT1chMoT7+Pl5KWylqJ1gj48BddlgJ7
	wbWHlDxhCgTeQo4DBiluFINSWMsl0Y8rTLaymuD0Odh30gZOsGq7xDCE
X-Gm-Gg: AYBFou2BNRGJ1UKzpWGR9sXdonN/jgFgvIh9Ea27fy3ZXfYqSM/bBHqJ2R5+mncKt2K
	iLFvskJryDRgLbVRH+cHz3bICCDbnAu7U7xnu/zb1VJOTp16vS0yZ7LNQoVvshBqObx4ywGv/iU
	D9Hn+rTyHA5nYA3/ZGsRcblekfeZmpHm7RVuCo/ESGVuTx6FuPhL5ZAob4CrKXLVwMLAVdeCJ24
	nRantJSemRM/MdHDfb7SMqp6lQP9Cj0W1e0Qd9vCmfU1Afvb1GeKxthsU82y8X7kLjX2jU5YTqA
	vb0xNU4S68vi6vbQgjuQidCW6MJZNizZ/S4CBREbEKcUQpKBfTY7wnPtS8c0ERh8qJcyO8Bxd78
	VOR+qIy6zP47mHdc8QPAISizU2kdQa890fbNp/QQhxlVjdVTiC7r9E6iAwr/kIR0Kr3MKWXUtta
	U2wPsXMnC06JwEtc9qaBm7im+GgHtPzFtG3Epov+YUPU9qVhGvIL+bmrkeNl1JMZnz7LGCaw==
X-Received: by 2002:a17:90b:498e:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39dfecaf6bfmr3959422a91.3.1789475956259;
        Tue, 15 Sep 2026 05:39:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:15 -0700 (PDT)
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
Subject: [PATCH net-next v6 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Tue, 15 Sep 2026 20:37:55 +0800
Message-ID: <20260915123802.1561724-7-coiaprant@gmail.com>
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

Also clear DW_VR_MII_AN_INTR_STS in xpcs_config_aneg_c37_sgmii() before
starting AN, matching what xpcs_config_aneg_c37_1000basex() already does.
On the non-inband path the function now returns the result of that write
instead of the DIG_CTRL1 modify.

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


Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998994CDA0E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107482; cv=none; b=bRRQeL2RydIo1HOgfkJ0XrzeiBFZPScxeG/GWVDOGkFqPeDBUkI64jRUNkXycURFXN9wVTp/WLmWV5bw8P2qyJPfcIfytNRp3DM2FXPB/3nj1cWyTje4rK/jEnDDWmwzcdtPrIZWBc9qrUA9XMOy6+6gk/a4Xa8UEOg+nVtSOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107482; c=relaxed/simple;
	bh=k9eLD1ZrXZD1iMizDWP4jTUk+ML36ocfJ7jazjazAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgyIMGqX7uR4wVXItTo7gQxB2vVT/GbX/P/UQpoYwxndRlmNrR3wA5TKegn1ESYw4D6JT2HAl8MMXG5O+kKHKB/ah3brUfmgMT67/1WO19NWbsHZMLt89Nyqrdmp3e3P6lko9pYaMTJ90AlCq0ajjLe8LIDoFkVsQz9GNkm2Nzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeAb1uHQ; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeAb1uHQ"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2caced6038eso1810315ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 13:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107474; x=1790712274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=LeAb1uHQ/QEIx5DWr68k/8/JzDe5qrf1AnKNJ/S8U2S/xNTt7Vu6iiHAY8H802PwLT
         6Qh1VHdaTNdXVbWJLu65mIIKngtxIjJXXE4ESzchdCLlycBZrvFBN1tsx/SWVLBSXpC9
         unelFI+6rqtJyp8wu0Zep9dop7wetSHx2pKcvTDeUfixbeMUSCT0Uw7CE2UZOn17Vaid
         eLQrJABKKEj9ZTV1BkPYbZO+Q2ozAx7rpKh38vfaApkzYEs0vdCBCPohW8B6wrCI9mfa
         iLyJApwBPIZwrFDKU0DwsAfF3EvpvuBvFyTC2MIzHlvG4xcIYSB6ut3TT7BZFlxpQcVw
         gqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107474; x=1790712274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=N/O3H/YL2dmyT7cWfnWjz2NLgpXCGaZQT2oQV3JWYoopVIYuoz9LFRvLiz1cxuvF4l
         z5dA8dGUkcUGaoCMTxQMcbTJEWlXrVfnRzISpDqyFDDG9vFhxMZU/aMygJN1XL+NakE7
         aHrvR5nTYBxlneIad98d7kdIrJJvDCo7aQTKy9+gawjotZtZMPRquM1CgI+P9eC5Il11
         cJc8T8X0XVCZmERCvmJrKN528lVyxdHgkOp22OVpE5sX5EcNkqi7ou0KkQC2BkC5Nd68
         HEx3nGV6BfYpl/sr7+EsXwL+zcY2giduvA6ecfZeBHfakmxXJ20TtDI++xsWJ4ihZI7y
         AkEg==
X-Forwarded-Encrypted: i=1; AKwUvBzs6OWELfIRnS6pfPVSqtXVsdE6N5G1In1UturSWopwx78dfP98YdIzSFXaZsluscWe575WkN7lOGZeSvqDUvWJBQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m27rq6TqF0Y4xzs0rPpdXdZnx1Fk+fMxXUoY9Wd/TPHN6ew4uc
	pbnEyzbCGeQM/qme2KAmlUHE5VlP232uIqchSNCa/3Xer5Xrsz2SaLlc
X-Gm-Gg: AYBFou05WWVNbpSNKwdPWuvjSHy/sSal5QsWlMIgohzMpCdG06eeiUrzFGZE90Oo9Mu
	xrishsSVva0Clu1tJLb70Xa1m3uFHmlS1sFcIAVgTcYXFkR6w/IjrPVTR/9JXeH05U78VhunYH6
	P1m+EAfUCCv4NwBA4yxTpKm2+jEB/qN1tAqDHaQSwI/uGUngwS8803KjcEVvjlFKLRtkDuI9wAk
	5Cd5RqDYeIrCZZN9cMvDBnEsiULFCWKr5nExz4To8/PaTZRtCSPtCgmRmlEm4Enf0Y2Jo3+hdER
	J94/4xH9/kiejAFpCKvWt1qbK7cfhgE8/o2Fud/ZtiSSEgVKLSrqfN4rVT8+vwTNq6dWU0zZhxw
	2KD/D1Wmia/tSrS70Zx1hV2OIYUy8XfAGlrPNkAoplv0MVHz2nwS2A/tAKxpBY/6meOFGTjns7b
	sDTj1WDyhZj+hgut+WAmJgkBeTL1T9v2545L7HkB2PZWFp5EpBMe/UL6iE030zXVcgMiA5
X-Received: by 2002:a17:903:1b30:b0:2df:5c13:b37c with SMTP id d9443c01a7336-2df60b6920emr18526165ad.26.1790107473545;
        Tue, 22 Sep 2026 13:04:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:32 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v10 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Wed, 23 Sep 2026 04:03:30 +0800
Message-ID: <20260922200336.2201212-7-coiaprant@gmail.com>
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

The restart cannot go through the .pcs_an_restart op: phylink only
calls it for 802.3z interfaces, and SGMII is not one. Changing hardware
state from pcs_get_state() is already done elsewhere in this driver
(xpcs_get_state_c73() calls xpcs_soft_reset() and xpcs_do_config()),
so the same pattern is used here.

The latch is cleared before issuing the restart, not after: clearing it
afterwards would discard a freshly latched ANCMPLT from the new
negotiation. If an MDIO access fails at this point, it indicates an
unrecoverable hardware condition until reset.

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


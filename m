Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F4360ECC
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594243; cv=none; b=IjLU4RmLsUf9sBw/IX+xFQuQwziPwxeJ1ADWmZvbchCuTg+2m4CY5bNmzTfvFOOevB4fPTIpsJuNG7lpb/btQLU3/uhYbtp8okcPQrQX+cSedr4OzAKgiMkva8FjhxoTOzYiJcHk4uVrXSglL2aBHASU7MkcHQ66eAYjhAA75MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594243; c=relaxed/simple;
	bh=MByt4Br9AvoMjfrWMM7sUzmYzlA9pH4QiEgDjx0OHTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKUQXyisrgqbEXFfuHR6DYFvsHt5KsUjOVPi3YnTeXB1d2LLR2wmzhvPpK2GN3EbU6U82ZtISrZrRceRcAOVMGiM/cvrVGLAvvscvDg69RxyFqKq4EWWCPQuqDmiuXNtfZjGnWmMwUmOYwMCbhwghtPew4MTrY8/+bs4Xu9a/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l84TtRlP; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l84TtRlP"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so9632275ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594234; x=1786199034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LX6e13BQ6UJAH9yya+bOU5LhJJwhDdd8JlyZZCveOd8=;
        b=l84TtRlPVmN/7xCVhawM1RhgDmgo7/3Zppu2jFfDcqeyarAxabmuqEU2CizloS5SoC
         a4gWMhfA4BtiA+BUV9I0cpuWq8qf4y1xnm/ZoPAl5Pd45dIim3eeqUk3Hq/DfIbK38SW
         20pmAFsH6ZJ6sherOw0W91d18+aDXjXK968nWE8moYF460xj8AjmiSFWSOBZtOOUC9sq
         2cNZSbHowUs0+twFH4c2tDrdDEvgowI9fMmoKbPrEIfpD1tuqf+WA+4VyF1OtGzR9qWu
         +IGxpLJQUHFsYCtrqKwldbPINy0syjTuQpfeDKaNnMbmjNbCssPrkPZOTezgEXg7oE/C
         xplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594234; x=1786199034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LX6e13BQ6UJAH9yya+bOU5LhJJwhDdd8JlyZZCveOd8=;
        b=jUPzZJ3UMnUNwdY28DZrygCWG64Q/URpA9JrqjPXiFB1WcQbVp18bbwW2iDP1NZy1F
         ReA0thiaWGAighYuZIxmX3JMk4/dEqASimwFIz+wZ2pPMJy69LG8knNsFZFunD+Vsi6r
         ILhw+fUdSirlzWAy6f8smcxWIkHb290W5LAk/u9rnuVqPSETshc3elfZOCNOGBFH559z
         gK6xtfi2jNcpQ1nhl5Viefu9fFnehg0S+G2me5Mz1P7DBHujp82r/JIHdJlYklTiHaLo
         T7nBJhOSniIkXXlFrpbQ0H/TKzkvh+ZUCT/dxYE+QQAW9wEopvAl9Mf48WkyqVHJcJwi
         IgLw==
X-Forwarded-Encrypted: i=1; AHgh+RqWGFIWWJtWCrC20ON4sSCJlCD4bTUy8kOiNEAyXoomXyk3uWtUWJt0mvZz1euNmKasI+GrZQCYfjpn2oLcfUwq+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdgEgTH6EUHlakQNfQGrCi+3xOIPhQ2fnBo4CZYqngmL1WrFE
	axYnTBLdfcNM/nVHRt0q+0/v9OFdWdilPmkDRu8NN20h6hfvKUf+sbiM
X-Gm-Gg: AR+sD10PCJrrcon8kW24gcPanE7buU8oKi4RGjeTJ1asaKJggmcn8lb025uWbkTVqcc
	3PHr79hr5SzXkqjNJHDItKJqisdfkpVoDoCeWcH8FdXHjfck4ZwWe5GokQvIBOaR6Ozla9KW1mO
	nVu1pjT7JxzTljWkpuPfjPEUp/iSHoU8L2cI2+SmNQq2fHEEn1Zg0eoRJHXR7kN5ettI4gjiyaf
	rtUgyvTRg7rb8j5TUDXqxas2VfjO2NvdtIjmW4PwKZeYAjOSFMm93bIoYkSwXyXtXWbr/0q2lFW
	Vuw3KdR/CilLEu7FKyV2ndPffDXq0Osk9KAs4Lwxkmp3I0xoaSXIPTV7ceXj1TZFBGaslEkMsCR
	8djZOTop+V96zyGd7pRipRlH6XjmKN+NLmbfGqVu0M+//X3wHWk0/08XhJYswdpkwIFOm+tb6dE
	5/wQIAwYVgnsn+K0+KVaW0peING4rW0HOPCUSUs9cs6OrbYg35BQ9auyQ=
X-Received: by 2002:a17:903:2f4d:b0:2c9:97a8:8c19 with SMTP id d9443c01a7336-2d052474babmr36307755ad.44.1785594233641;
        Sat, 01 Aug 2026 07:23:53 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:53 -0700 (PDT)
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
Subject: [PATCH v2 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat,  1 Aug 2026 22:22:30 +0800
Message-ID: <20260801142244.679437-8-coiaprant@gmail.com>
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

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process.

This change has been verified on:
- RK3568 (Photonicat board)
- Wangxun NICs (no regression)

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..28e98449e8ac2 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
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
@@ -1089,14 +1094,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 			state->duplex = DUPLEX_FULL;
 		else
 			state->duplex = DUPLEX_HALF;
-
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
 		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
 
+		/* Initiate the next round of AN */
+		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				    BMCR_ANRESTART);
+	}
+
 	return 0;
 }
 
-- 
2.47.3


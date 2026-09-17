Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D893ACF1B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678046; cv=none; b=AUhbPCsO7mGBNHzn/+bOSLa9hwxFWxsNk8QjrytvdTqLhvA+88V7oUDbV+I/ElDZ9J69jJKzWoA10Ci3rboSILPVSlaHkjt31sRAyRc5o1dN5vnxuteMN5U3aSJrQEKeRTqEPzX/LRtdbKa790g2nU8H+vpbNChWiR6Kwh02/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678046; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4kLoQcD6wE0Ip87fKA1+GvcQln7aGeN2H8n6pjeeoOqBGYlI0kLIzPX8gOl2gIvj120UxJI+i7s7hGt2wl1ofR9TKJ+IsO/BAIPPQWJ+7UqZmaC1svovKZbVcj2a7dExqVtWkdA/qYK39ffU4RML9XABxpSRr5O9fh3vtqmdlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suS/Q+UW; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suS/Q+UW"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so21459a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 13:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678044; x=1790282844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=suS/Q+UW2CV1Xl/q+EYnSA6Um759ZNK0faaFC7wsn81ACWaqaGKlDnFD1he3vmDc+b
         j8KJSPVcYO52QHz/TFLthOL+EOh1Y+OBwRlWyZulIf9IQBNy0kkItvpBjvn8TyNqK9jk
         +mhD0JXxtwzC7zuhZDV1hh1MZ8Q59OXdPZQp7nY8TWuq9PyJ0f4PXJO/CeEliZVU3NgX
         XONP3u4ww0vG1tro7dRkE1+kaBoBheRvl/AvhLUqlyKXxSo0kSjc1VZs4h3zWWIbWhzy
         0ymrZiOB3u1vHtxIR4CYquI+thaBUHxxasoUfjcOf553/aps+t8KkfiRE9IYxDfrMWsH
         NUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678044; x=1790282844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=iEgSWwK5z5ta7J5XbTb7VJ2Im2CGpHiaFS+rHDTEja3v4Pq97tyL/eSBjaR5RZjWpJ
         iCxTHDYwCma9pny2sm5+bBcy7zLqEZSZ8aDqGH6sJhlOvDw10y2Uc//2wFOlGON/EcPN
         qNnGmJ/rrpxNoNJU8SurWLtebDbLntnZXkqOa/pfHoxdkVs2EO9tIRY2Up1EypNmrdPV
         jcH05xGtMziVkd4Xd9fbYeJtCHRCX1xRd6iurh+BLf8X6H0zuc3Y8iJ2Ttu9vrf4S824
         df4xZ0lc3b2BzASqLAZKnb/Jv+H/etb2y/a/P+9VV37+nCWgWwvpD7+9b2hLuzKTnwB1
         EsBg==
X-Forwarded-Encrypted: i=1; AKwUvByQFyuVM8RwSLg6DW5432TeF3/req4k1mv3Wbmx+uKO5Zhf+9tLfRwhd9eIm0qUoeKHlzq+2dQUSSoOvi/kfP3sHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n3gUJpFFdAypGgXwW0Zd36X/q5H/9dsftNdAOOqBPUSAG1lRCk
	aVPZBBBF/Cxia/xEyBos3ZjERBxkQQDHlPsAYWzxpgG2M2LLidR65mFN
X-Gm-Gg: AYBFou3AbMFTmczSvmzaCt78FE5k6gsfyf/AOG7LSAJiok7N2XjZhx/HKgRwut1VxCS
	uZisiJo9WiFuRSE2ILzDpI1DrmGhc5Z6Ml/k6PypHV1FfcgAehV2xmG4wfAY8R/ZJ+c+TGbj6P2
	3KX+XgXYg+I4EkLgfuoJXETV8y+AZjMDE+mjOOGv3dvlDdqlKcHIQUNmuUjRDFyPEq2IFqpOPVt
	BJtEYbEprI8X+rIhQniAGYj8wl/vuOjZSeFBRkZl3HsIHKr2WNxLdqanRZlNB1Zjfi7ik1uPbBp
	8CORgXwa4f0t5Dgqbem9fTRWXyi9EA6pF7bj0krq1Q3PjN/cD7rjB9bjG3lBogan824/gi0LEYW
	+LG8gWhiRtln10zLBTIT4+uwuGQdTlhbFLFaWXAViq1UUyxwx67cKJMcodp/CpGAVuB/svNWkry
	bfOJjotZYYYC96qTkVltJlfRbuYtrJiyfYmvLKsYZPQOAHtkaR+qEP6FV37mYjHKe1/NbsE6vhi
	VPXoEbV
X-Received: by 2002:a17:90b:3fcc:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-39e54d36eabmr634669a91.4.1789678044538;
        Thu, 17 Sep 2026 13:47:24 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:23 -0700 (PDT)
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
Subject: [PATCH net-next v7 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Fri, 18 Sep 2026 04:46:13 +0800
Message-ID: <20260917204624.2427486-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3


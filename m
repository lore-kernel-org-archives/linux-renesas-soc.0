Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F43C584F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923746; cv=none; b=PvE9b/jFa9gq8pnoMITM+0ttRi38pgSKmUU95p8TEWIshD7Utx9OmB6HYPcJEBU8YNARm/nYI8nwu4galPYxjBFAOCO2rX1TEriYi/3gaiqXaemYsRE8uXWpcVfSUaaWVPGEn39zhOwdI50dPpiKD3wc8UDSMXZY8vWpwGSnW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923746; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANLnfiIGafWSJGr5abUbi5HJgU5nxQVrt3ZUNo9Uk5IMOkZXTVpUoEXi5y7Etyc6fH6wQqWed9SdS+Zafg94TFODPhrxQ48NmtSxUSC+oWxWL/3uVe/R45AoB4OVZattqY/5vkYK5nmTK3tmrkEmWkeFSCuobaWi4yIHDD3p2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSrVPADM; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSrVPADM"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8b7so867178a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923745; x=1790528545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=GSrVPADMJ7gNakzuAequcbGwu71JjXBCM6cSVsLQtuFeLPiLB+ZdFwvOUpLvND2oRX
         kD3fFLPE5sk1qxYiRvDFZrH1Da+Mg5WK848/pwAXmLU2sGnLc0BwPhJUuumtZ9NSWgrt
         e2+KzHVqz6lEdOCudgAU9b/WWHoCVhepMQ0/fQQtug2UZA/c3U7zR+ia4fcgqSnV++al
         /XTl7DCaKw2VKlBBr46Qn6dI3hCftWPG2LQo+oG3DtrtSZybIRNEZ/IziJMcA0a5W33v
         q35yrj/SAfC7E7a48SEJban9cW1v4VtQl4T1/UWbsH6woO1Ov+SFjJ8QpSn2ZW7igvWs
         wxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923745; x=1790528545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=rqrkDJgM+/QmswXDKtUPfoOaiKuLzqCxq5qTtCAEvUbZX3xEleeMzqQLIzg19UXkGz
         JeGD8yXLfNv//mW3yv+b2MbjttxGPP7xjyHRhaJJFlhmoscmb22wB3972ACMWs4JzkmO
         +bKjGq7RhpqjB8eNefXt9y3k2nvDpOWXQHpPzqisTwIPiPcXzwZVQFejSIMLNHSM3a/4
         OYHxPEwBzJzSVmLmRmcjjJnRCMrMiYPhf/+v2WFtwMizmzbME2565M2JNe7rqt8Km11z
         kJHaEx/HCllMDhJ3WhKbgy56Us8Zq/3BFxvW2bNFebRtQ1P9a+rWiJBlzdiJ4SJb3bhv
         Tuvw==
X-Forwarded-Encrypted: i=1; AKwUvBw/ChOxGccOlW+GTM5sL2fonxfejaSVmOSkxHbXRuQI+rFPkSqncxNjUQU3C85MEpAapdUegn6o1biQclf99BR+8g==@vger.kernel.org
X-Gm-Message-State: AFuF++lg1ecQXC4CcYMPo6FC7h3u+vWwmkkCVhjn1b86PZ/LvgNkOZEu
	D8ayNPuxY08NUCiymVWORLjtRnYvmke9Su4BaYrdfctt0P1gy1bjD+uV
X-Gm-Gg: AYBFou1ubZ3CltfUF+bL1UVcCcB5EXxeR4Z1Vgg+AQSQswWDrZWrTzlyumSndkCjfHR
	KbxvRfJtBXZSlKGQ+VoyOKv8NiNI86TfxJTfyg4U/mBBYTlIOyV8TCe2zRENUx1CWVgPTN6qFhu
	S2zYiglWGf4OEoQNNvVWHScyPcWYuEmO3ckubPFyhXmehBI7GUkhVZJ9xhAJTlB8VXAO8X6JthZ
	QnXLb4CYyqvAaGc4ChkSqushp8IRWDiOELIDDMB43mJelLAPCs6ZowpZsCPHlQiUuOVkVv5UMjP
	RhIDhauIh2z4NI+Y5SCV0DO8dOVVDZapunlZNVNwVv7ZbIoz4TNiHdTg+WYSZ8ki8T0QFLSv6UM
	/7A5JBzNJD+PB+03JcNxN1Z5qIWlYEE+Z3tp5eZe1dLtn0q+UDuMLphBhu32HdDUYIWt92yO91U
	bkSiISFOgXcZW0mweyJ3m6UA4HffH3MLd/i1zS8ldmONQeyGXrSR1LnRm6Sp4CWqX/uETjbFE8d
	13xrBSa
X-Received: by 2002:a05:6a00:298e:b0:874:708d:b621 with SMTP id d2e1a72fcca58-874e02e5f4dmr13003999b3a.31.1789923744661;
        Sun, 20 Sep 2026 10:02:24 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:23 -0700 (PDT)
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
Subject: [PATCH net-next v9 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon, 21 Sep 2026 01:01:06 +0800
Message-ID: <20260920170116.3624104-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
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


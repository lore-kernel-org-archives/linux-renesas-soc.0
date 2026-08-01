Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FF35AC33
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594214; cv=none; b=lrL/K8KCrr2RrA9/mvvuOlhjZ1tcfretmouH2iupGVvsyDy/2NWojZfNC+OZsHy2QxPWUZRjZBGCrFOp+oR1rmlhnfExH4/yB2jiOsB4qtqceRXa1KCaqxWHizW9WyBTpN/upY7d/YQu/zNjJqs+2XElNW35gJKiTwImr30VmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594214; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQngvCdUioqyd4jgHjf7l/nGix3kASXaSPfUkCcD64uHidNjB4Mg+zqpojUvAOHYMXjihWOwgpGVFg8T84cr0jMC13VpzF9cx8DEeIywg9HEAkUygIdP0PGbBLPfOMgK2pkY0Gnl5o84xgJjISKd+dCZHuNk0pksZ8N9t0NSrfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAJ0FX53; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAJ0FX53"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc2c6e0688so14638005ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594207; x=1786199007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=XAJ0FX53IV3ce2ZuIOWMYtvkboF8ATRrIx1m/aKVq9BxORjbwnCw2j0Gb+KTU8s/D1
         9uFWCSS36NHHxh98OqY/mlQ9kSi9YfYFpIAMym4YohVvpXQk/TW41yg6tT4t/9LmAcsS
         HoCH1HoXCxkkNM9sBJ+HXNQIwuAum8IhJFUKualC1mqPiJ/XdJJX3Ua5PQX2P+ttzHx3
         XRTn/vPRUedYWRY0+eXej/f2jX5Bgi9wnkVSLNL8waZMLCJ2aRhy4bBZ5m3VKnu/wRvZ
         TlfhW0oroGxdvPuiTz9X0dSQE0/wIFbBaiuy9cIbJnpizwjwla//1gFhMkq4UgG92+ZG
         aoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594207; x=1786199007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=DsG8/8oKVErCVGMgAH2+pS+zsGfh93XVaxRHl4457YdDyFtTO06E3xgwKJblAdF3tO
         BXjYWRgWkPP0AveG6TS/Ypa/4SJs2BiWxdTwlZaJps4w7ti4yTFC2//v4CV/DfXjS7D1
         Kns+sbrrTdxv2dmRL5ru7mVBSaKYLJwdFEHfXkPctD4Zzw+CVsIb6ZYt5Z7CYm/Jr4Fz
         S1a6/BNiStHJwJbMfLpMTeRk0tMv2VGlvBLzK/1XnhFu7/+OdOTYvWrEhzl72lMUGJBy
         0VTkZN85X/hC0HCDkhfwdxA1jIkHEK9mnSqA0iSNm8b3+BAeqJbeS8bDHN0hf05sf09l
         8EQw==
X-Forwarded-Encrypted: i=1; AHgh+RqhW4fg+dDm1lRzdD6EA4evzKmHMTRK/DKBMxfvx84vpYO44TpMPuAUGxOPhNuCWPx5e4Y/daASm35mDmhkU2NFBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUfrARVLZ6T4CXNwrY+DA0w/xniKpfrnr7dOi9soVsbxi5FfW
	7yE5Z8ZHYO/HYE3qzl0i2CbHgvkP3YjhGXGvMeEXKOJDzo/KjwMD0gyv
X-Gm-Gg: AR+sD11vOrFQeQ0Lc9t2n/C7QWjmYRHhpyG3wD7mGxq2Ix3jKrLts6iEivnabFduNhc
	xFOcmYJlceYqbx3K3ipxSFyKBMarmmZKOV3zet8mldL2yJc4yl+RpRlLgmZBeUOuh0ttkABakJz
	rKkmmCT8L6Asj3bhklmTarSqopuq24LfxXc7anLtZ6gkuuWzD/9Z2DKqIdf9QQBpu/C1wPhzPSb
	AGLCxd/eqVKmyPiI+DC3pvKTTXO1T70ke10c6bx+HwGxIqyN/jbnm1VSqUDUbC43iyvE+jXw6l+
	4e7/o+tWlTuoOLUZH5UzbIXfOYBhpnH8JT3LfRcXa8U4xGI+MGa+z43k/Ux0XOpS1UIlo2fzc+u
	WQKT7Qpwh+Jrg+abimDNPZ6OMN+lomXYrA3kkk6GyeIK4nLpaMLxcaC2ml451CxAS+pkVBbCKxt
	yzP6BYzGLdVf/UFFVYVp1GQ93ZaMuYpjhvmu9GF/DhZLaqTadWZRfO38+RhQiZ53ndjw==
X-Received: by 2002:a17:903:2b07:b0:2cf:a5da:705e with SMTP id d9443c01a7336-2d052494227mr37113295ad.41.1785594206913;
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat,  1 Aug 2026 22:22:26 +0800
Message-ID: <20260801142244.679437-4-coiaprant@gmail.com>
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


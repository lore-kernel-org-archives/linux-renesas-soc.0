Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968B46EF9E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923803; cv=none; b=vE28TDItNjeNgDFaDhFwn6TpCcCk2Bam+YNSX3oootPd7B8vbSfbVVQBMfH+aIC5WSECjP+GNFiFtnhv0Km6066YLdzT7ipe5ERYFSl/7DqyHFt/dttLH6+acabd0+OPiF7im5XO4KTIf3XzxwG4Etmsr0dBwpfzsIX1bkSVcd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923803; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/NaymQQ+72CE9D8rhFGZlaAWKN2VZlHrjFDASUXBTzFe9+piP02pp3hw09ZE5oQjkhoQWOlkUdz8Y7OGcGsOdSNtXZYAuzctANya1pRRbPldeg0P7qHlnDOzT3dP3tJw/RVC6onLT2VVeLxVTrYgRk6DpkCm4p9jj96ideVDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwZTNyoe; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwZTNyoe"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-cc4c181b42bso1622869a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923799; x=1790528599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=FwZTNyoeDaJNgBcS74Wppi5RIdDcvODv6K0TcGuasPWodeMiTjsZKUHMp36N6p2mn4
         eiUv7wtTLJYkoveeAr9FRfrcxvJ/jwEV3Wkl1dEWzRPkLZSrTYBm2+aLqEFlahQzlgok
         K1SmgOSBd6+4WF7xaFviAtEboUhMNhGzFl9OTZQB2EMefmhXICFFus6ETtWeWOrIq6D5
         /CjZgqHBZGGdNserLQHrapM2gLElH1TQi/DMofl6SXz8gngTz/z+IrhOJmOv0zjc/LfA
         AQrOuGrs9JLjzWt3BDYhpHGLgi7GZ64RqVSAfkHmhJgUQUwDB39xwDrCm/ufTr74A6aK
         9zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923799; x=1790528599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=bfWwyiIoeJtgq6YYeZQdv+xuwTCiMbueZRJXg9O1dDsZUCihwYDoFwMmHBkxYxYNF5
         n3H/X0R/qzN4WMV9sVYGfmz+RGQybpA5qdijyz5IDAnFoGDyFemloNi8dWH8u/1iwtNN
         c+49IFf6tOD+OjSCuUjLYxALFdH25xQ08oW9i+NQK3//Qe5/FHz51jeRdDyomSGvIFZ1
         QbLNTCwRvhMGAPe3Kc2eyQd7tgan57X4PbZayC5OhHlUQ0DQoALmtVj3Dygnq4ILukRn
         pyFYjVT3kWWxwKg6TL89Iu6U3I5oSJ3kpeihFStuKjLJLchd3Gik0SNc2xPcXfC8CKId
         PEYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx88VhIzmd6r7ZFdCBZ4x3w1Jd7wxE3Od2jggBwPvO9esgt3AQtmj4isq5XEgBU2rdwfSWJCJZnQWu8EguWqUvtlA==@vger.kernel.org
X-Gm-Message-State: AFuF++nf/vvalASISNOfURTxBkW+u2xXg9wiUDdvl/4oWma5UkBohqAI
	r6fBsAK46YVbkRMpfCbvqMCwjGt7mubyfeHuxEappXWjohZT/WiOb0cr
X-Gm-Gg: AYBFou1it7PsuON8zL4TjGDO3EcAeBnAXu4ailIPxjiHLMQkmRFOdRjdYeHPYEVc+Tk
	bJNDv3dPX0kOHPvwQRk+C/3hviTu21gLn5F83knBZB05aSTI5D2jRNT2kzWvdL5Wcr4u691spc6
	sPEDHAPr7WGKyP/TkT5I+7U2lh4Ov4cxEH+LfEdDvqzkN7GarE8QxULThyTdKLruok3qvs8fDjZ
	+sdANv9vRzWDMSrBC517ni3VAazH52BvQeYeiU4uuP0B3VzldjT7JHkjbWvdfgHzoBdppyVjp4Y
	VFOOVLt5/V+LUytuHa/OhT+6sKlEyReZEjLZm1Qcu8x9MNUVsB638PpjfVxZFGBk44iTQ9qLU9e
	C8CeTUI/JC9y1IxrfT8q0ciIX2a2llLQjnZsrpHdUlZKXfvsi91LHVFyBG9shg+YIGF4/3o3jdJ
	ebgYR8nLkYJZWDb3TwZXO5xeEz83WNuwAtrh9RNdcw+KzyBn8QFbkSBQxgjxJ50+MbihMrBg==
X-Received: by 2002:a05:6a00:4b05:b0:878:34d7:6a33 with SMTP id d2e1a72fcca58-87834d76e0emr5109717b3a.39.1789923798674;
        Sun, 20 Sep 2026 10:03:18 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:03:16 -0700 (PDT)
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
Subject: [PATCH net-next v9 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Mon, 21 Sep 2026 01:01:12 +0800
Message-ID: <20260920170116.3624104-9-coiaprant@gmail.com>
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

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


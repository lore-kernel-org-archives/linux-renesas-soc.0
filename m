Received: from mail-pz2-f4.google.com (mail-pz2-f4.google.com [74.125.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5B470436
	for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923767; cv=none; b=PItBczV0f3iba+iNylVq40+yrI2JJbDeAgGCZe/cGFtC06cCwZGi95m+P4SByK/Cx4HleOLjRN2oljwa3Mep2fuCW8L/q4OwEn6JX3X9B6zYnCYB/RvdkCo6wtgVPYw42ca9YygLxv28ey8TZdG0F3ok40i83M5G+W6V0skXFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923767; c=relaxed/simple;
	bh=uIxFaIx1maUJPzb10cLtB0jKa27JO2f3e4ujLzs23xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzkkRcJpbAd0k+i3h+NkV04Wy9uu8n/7GrnJ150EovM6UghKeafV1pBEhaJKN4YmH6HvuYO2XqZZdqYFgdlc0FdkCH1+xTkj9CxLDpWlAuxMnTt+sy8r7wBMb68Ma8R30sZYabkk2tGlZmhXj56rWRxoZ3iCuPLLvy+OQ3FDH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5BKoo55; arc=none smtp.client-ip=74.125.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5BKoo55"
Received: by mail-pz2-f4.google.com with SMTP id 41be03b00d2f7-cc4b14f0364so950316a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923763; x=1790528563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=V5BKoo55auUmmC59BNtyVmayoz8K+TqTox3t9JKiwQXo0mVQf0geLw+rquAmvfbgu8
         rvHtDJnifcEfNdHDy+fyfDg3Qomh19Rv54aOLMTCle8l/O2zmxWr/sc+gd1/n2ZS5+8S
         w+y0dq3ATk4TOTIwHbkCxeU+xiPDxC8e/DKgUWgG929oRvGe/iROD3I0Fv66Ogqq9IUM
         TjuamVkbxpH+R6nP1qMFR1iVhD3v81Y/Wfyh4YjpuHYLDcnObO2odqwdXTd18wIzh5mG
         VhzDbGlrceC8wONv3MKV7okal/+pH/kUK59vac7mCMSdBV7TYg0hjnEtTDdDAu7rLRda
         RiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923763; x=1790528563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=V2xEUejt7VJNFNp9MzN5MmEmzAN9uedwRt+Z4AY8h3QzWKgjYTHotqArPqr32K8uA/
         1IPUonCH6sDX9g9vV3LRN74Avh1uDeJdxRa6PGfKGdwxlE4Gj4xX5IJ6g0eVhhXq2d4y
         EyHnEbOGNkQ/SWNUWAsDKu8/qPoyn/JZkJeGM6vKPzFA1tZyCoKvrLRqiKsfybA6zqmj
         l0cMY/VxwrKM2mx6EhUpIXGnATwN4VPvPy+h5urgISqkH22NcKWg5h8r9cZ6LcY46OQS
         6JTnzeTMUNfLkuVOGQioPz7mD40g8vVQJLcis7iiKXFHFXp1r+6/oKtePBpxPiD8GK5n
         8Odg==
X-Forwarded-Encrypted: i=1; AKwUvBzE1xM5SgEokZX0g4XLXD1Quaz3Gw7wepbN7wle389K/iF2athDHNAs1zKriBvmpSQdrqyHXAxAYwDWs6W3lFD1GQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nCCXOU7fe1GSg4CRMOHRUEc+mouNqjRgHtVOkMHdF7pytqcHQI
	vPcSdP0xXrN/CxWZHkw4A6H05rKbqMpTp3XDeOmRbZtAzCXl5Mw+LLoW
X-Gm-Gg: AYBFou3pc4jLIknkGj+nOq+ytebqDjx3/GChhszL0nSdr1BeZZ3BssNDocmxNJbtSqd
	oIGMBqt0u00lVEccTzwKNZP07Myseeyx5nuGLQ4x2GEutefTJFpD7hZGJelQzu9eGEWhPzr29p3
	d5k4AEY4f7JmOnUFnJu+3PAhRC1zPR5hLLNydv7JoDkvu0cAZxtuDDjnQq7EunscI/n/Ih0CgBf
	geuAt5bsEcPEVGg53jniI4RpaRSnvKzlOdJPBeeAlVoolZKX/UV4vZ08x4uhvrg1JUmfMCUmvax
	uAagpwVOSzxoloD8lAP2Ib9m/rmT6ENluhT9fXzFe9xvTGvr7pn1C2Lw0JRXHPdt+a4+vNLNsiq
	KdAd+oPMpZhEO1zVoA0OEWb/dhZOSlkZVhF1v74I0Cn06EgevY9kbpaHcF8RKHgetTuNjiU8Guw
	ybtrEmLHn/qLljXbBsZUF7ESSu1BKsxRHjlKwnkFrFA86KHHMmUuV+DXHUt6YWv9NWMDD2BA==
X-Received: by 2002:a05:6a00:8010:b0:874:706d:856a with SMTP id d2e1a72fcca58-874de307e79mr11865330b3a.27.1789923762894;
        Sun, 20 Sep 2026 10:02:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:40 -0700 (PDT)
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
Subject: [PATCH net-next v9 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon, 21 Sep 2026 01:01:08 +0800
Message-ID: <20260920170116.3624104-5-coiaprant@gmail.com>
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

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

The four MII ports are described as ethernet-pcs-mii@N child nodes,
consumed by the Rockchip XPCS glue driver later in this series.

phys and phy-names are required because dtbs_check only validates
required properties for enabled nodes. The SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others), so these
properties must be provided by the board device tree, not the SoC dtsi.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..703fcff0e3f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Coia Prant <coiaprant@gmail.com>
+
+description: |
+  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
+  Coding Sublayer (XPCS).
+  The PCS provides an interface between the Media Access Control (MAC)
+  and the Physical Medium Attachment (PMA) sublayer through a Media
+  Independent Interface (GMII).
+
+  The XPCS is accessed over the APB3 bus and internally connected to a
+  Naneng Combo SerDes PHY.
+  It supports 1000BASE-X, SGMII and QSGMII modes.
+
+  The block contains four MII ports that can be individually enabled and
+  routed to one of the Ethernet GMAC controllers via the pcs-handle
+  property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB3 bus interface clock (clk_csr_i), required for register access
+      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^ethernet-pcs-mii@[0-3]$":
+    type: object
+    description:
+      One of the four MII ports of the XPCS. The port is linked to an
+      Ethernet MAC controller via the pcs-handle property in the MAC's
+      device tree node.
+
+    properties:
+      reg:
+        description: MII port number.
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/phy/phy.h>
+
+    ethernet-pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      reg = <0xfda00000 0x200000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      ethernet-pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3


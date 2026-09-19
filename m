Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201B3F8250
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822342; cv=none; b=QpVMOlKv55Nm9PiKcJq0qGakKiaikdkF4aw1US4JsqOj0mX7esPK6u6nSE/jPFXhyKAHW3VDCXIQDWoiLwHl7mDsN6BrMoyu8dUoxMindixIf7RsbC9fKY5yz7qL+KOXecN3n4Q26qz0gkECba8FxDC85mke0cJHiliNjIB9HMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822342; c=relaxed/simple;
	bh=uIxFaIx1maUJPzb10cLtB0jKa27JO2f3e4ujLzs23xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdRwvldBrQ/dYF6pBrbQBFXLOrq3KxaaCl3Lk7ml9fQoTE3jg2asYQxLiN9s/d5gwwjNePNyYBT0vdkhKAFER6PJZXRvsHpfUfKXpCy8h2DgERcRBauQVpxATrKE5TkLB5TwIAhyqW0YFIHpd2y8QOTm/74OqHYtTKhEiLN6Xzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG7qPqAQ; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG7qPqAQ"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-cc4c181b42bso1006377a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822340; x=1790427140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=eG7qPqAQrTkV5OsJ3e9mbpDIrbqho/pdHTDmM+8C4xpx83EfG4Tu9I7WPIIIpO3hwm
         uOTy5ybz75x5qsedfVR1DLfi5JGgyzgPlAfMDd74QwJO7za4wG+TkVVJ0fTHK2iQHxEs
         05GknGQ+d1e5kfiudUD6dSqRokll/vugok+OuR3g1mLh5EbGWnR7I+2GWjiS9HSzF7g3
         LVZbu0JohBdsDO1A2zWVZNq5sIgfxe/9jIfnJqjrcWpaB0/eVpmRfHjxiNtGxtgi263m
         A63PXeQzW4OK9aVwY9r7kjhXTEfXdhgbuE3ZzKSD+XxSMRuGUT+1LWhANa1GNCGWpsSp
         FRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822340; x=1790427140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=cmQwZkaQFyC2he1NwU0LPHBZIB2YGfXwOoUzGPdRk1eiTkTtul+71ht2f802i0ho//
         2sOhXLt/nPugouvEDG5lDLigmW1lbnTYAQP6O39yC9D3GOFHXLVsl3f9SKgVtkp07lQ3
         ENgjmRHCcnMpl6U2fKQC4f+K0bo/HMk6qyTCWD6XgF4gYMpqN7sdehbNptWMtBfytfgQ
         ar0cfG9YYgOfhgZf9k5QwabIZ+i3JjUpZfanYq24v2AERN2689Q3PLiqS070ei4Nn2SB
         MpYrUAcHV443ZQ1mPKTEcMX+rhvGjWRZeXCn1JboKz9BuQfcrX/ls43NMy7ElAY7zfEw
         v1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzT7ciJmpdqjoBeFCTpI84IllJ9ecSO9MExNaGCheK8BtgAx1a8vNEGt1DZdEdmH5EYgGIrwSTOowsB1Ax4zlm9SA==@vger.kernel.org
X-Gm-Message-State: AFuF++mz3mCRjX7YfuXQYj9tAFL2fyffRGCm11Pg/buJ40mDY45+E99Q
	L9vLr/I7w7/1Ewm1cqcei7Her994oINc4g/NmYIDaSCw95zkG5izke1n
X-Gm-Gg: AYBFou2FICprlZOHbLt1eKKXEDO3fPoHZJdCXZYUEX3Xr4j7tjsJ8zcgYnuxeHYFQao
	ArGJfSWIDvv0W47zxLIvQbMgQvMfCaLvwFKIq/hpLe5R2lRkiBb1OLhRlMr9TCgzeWvsJZ7haHJ
	Ri/21OkMF9g6yNiqBF9nmyX6y8spOgAefFripL/CHINu0vl+lZGW6nlBsAx4E+3HYP2HCMz8SEo
	HlTwIlxGAaOsLLZ5kxu/XbH5tzIQrKvhqU+Ox6iIojLzmQn86jFU0zkN2TuCPR3p1Fgjzob7mDI
	tjuBIoUqvg+NwiRIWJodicNhzYATfJouNHuYA/lndFR2Nxl9cZR79ZzXi0C0P69Z9vtba/iPYLr
	Aa7Z4wsUBFw3AqkJqoOc5Tscf5leZ/p49fBG31B9v+m11JBl8YUJ9kUtf6IoUxEatQkQY+to8CZ
	AC0lpHCRHMJuwJ6D0CPI1shqzakQGSvrr1KCMq68eZGVkI5iLqAaNbxHH9M/G7+0gSobwaMg==
X-Received: by 2002:a05:6a00:39a6:b0:878:34d7:6a35 with SMTP id d2e1a72fcca58-87834d76f58mr1393269b3a.41.1789822336163;
        Sat, 19 Sep 2026 05:52:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:14 -0700 (PDT)
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
Subject: [PATCH net-next v8 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Sat, 19 Sep 2026 20:51:11 +0800
Message-ID: <20260919125119.2107089-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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


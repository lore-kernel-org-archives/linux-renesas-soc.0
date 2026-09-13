Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768773905F5
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326014; cv=none; b=cgv44X9nJ/AixG/LY523ZP90eWAmZcd7GwInOmGv9GA+Y4lFnbnviadkWYrA86KScaVMkm8Z+OIhdq8S2sLNyW6CXkNOfEklEt/OwzN3Q82oFCbIEw2Q7mPOwlFOdLNQC4luM9DDiPmYfZOHQSpe04nr2wc6V9tZJvDX0iQWd8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326014; c=relaxed/simple;
	bh=IdZSPXcFF+gTdOktfdGsPEKUw6gn4MOIdk0sQuimzBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vq+FEfwHgMRwC0xwOlKlPvF7+TdpWc9s5QO7YolTXNSdimp0WIbCxumkm2kOV+PvLtXNDAhWPFJ0/ibSYvUyG4WlcGwuitfA2BVNg8b28ofAeOQjZRshEIyXT2a6IHDUXyI/bJVPi6zus/9LlsNL9yRkXtp0xi1DNBHEZkDq51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq1Qp3Di; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq1Qp3Di"
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d8fcda61c8so11806755ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326012; x=1789930812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=Mq1Qp3DiD+gD5Ph4B5H1lbME3kUKAdyzWjCUk1zl1oQmvhY0tfPvLyf6yKbesvydMc
         ckDgGUSS/oZQVN7dQrm8QFhpyvcbRAzQi7b46SNuiNRGJDlNzQTOzuK7WpkzVkNZX6To
         g4w47y5Aa+cvrsdL+ROBjoXCTvzzBk4mqFyEJeD04CGHs8wifyD2C+Axn+WcHrAacNen
         CYJVWp9Juh8hjciMh55ves9hinmXyb1hIcJ9rH+22K7XEYg8R9nVX2v/Uu5rl0NHzA4M
         SUQq8kJqUbHbWNgXRRJzrQFoPau+OYTHXPUOb4jPIVIXJunsGQC5KY0MDKR6gmibEON0
         qStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326012; x=1789930812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=FaIqLfQu0IEPK61ryAW/Fd5E+pJ/2Wopnm5jncZCrlw1eAG/Xs9YgyIxB/I8Fwt4cd
         Y2yyia9yv1kC81oIJw2YJY0zSxfm8svgExFqUq+gbZBhKVuoeUFOlehFjaUfiY3rDMlI
         sQeLTIZg9rn1iQ3cRirrDaYpJN805yxyzK1F9SRy59+skYbXcdPtTLpigCGBPyKv+PQQ
         nTUnZyq7SCooF6G5KnTm5K8/qdxIHcGdNsFtpnG80p+VK7SsODkZq/QzQOK3KJx639sK
         myy570odgbIer1ID6kqnoiHPw9MaW9bd/7lGl9EHDuU24QGdLm7M6ZtTm+hxsL+r3Qpa
         Q63w==
X-Forwarded-Encrypted: i=1; AKwUvBzxR99JF5E4kTnXmipMgEEskdpD2TRw3eZNqHk1kJuCf6WQ/zH24GpplZYmLlFD3RtQWadVDOdJFDsrNAt/M8Sw2w==@vger.kernel.org
X-Gm-Message-State: AFuF++k49k1e0u66siFgRa9chXoyO0axkIDynLrUA5baVl1jHR1N6yLg
	oHAyU5i9J+O+PPzs2Y0GXyks5+SFPQ+/usfYLW8L/yqnjDzp0l8QxQ20
X-Gm-Gg: AYBFou2k3+tzAaTtbW+alEwg8+F22Pz2POq6VmCwhT6zIO1CgGd2RH+sZlojltvPLJw
	kfcUzv4tv15wt0EEJjW1SEa0AbXguRYb5PF6u+LliWUtnskAht2x/1q+jrp85NnlvYwh3+UE4kk
	Cq2p7i1LtjHCy9FQA/XEx1E06/Ni/VgKcjxcy5OpRF6+h2hDP2uXeaEiO3kWzsbkgZx2CTar2NR
	P1o96u6zWfiN3lU6yOlqMpqaman9uDIGEDmvymqQDnuKfYHDeT8WbeFuBL8liW3O6Y7v4Z/pdxg
	2+iUcN1qQyEle8zrxxhVFgZH+9bSbdpU/ihcz3CrJholEL0zceNXRLM6CkmO3rVkBL3MuvRSlHI
	zpNY4gxWvgNDi562VS7xC/KOwgXFyMDuU/ScU5INtCM0sbQQlcgbhuYMqrhRcmu9XAr/OXuDBX1
	vJVDHa5D8Ir/tciHRfzd7cbBGr2J0yYfjKaMpv7j2GlB3bXm0enUVxL4fjZ5U2jbOzeI014L0=
X-Received: by 2002:a17:903:13c8:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2dd4bc32ee4mr166613045ad.5.1789326011475;
        Sun, 13 Sep 2026 12:00:11 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:09 -0700 (PDT)
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
Subject: [PATCH net-next v5 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon, 14 Sep 2026 02:58:39 +0800
Message-ID: <20260913185849.907479-5-coiaprant@gmail.com>
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

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

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


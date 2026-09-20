Received: from mail-pz2-f4.google.com (mail-pz2-f4.google.com [74.125.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7F46E005
	for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923774; cv=none; b=TQ67HocEPVBHgeDWqYt2lrnJ1gErwi4WmF89zpiwEfe4jYCgkov3fPrx9Rl5Kb5eG26kVakHNIFfNTVg7KPajuLRsNsUtm7r3o6lcOoasMH0TbXANIGVMEXc2HGDieXzPcCS7Ar2mPN86Y+8imJd/Y2fSB0FSrgmY0byL3bpLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923774; c=relaxed/simple;
	bh=eV/MZpigoY7eQVTxB//FZOps8t3Fw+uKiqpIed3H7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFiFZIGNis62BMzm+1rYhkDo6laS8vIzD8qQzoOIAB4Gb/+ryjdSI+ubFXMInWs4y/ktEWJx1UEFxbB9Nl1nN6dKA2zwg+Fg7ZRRrsOxsJvX+5C+LwhtwlvZtkmpof1xy0j3FqJRlRfzq/akJILZuipHLsUYvTcuHj6tMnTR2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYM0e5TZ; arc=none smtp.client-ip=74.125.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYM0e5TZ"
Received: by mail-pz2-f4.google.com with SMTP id 41be03b00d2f7-cc4b14f0364so950356a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2026 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923771; x=1790528571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=CYM0e5TZCVwoa98/M0TqxxKHtvDo8BA7FhxiJHWSXK66zGBba08pLcOtGzeLuelziS
         s3TUYmlAuM37Lr823h/A3VzOWlN7/QgDjvg2Hdn8MIrWuPzd1lWqLxfTBvsmhXNWG5at
         s1Jz09oRT7TvWHy1UPaCNvH6/BvRMs4dcuqO1DraEiB4PQBAqiFpm6g5YhfV8h8TNNXI
         3vm7dlFlWtDiKuuzwkJEBbuXQURjYQEkvm7qkBtburV5QewwV2JgjEwgiV5UhCse4Qwt
         h5jPkB7fR9bsVo7IeZjqzqyTYBSoFLDzxBZb+uuCGchEWZyqrFS5+qvQCo+QhA+eCuXB
         wkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923771; x=1790528571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=NYYE+NIYix1Sy6Cue9AOC02nu33PMH9kR2/QqUoYuvJk2Z/G5WKkVSuTQMcPZlAZJT
         ZOLdym6QJQddU1FF8Sska9NjY+uyFaQLhOkFLhkzR+t+1c+/TkSB7KwLvi1Lv0HgPZNV
         EoT625hv1oYotVt2a1gkA6DTwoYULtsnNb9xD0xG6RgAUlxGY0GtDigNp1Y2DBPc7Pts
         ftm58JIoJvkQ+tS6epeocadKgMsymIc5r8thMh05h1Gx3/uczYy0n+6SgOAU7FR/W3ZZ
         RktdIpTNymFMa28lhQF/TJSyEem2JL/J77T/mOglfXQOYjXkHQfF4FFg5KanrieDE7GW
         2fdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCy1y8dN4MAhkaoyMOcQbtvicSh9rt4rBTkNc9CbagvP64tLkh5qmr9zS/T7Kh7WdMSZwc/cYuaSF4n5yiUy/eSQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0foJOgA5BykdQr7ueygYVEhHqQzPSpf2Zgr9Z9pVxUz2HPnfO
	mvp5zw1hpdibkdLNBoQZ0yZuVHSPYlZGe/JtodnY1FnCw/fIMSYNLD9r
X-Gm-Gg: AYBFou3/dneKPxGXmKISjps/gwSNtr1Fmu16H1X4Gr9AEpexKMeh8+ql2LcnXAarEVw
	aAmT2jrlgT8QxauwVnniV7HpaifwGZfGGHdj5psx+ixJA8n/1vXi0yHaIH5RX1CY3ReFT2RVdvf
	8/aBdt2fir5fHrbzzO7qr17N2Pr5AgNjd6VAOrzeFVUZ4zC3yT0mNCl5zpDX8mMw+0a4R8eG+A5
	LLq/GE+Y9UyasfZO5G7JQeBbvDFPyH/j+opT0/ePIvHlsAOc8hZJ2vNi90nR1wAWpsV9/PhMrRK
	mbZmVZB5u0HcNDnV60tkqUQAzy/AhjR1FkYoi978ExoOakbEVA2pjQpcNjZzmbJ6PnfNdfAw9rF
	X4UeqD06GnEp4lTRjC/lD2VHLMU6MdoWlbWLLjAEmULhkjy1lMDTugA4i5nFnmo9I5D6f1YoITD
	abu6AthUcUB9da/b1yyl+k9varifBbtyvcSg+O0l5PWVBDd0YWzUaiNoYSn89+AQ4peBDXBu2MD
	oZjHXzX
X-Received: by 2002:a05:6a00:1ca2:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-874dc5eb6b5mr12081998b3a.14.1789923771468;
        Sun, 20 Sep 2026 10:02:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:50 -0700 (PDT)
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
Subject: [PATCH net-next v9 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon, 21 Sep 2026 01:01:09 +0800
Message-ID: <20260920170116.3624104-6-coiaprant@gmail.com>
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
125 MHz reference clock for the GMACs when operating with XPCS.  Their
clock-output-names match the CRU mux parent names in clk-rk3568.c, so
boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
assigned-clock-parents.

The XPCS node and its mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys/phy-names:
boards that enable the XPCS must supply them, since the SerDes link is
a board-level design choice (combphy1 on some boards, combphy2 on
others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..227d03e336043 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: ethernet-pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: ethernet-pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: ethernet-pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: ethernet-pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3


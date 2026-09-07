Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EA472559
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795557; cv=none; b=X2yRaJXRFsovVz/uvZ6NoY/dc0ZDM+y9OrVGJcMNMBwpFT4gkcMvwDDmGGHxePcvEBb6KN9cfvKhKGj8ap4zAqzj3Y9mLgu6y0TepwX0lDmc/gVUDuHA7PVhnCi6BateQEgUXvGs7WLkExORc5lu5XyJNTCTn4grSAjKFFx6Pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795557; c=relaxed/simple;
	bh=A5WWFF/meLRT9K96dBTf7EzhnS37KtSW6R5N30B3Ssw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsHNtBgI9OYT7LfLKHYdd/A+/HpfFXLKGwdvdNOxIb6HCIrXzlgv8Pz9V4SPkFEGGh3Nm9oAoasmrekYN7qEDbP4gWSVHuxgLF0rW/rcdu2xZX7gWz8dw85PhCEnyknntzgjgxGX6DlupDOhyiDO/s13rsTkNe3tc+xy/Yh9gB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9xOXlLr; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9xOXlLr"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so1899657a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795555; x=1789400355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=D9xOXlLr68TEJ+JBofZUaqo63eKYDmeOhvDTY1ZCmAPOg3xcz1CvcaIgr4TyTXnDOJ
         8PWhf6ztv8B5284R+9xulnkZSJoOD/8bVJysmGN0vOscjmcB27/jx/nzHMiFDat4c43w
         aq5MK5RrxUG5rUfXoYtuGN4x7LFYjSP5MzHQNt2Xn/Ao2lWJ4oz3IfVcmjZZxlYxY3Cu
         Gk7eMsh4L2UcbRsmpOGM0aOryw3w3jZyklS3Wr7cRx6w5z/P5dWu7Wz99hdX5xQdIl37
         GWKz8a4JsaHMYYLCQvsSUHwTB0J9shzMfq6nfYo368IZJBzWcQvC6NH3L/wEn9uxpZ1U
         Frkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795555; x=1789400355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=Cw6kOUNGA6rRvNbxbeDcPGgt+6oAFzSxIAxo4iy2reITZeNl3vS2iEhdaA7bzxw5GZ
         G6FN+/CIB0djKtOW4Hded/HcFeLeEhcWTa/VRKX4SysiLiHBEsWr0Z02p4Gl1HIIPDYv
         GinQbbxFiGxRtkvjCnfhhMD9HxncS4MMf6jCQ+tzB25W9asFoSMkrHKGZ0jbXRV7ZBFF
         NzlKY2ApHD5YgGSloMF6ityF2Q0clThPd4YzrHSapLWoLVXAFRmxLlU7SHV7zPc6OEYG
         2JDQSexkdbN3wGLnJQYqLQzYjV+pF3fNv6vtNDrZNVAv2hzKoayTfsxadoOdXuHJPB02
         ztkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+uD7zMahlptNMcvnCdPFQLwywrnrL2hvorKLN4t/ZHnI0FUU9Adouv9YHiuTP5hRxBYeW4w0FQ3mqI/kgtorW0A==@vger.kernel.org
X-Gm-Message-State: AFuF++nAJecdhNzImj/VPgTg/CCCas7/sbe7ZdeNmU8z13nuisfR97Yz
	Nt6TdH76m5ZXXQJ0TTVR9sZPGVfsXnr9lWPK2VI/ZqnggXiAXobx/wZr
X-Gm-Gg: AYBFou3mn5104h2JRPRRE6u3WlNMHm8DK4aGW/syQ/csDbw8EzVYAxnZaOSNfkIr1eo
	og1f+JbRfgOXQj35gdTWvfzIs1p9pQU2iskYnKUZlqwfFsQHcoKQY7/fNFBQbNUZmbK4biNIEk+
	Rnq/DsbS39yTEldnjsipExuPrtA5UbAiFVbVR3s4DW7OytBmMCbqdmDkUbJ3GcjCZFtGBr/WQIX
	jTYEBB2FwyjUGinctbHJsx5CXLmrPuP2JZkCmNvTnkIVm7xpHS0ie5dz+C4SVdsjt/AM3zrVwq0
	mouNQmU14KXzwqNYOfabfu8BGfMhzT1fBL+82eTZ5L+9/fJZlZF5rllE1GHcsw2BV6vVHJlBIGa
	Q2VT3X4gkyy8ZRcuXoHDxO/WjO/+kjgScQW6+k7X0Hv8wapRgEf3oSd6vndUpiCoPIAYbLGI8o/
	ynmo1hflAhVfKpHkSuqUOwT8F8I/u0WCvaIafFVCbT+Zhm8/4QgshAomoV+JU=
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr35850991a91.15.1788795555107;
        Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:12 -0700 (PDT)
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
Subject: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon,  7 Sep 2026 23:37:08 +0800
Message-ID: <20260907153713.2572547-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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

Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
providing the 125 MHz reference clock for the GMACs when operating
with XPCS.  These clocks are used as the assigned-clock-parents
for the respective GMAC nodes in board-level device trees.

The XPCS node and its pcs-mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node also requires a reference to the appropriate Naneng
Combo PHY via the phys property at the board level.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..989e164c0eb39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	xpcs_gmac0_clk: xpcs-gmac0-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	xpcs_gmac1_clk: xpcs-gmac1-clock {
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


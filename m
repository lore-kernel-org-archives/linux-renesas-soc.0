Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0544AF14B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475950; cv=none; b=leGLV07Q/OHJUFyF9/S1WXgv7KO6X9/mQB5op7asItXclj9bXAnnM/DenSqANb+KDzKMYmEQE+6isnBLWKN1ijksx7ntTy2HpAKT4efZhF0PnaCurjC4fXqcRpmQd3IcZqUKFcd4vujlTm8ca0/flDQfHlF0yCP69phaoPjGUOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475950; c=relaxed/simple;
	bh=q7Sl/MMSPIpc6WmMgm64X4BAPmv2q5e4+Iz3zCyG3IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAdkaE9cHoaXEJkJVCig26ver2um0tBtFvgXnx7oBwt/CP77I1uoO4AH8dl8EfTsiqYQnJftuz0N4dT3OG2zaWbbZFYqXmemibnhQWAj/tUoXlTGaVPshP7eIMPzt6hHBJ6eEQLMIqwhuMJH/DvAIwI7uqmIQd0M6QuKDwOkZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti19+xmK; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti19+xmK"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so28155715ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475948; x=1790080748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=Ti19+xmKTWbiouhKIc0a0XYTn0AgjcrsQuXqcVw015vcOUDDXOnaKaQJLJHv8N2h5X
         E+aLNjjgXBSPem9PuR3nD/TI1WeCwPGX0h5PzqfZsauK+0+Kb84DlKHzATkknDF+4uGX
         A7HWUaaXSyK9Lgz4qN6ey/TmFncedpbAzTaiOoALFcngcesCGwxL+W9/TZ+okxeFWEBQ
         7ON48rZgjXnw74H/4BfZJQ6vcmAHNJHVv0/d4Z9PkzdKGDBhDv0RVRyRhtIvoYxtXqpV
         iOZcvgOKLHsFSGVwcEkRXde6JsZZU8QixaOY6xEW1Tj6nQmwRfnE0Ed32vusq77vcMq8
         3Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475948; x=1790080748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=LTeaMi4qdei3dlYTSm3FVwv/2rn6oO1xnIlKKHc+XK5cHHQtbyjDlAOLd1bAzS32n5
         J8OBkxcV+3iz1KAoHtABxj4WXrZC7LCi3Wl8izs2e4c24eTKbQkDOdhczcom9mtEDj1I
         JtE3pS6UoMdjKI7ssO4DzmlHmhabxWYMu3eHCMn4jJHD/z2cUTxoVZcgvIM8PmvBhVcS
         pTEX3MKc7U2HbBF5gW4wHlMs89lTfs8M+1A/i+UU2JxANPXQiNxoEi7ZbwMCkaMEAXsZ
         eso0FscTRY77/xNWGRUjURZLxr1geDkp1Dsd6gnVUd3fPuHgTn28zCfXrbHxltn6/Vlc
         dQKg==
X-Forwarded-Encrypted: i=1; AKwUvBwBhgohki+G23oeTlNcboaHiEvbQ9Ec/o83uP7CKwdCRdssjipKlOSFmwhDXMq3sLPT4PzvPnI741p39eqF3UGzJw==@vger.kernel.org
X-Gm-Message-State: AFuF++kKqo2S/Rah/i+ptWfmFvP3XpwRXeSXO//7XUNalI5SnXC8YbJG
	DIpsZEM2cYK9UvwlnXZ2sW9x56+5rC0ojWS/34agofirIoYw6raYSq1r
X-Gm-Gg: AYBFou0MLV2FXIZraATPqAPH8FzuBD0HqrNjLdE2kD976oF2m5/RSgFTxVlPQtRhQza
	YIzU86xHcIYQxRwkzFwEjlNAR3XtI8RgS4qfCFTeYQMvfEoIpstLxyVDKhe9Fpwx9uX7eqgRj3u
	mzZ6TfHYEHqZSJmenqO9mIFiatWQApxjf1bKQ5Db0zC5IqJfF53SozhjPYEcg4/wnsZIpYiG3Jm
	irbRHlBvsXDO8klf8DrWuUZhHZ+jJ12KJFNgnSdnkkkNLs8RSFt6nupxzT6M3L3jPDZPSJXgCIv
	z5LTEPpJ3xhTHGhampE0WhWwW+4G1ragUGVB1JUrhBppCl8ZSlvduJ9NoxhAnyh49N387X/MhK+
	Hta1UKP7wDmRqiytoDOnIGehpCnWSTrUwptnmosAQBbpF2d4cD2pn8A9+XwevN5Ub8Lp/yD9yBp
	/HoVlU1WC5JE2LHcbD7EhaM+NE5HDl6/1EvMkNFaZUECIchLP3Aq6lMWk0nOUigi6enYp3YQ==
X-Received: by 2002:a17:90b:440b:b0:39d:e784:3e1c with SMTP id 98e67ed59e1d1-39dec0f7193mr14930029a91.19.1789475947417;
        Tue, 15 Sep 2026 05:39:07 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:06 -0700 (PDT)
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
Subject: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue, 15 Sep 2026 20:37:54 +0800
Message-ID: <20260915123802.1561724-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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


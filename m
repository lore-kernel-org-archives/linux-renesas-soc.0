Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460B3644A2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326052; cv=none; b=qW11rnbPiYh2HHxZM/raIhZQICAvLPPrunMT6k/vIzduIZ0cnw2MSwjo0OJCJAgqt4rSnI0OyDcTJDA8b8azdYkCgQMnYAdnbuaQ05KMivmZjyPYZOAkGkesVC6IQCmjy4JXi5Flbo1vX2twnfvFkISS+j0oBdnvnuM45rxBXTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326052; c=relaxed/simple;
	bh=q7Sl/MMSPIpc6WmMgm64X4BAPmv2q5e4+Iz3zCyG3IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bju0j/txBeOVu/CAikxcZcvwlA6p5GD4Boxo6IxhgPw6OqHKI5PKMQLykLj41MBpVBOngfmFr6RAsJ+l9VoHhmzJqAylWIMmQwwtY+hJbrKQ+HimhqKu/15fO6++OWZBN1V6Rgae7JayIkhThielr47VAEoizMzLGd6AH4TEVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEpLzs2k; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEpLzs2k"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so838443a91.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326023; x=1789930823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=AEpLzs2kZShzq2Cmy3quhj8Ov8qpGWbON5B6xIIi/KL73ZzNJs5AKAB3PP2lhH28v2
         LKsgnnQD+fLWFV5OXMg70deCcgaAwQyX6MzWZXtueKdhQ8+L1x6L/TTplzJ+6YwvhwjK
         2wybRVYV+eKHWc3DKbO1kzBt6HobTWcXfcJKAJwRwbNxN8paVlugd+Or/YsCa5xLXZDZ
         tipAkS+H7WNkJK0i+qC72elLN3j4pt5m00F3A+SN7ehXDS1DMsABC63fTTvjznWGy83y
         GewltVnjYHqaTTcLBhluPM4eihtlSGfmjnwZrbnT3O/XdOCBy3w180xwf+sszo/i0YWH
         NbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326023; x=1789930823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=NK12pdcp6jBQjZbyrlBkzZH+TOJEdgAu9wcQZNM+WubmGlm58hUi33CpzKyOoCByc3
         PJ1Amb5kCULnXfq4CdBagaAkBL21nyLxG8/Wnfz4X5qAfK8PbsmodancTq88vHPJmXio
         6SKdlwGDUtsIGXyCbKEEhqMReqqYvAthXrVvw5mfcLaVmvatSdM8NhrEVzkjseVbjvp5
         vlGWAJwjYS7Vmnryiv8w7I2uFP0oMXb4b3tBD7yECb8AqumviZE4H2EqvGVQdPzTHF6J
         MFmnzLYMdd7VwCJLU3+5OYb2b33q4SEH6b0LMQ1BCmySD8jP7tuZi3GyaeSQa90zfT9f
         q01g==
X-Forwarded-Encrypted: i=1; AKwUvBxmg9ZxedNVuAfTQ4qORLaBzXy08PZDesX3Tlm1RR8PtW9b6ox3JlIwHXQzsHKrGUkONnz7VLV5yp/sx1a6z/wuRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mSwNdKTi9sGmDqMFGEZ9AeDANsKPtxvaKGYHIlvMhdg18trVPE
	wo0o40FJ3qReEXzL9Ql1ePX84NRs0acUBXx0i8Vzykih+Ueh9zMN9Wp+
X-Gm-Gg: AYBFou1i4YIsQ06U+Gz50XlNRTuq5soNDbMzF+rX6cgb0HiwUkPxdyK46LHaVIaqNX6
	Fuj3OHN8wIXwne4iGWVhQKHBIjNGZ2INvsFaCMAwjQtTvgye4gJuAcnXbJvbWe3LabRSk2pl1al
	jtR5Qlt+F+Z1FGJbVCalDs29OqbQXcYXfQQ9eg2PJEQRQzkFwHoNVBLJey4D8nN8x2PjPEBjpAC
	4GNcXXUhQCWzlcKgHgFusBNyVIiApoPGsvy/yj3ZlvEXiEQdcGmQHQnzG4fCPjCbad9mYeFV9QN
	szzYBywmNa9IbIGW7B+OTzzXxsZsD7Jly8H0ArNz2f1tD4oQHbWykbLClVwK8BirPf9ZP5fuYUF
	zh+rTkOod15t3XRrQaJu0wjTF653UhZO2n+q5YKYDD0JxenqLnpVMC1YiVIweFJvzCxcqbuushR
	LEQPO2jFv9CQYPM2jessaxuTz+yIvnjsG/8qRICo2beT180inJLudzdV2JtbrhBzb2ohOzJw==
X-Received: by 2002:a17:903:98f:b0:2d9:26b3:547 with SMTP id d9443c01a7336-2dd2a46f4cfmr250162755ad.20.1789326022854;
        Sun, 13 Sep 2026 12:00:22 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon, 14 Sep 2026 02:58:40 +0800
Message-ID: <20260913185849.907479-6-coiaprant@gmail.com>
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


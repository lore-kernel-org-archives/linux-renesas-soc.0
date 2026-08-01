Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B912AE76
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594258; cv=none; b=JK4susPDnlv77jPeXf5qOcVJO0ZagjHlByX3J2h0hWOe5/eXqcVEBxG9kX2QRVWZnVB8nhFTGPPj+jLchIPQALpXIOPGdLOKOURZ0JnzSE0piiTn54ByvC7abS/9Ce8Py0kk35z3JoyTIGHnKu2AaZKiV3sukk8VIvL4PR8DoCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594258; c=relaxed/simple;
	bh=aT3+YJC4SV9j+IgfW/9nXl5t5WR65qvVucKV2aC0T9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8FVJuPselteyGpOlpiauhiagu34474F1dV9thbCywLur6GsciQdNuiLZArw9hF+wZaPbgzDSkW1wa068qXDihm264CNyz2GbJbPtoL7VSQ2kaEkoqcsjO+cGYvkvChH738RYSWhbAYG9qCXOlUtaa94sF8VSqTjK1nYk9JpEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwCjjWbr; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwCjjWbr"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cc80544c74so5203585ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594253; x=1786199053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=CwCjjWbrdkiNNh5y+cOvkbtK5JyHfM9aO4YQAHF77hxM2b2PoznbD9AZICXp9UPBnA
         gYa1Wdk/HgKCxAbKqxnh1glNdzrEvWOEqtPRTbqJjS8OYqHXIe42YzwpR/qwVs+zb0Xp
         Wdq1Q1FDlDwhSgFhaW7z18N/4/SnF+EGPUjcNtVGE7WhNSaeV9c+yE7PjWgx6OgslPM6
         NvCiz38WhFW8K69Z3UUHyr1cZjBe2DjmJOAx8qG18DNHwOEv+TXj01jO45d+zG/rg2/g
         yEcGluoRVswljuekfHB6rrc3+fx3YlpH/h6OqflID6Wr+uv4iPwdw039aAG185Mmtwym
         AWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594253; x=1786199053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=EXkGePKXAIaLzyAzaCMOZK7tSfxP623pkBVIXBtFbByZxuyQg3Ea6mVWHMJ8EFgt/D
         Y0VPgPalsE9LoBS74SiJy+D1ZxL3dChS0dzPSG3vq4oIoJGYqLZoippwFO97JixHfvG8
         CJ/vHgD8bNBmh++2nSmFN7+/U1aD1QZWQ3aBABshZSUxj11gSSywZBTbNPma7EEDyfEq
         86cpNwvRwHSo0TDSiAd4DMQBoxBtxuXOZW3GudEUQFf+Z2rgHBp6YDUhZU4AmDJKYYU9
         qSMc70EdbVthNI6TAQLptMUWhOeTTOegPVEAajDuOYJ3Qmv6RN2Ba4YmiX+Ur7DOrM/6
         tvSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6YRfukgtGIgNVkcTm5jI+9MXqrtvA+JgIu551vIJJEDx9Ski59eLH9oZq6tR1s0R/SApg0Zhdf60skZPHe/BoSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5A+sHcCq39E8A4VF5n86a7F7c1fmKdL0NaV/GuMQaKD6ihlpn
	GDpDjt6nwfuxgxEktCG99WivKlRb0dGhbfn3sNuzi3qtgCEYBX/X/b6B
X-Gm-Gg: AR+sD13eLHiEKFPI+UOYDQKgyhdHS77PCW/OGQh8ndkLL57RlcfE2rkU7UQRIK7OJhp
	kULiBHUrG3kWOqj1Ah66uY+2HOtbEjnVlPz/19107tmCScee9XiQlamesRqJlEbOcXB+xVo5+ri
	gPyBDcoqjTTkfkN3qducGchO9jtvdqfLJ2EABx7eXBT5RtbG7TlS6n1wi4CTKC9PilTpo+Zttp3
	iO3zOi81PGfVvPyg0CgIGS7MNI1eDUSA8vHWA10qFUPh2z/QGfp13lNH90TVmmv4NvEvp4X9M09
	QMPOk7289codrBcJ80G08nbUDK69BE3OHzJWvVAlzTYbKXdnSE0gnqQVCq9Chg8hOsvSRXxtWXq
	MNzZVjCB62ltfSkWSsoc7DP+dlYZj64YX4dcM+rj38TL0p11ugcD1BFQKOM5vDZXFuxAGJ8PcWf
	weW8xR8FKO9kRjAqA83yhEpLlDCVuQp6Z41Wve+4dK++d1pz0Wz/R0Kd8=
X-Received: by 2002:a17:902:da89:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2d052297a46mr38452135ad.29.1785594253494;
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
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
Subject: [PATCH v2 09/10] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Sat,  1 Aug 2026 22:22:33 +0800
Message-ID: <20260801142244.679437-11-coiaprant@gmail.com>
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable combphy2 with rockchip,sgmii-mac-sel = <0> to route the SGMII
interface to GMAC0.  Enable the xpcs node and its port 0 sub-node,
referencing combphy2 as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 77 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..91c17b624fd17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -242,6 +243,7 @@ &combphy1 {
 
 &combphy2 {
 	status = "okay";
+	rockchip,sgmii-mac-sel = <0>;
 };
 
 &cpu0 {
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&xpcs_gmac0_clk>;
+	pcs-handle = <&xpcs_mii0>;
+	managed = "in-band-status";
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,39 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0000.011a";
+		reg = <0x3>;
+		max-speed = <1000>;
+		eee-broken-10gt;
+		eee-broken-10gkx4;
+		eee-broken-10gkr;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +394,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +649,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	status = "okay";
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3


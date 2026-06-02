Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECF3EBF0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414514; cv=none; b=lb7Hxx5PiUCxtuyuNTp1XnBvimj7hH3bmvz76u7y1+G72zKzabj9xOASGVLtCy6s3ogef27htBbP3qdanAekq/lcVDOMEy6OE+pvi09cakUvZmcHUsmRFGiqwj/FADZpHlCM2/ibHCEtnhT06R8Rjcx/Ev5GqMvVypgLYKxOOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414514; c=relaxed/simple;
	bh=Hif/XUxesMRRT+g6lRU2ePWEPtXCcBEaB6Yb8vK/Jkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DulIvEE9i9rA9sNi9O+afAQtMeRlMpy3OayNWZl3752aUBmsfdEEe5TgTYuOiBWA3tpy8ePE+w66aFBf7LpGJfzYwZ5FkSwNm7YD5rllPS/KXSUm4xuee/2kOZlDzPWP5hhr57/h1NprQR1adwrHZQoY8j+nbp79u3i3lu34Lp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PpNg3GPN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PpNg3GPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=kPhCB7AoH7tSov
	K10gXikRLu6Zwd4MTQbeYJPECjqpY=; b=PpNg3GPNnlbbKmG4/5liYlGtmsYEIa
	+tz4PagB14BOIetekW1fUMejMu/gGQdUp4ojGdwIceAuJpUA9berdQ+BLlvAo7JY
	JhbBtJSWYGlSt+dCHTWFigEIoDed+hjDLAsezppKet1LkSxKscCOq+apB9AzMtKi
	MpsqKXggYIEbhrH+0ob2Rpmlj2RcdYeGSOh1Qk4ceXSj49kbda0gC+RkdwXCxwJV
	7tlIs5lWuJVpI9IQT4RY2KhIGWc/DYrlWMSJVuWBANcRYmX/riW9oSfNpF4h94H+
	0uEyr0e7Lj23FQTyiCdU0KCddkOJpG6EcpbzBi+nUzfpY6P8sM0efHhA==
Received: (qmail 2943881 invoked from network); 2 Jun 2026 17:35:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 17:35:09 +0200
X-UD-Smtp-Session: l3s3148p1@S15gDkdTtooujnv7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] arm64: renesas: r8a779g0: add MFIS node
Date: Tue,  2 Jun 2026 17:32:22 +0200
Message-ID: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MFIS core which is used for various tasks including
inter-processor communication. Interrupt numbers look irregular but they
all work as expected on a Renesas R-Car V4H SparrowHawk board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* increased reg size to 0x10000 (Thanks, Geert!)
* shortened interrupt-names line length (Thanks, Geert!)

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..3cff822fc609 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -603,6 +603,23 @@ tsn0: ethernet@e6460000 {
 			status = "disabled";
 		};
 
+		mfis: system-controller@e6260000 {
+			compatible = "renesas,r8a779g0-mfis";
+			reg = <0 0xe6260000 0 0x10000>;
+			reg-names = "common";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0e", "ch1e", "ch2e", "ch3e", "ch4e", "ch5e", "ch6e", "ch7e",
+					  "ch8e", "ch9e", "ch10e", "ch11e";
+			#hwlock-cells = <1>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.51.0


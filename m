Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871E3246EC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424524; cv=none; b=CfuYsdCIJWVKyL0HLq9+YwTqOSbRmmbZ2eBkbIVJVFUjL+OeFMhZB2x0vR3zF/jLj3l9Y/q3dX6Uy/FFIUVcVUtu8791rdFOfK1lYWYjIM8u/n7fDvrm3rfsCC6h0cm+FPUO7it5eBIg6FaPR1tEFhlRnV2ZTCPFd/Kertwix98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424524; c=relaxed/simple;
	bh=PmP32Z5SuzhDO/U09CV0mXtlLa7DGEDaikpLRBKNtfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbIAVJbbnZ6DAslHaGAMiC/KsNNYs2jIMcYdvM4hCL7arpegHyU9+UwqcQvWXEKjTzCUxOp7yqH1fS0kx+tI5yXfKRJ5+mDMILCQl/RJ9DFFrqXx7I/GP6zreAQ6cxG19UcAJCEhhC4vNCqysKqxG8OaamV9IFsrqG3FXJpSXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dllwvIo1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dllwvIo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=9Su+m+d5p7khM1
	WSLCaz7yI08m8FCKaC6Go/SFi6vgs=; b=dllwvIo103LruHQyJcnlO1QN2vLwHi
	BJKMz0KrAf/wwzHpdz+zVhSokDaJVG9prGI3vPjagG0mw6CaF2zM0q7L13lwrsZ0
	g4A3r4Asz3HrLiqMrMn+wxjuFKOJMbzsZbIJc8BMkT2KP7EJjGwr/5NK0wmvOquF
	hNyQaFxCxkHw1VyqOfSVsiZ1X+P1OmWrjSbbWscGakD5wxOoYxEK1de4ZCvO/wQK
	uWEoUYrvTyAGL/jdQmxLVYLnsASD4qcsRmD3M93ky0ie/9SRa+amgnm5XWICd9ap
	7tY97obarS/MfrVVOhxbOMD81gHa28auf4m77XaiYOjd8gu+AvpeeM2A==
Received: (qmail 2987747 invoked from network); 2 Jun 2026 20:22:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 20:22:00 +0200
X-UD-Smtp-Session: l3s3148p1@CPwLY0lTmssujnv7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4] arm64: renesas: r8a779g0: add MFIS node
Date: Tue,  2 Jun 2026 20:21:09 +0200
Message-ID: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
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

Changes since v3:
* fixed ordering again (Sashiko)

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..8846bac99086 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -589,6 +589,23 @@ tmu4: timer@ffc00000 {
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
 		tsn0: ethernet@e6460000 {
 			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
 			reg = <0 0xe6460000 0 0x7000>,
-- 
2.51.0


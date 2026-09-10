Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FB33D3008;
	Thu, 10 Sep 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028373; cv=none; b=UsYegZB1/M1fScpXILrY2pY5Mpkuw7gFl3i4ojixUVDcM7nrLrH59iB/uHb3eW42E7/SnRUq1UcVXtNBvOD+V3NLZiYOAvK0qdJFzEhJxwUHY/54iuJW+SA7ZCyUHvBTpzdjTxAduaZFTqxHxEeX85LBla8sV3Y3P0X89U+tIrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028373; c=relaxed/simple;
	bh=41QVVJo+i9IlZbh96tNdnt6hMVaG0Lb7aMeyV2vEBOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVlpp9PORrSXTEvD+LS7L5y6/PgG7HLmEdxCrXR0M8Okwuam/soyxbAnzRvcoNYAEIin0wVtIAf0el4tAGGshHS12dmD8B2gmbQcklvMPi1vDn+MYV77e8OfcdOT+SjT1dME2bN6BVsmAKjh584ztfL7UfYXjsFxl4eq/bHfUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB201F000FF;
	Thu, 10 Sep 2026 08:19:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/3] arm64: dts: renesas: r8a779h0: Add GPU node
Date: Thu, 10 Sep 2026 10:19:11 +0200
Message-ID: <2eb9d054023049e1aa282c141981a39de4d4abe6.1789028076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789028076.git.geert+renesas@glider.be>
References: <cover.1789028076.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the Imagination Technologies IMG BXS-4-64 GPU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
TI K3 J721s2 uses the same GPU, and firmware is available in upstream
linux-firmware.  The firmware is loaded, but fails to boot:

    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_36.53.104.796_v1.fw
    powervr fd000000.gpu: [drm] FW version v1.1 (build 6976702 OS)
    powervr fd000000.gpu: [drm] *ERROR* Firmware failed to boot
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 0c9ca0f90badc096..ac6665568bd83a12 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1873,6 +1873,27 @@ its: msi-controller@40000 {
 			};
 		};
 
+		gsx: gpu@fd000000 {
+			compatible = "renesas,r8a779h0-gpu",
+				     "img,img-bxs-4-64", "img,img-rogue";
+			reg = <0 0xfd000000 0 0x800000>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0>;
+			clock-names = "core";
+			power-domains = <&sysc R8A779H0_PD_A33DGA>,
+					<&sysc R8A779H0_PD_A23DGB>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 0>;
+			status = "disabled";
+		};
+
 		csi40: csi2@fe500000 {
 			compatible = "renesas,r8a779h0-csi2";
 			reg = <0 0xfe500000 0 0x40000>;
-- 
2.43.0


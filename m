Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8F375AC6;
	Thu, 10 Sep 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028369; cv=none; b=bJ86rzoj9Np8sXBktjeceqbz072FpMSVMr4de0FLCcNyHeYKV3A3bugtKHLZqZw6JcBtRYWJTv7B6+oLW/xs2gL6hy3DXI79Ka5ASqSNaB/qmk/goRkXQq93EKaTOaVGF+1ETf79kro17yxc+7IE3//b3sChtpRDEo5x2tyQ7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028369; c=relaxed/simple;
	bh=SZE9A1GSDPtO+J1wbCoDXgstszrb7JSclP/EimdTj9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdyEZvLm7OosQxFmaORHcHiCmpjwKj9kZ7mDq/Zmfc39JqMAUsOd6Z+WYlE4qMvFsRCGI+pZ0V/CRrhm2YHeTIRyoeJGih1gPA6RmqmFRvE+acHBdFtUr47GP5e0EK1lf3vWxDcdUT6tT/nc6zycfMUJPnVNmPNaeRoeeMhhNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DED1F00893;
	Thu, 10 Sep 2026 08:19:23 +0000 (UTC)
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
Subject: [PATCH/RFC 2/3] arm64: dts: renesas: r8a779g0: Add GPU node
Date: Thu, 10 Sep 2026 10:19:10 +0200
Message-ID: <2399b2755ee8f825c22ab12242d718d64745b239.1789028076.git.geert+renesas@glider.be>
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

Add a device node for the Imagination Technologies IMG AXM-8-256 GPU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Fails to load firmware:

    powervr fd000000.gpu: Direct firmware load for powervr/rogue_30.3.408.101_v1.fw failed with error -2
    powervr fd000000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_30.3.408.101_v1.fw (err=-2)

Firmware not available in upstream linux-firmware or
https://gitlab.freedesktop.org/imagination/linux-firmware.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ee3fd0df4fca6020..c2e97d679d35be6d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2168,6 +2168,27 @@ its: msi-controller@40000 {
 			};
 		};
 
+		gsx: gpu@fd000000 {
+			compatible = "renesas,r8a779g0-gpu",
+				     "img,img-axm-8-256", "img,img-rogue";
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
+			power-domains = <&sysc R8A779G0_PD_A33DGA>,
+					<&sysc R8A779G0_PD_A23DGB>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 0>;
+			status = "disabled";
+		};
+
 		csi40: csi2@fe500000 {
 			compatible = "renesas,r8a779g0-csi2";
 			reg = <0 0xfe500000 0 0x40000>;
-- 
2.43.0


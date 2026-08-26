Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B1546C4AF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766569; cv=none; b=MVom9cDCDPxZlrap4NBgODXAvW2q6QCCKRPoaTAU2fkCPO85XDVzXnpPEmDHIJV75i+CCY5sKeHjgXhv1Qzs+9v4ljMZJ72/oBkVyc9CI0hmj5pNj63SbglXPYAMYX0hfGfVPROyMMzB06MxdW6rE7xD/9YvMBCmvCK1hNtkIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766569; c=relaxed/simple;
	bh=3TCVRpyMtLBUwXhD4LAjcMa96g1JsE/uEZ4sxjKr0EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlwqcXGgPwhzRVvkmqtIPl9JfW8ggqJwXLGGR5QKQ8dB9hQw/MtWgUX412vuP/8iA+AjY9vkwabr9yqCLJAGeaAx3X+juSbWJRPCMHVI+1n26Opu4BPUGnVTFCDwgDHq8B5fv33qtoF5Gq63ED9LGeZiexZqddsWS0wUnuHtGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYARXxtf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYARXxtf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1724296a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766548; x=1788371348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoBaynn1vHYZ74QoHXFsVGgkHF9Le9ACndSMTCi52n8=;
        b=DYARXxtfeCIn3/HZ4T7JuH2Zwp472bZK/MvIyngedbHAAnAEr/TrWr7ZVoU2hGrAcr
         iwILUeQNH9Yj1pIfBo753cvxLKThvXVoeJ0J0gY3a6gFb85ipXKimtFgGYls92PXLMsz
         aMR3ENEp5jC97Lrjc/YtR8J0GCmfiaG3MZkOOIlg9+FvejfQw+tAijGQCx/aELVQK0Jr
         P4nxFk+PgJCoI+WxyX2uTAenvG3114SspHeggZ7v/BAeiuivqpuUiXcMS+OG9DjkyDGj
         sx3Q4yzQpg4MLGi+JYvXCxZ1JbbnIqFW5sEVf37VDcI5sMb81ZinvZmi92LXwVs67LM0
         CJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766548; x=1788371348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoBaynn1vHYZ74QoHXFsVGgkHF9Le9ACndSMTCi52n8=;
        b=rg3/MfwWEy4iI51FisDpWwr3hxIXSp0T/uJve6jlXO+8EmQqfl6ck1AuDPwMehqXY3
         XK9MkcicAsa1lsY8CFiJUJuDqFb3nSZ0ozim3r8FRorPqnryCfP8knAG81ZcEIMzuX+s
         0HCPpZpe7+7s0rViV7SOtYsZiE9b4ESQGugMf0yVpkQ82Ruq9l5QgAutnKqdX38CxmNj
         s6musHlevGxng+feGcQC//Y9xczvAR5/iHb4IYRXehBznd0HexFIJqoyGR8Ll4+8M+U2
         ynzFZRbv24BFT4BMbv8dHpQp5+9B2UZZDnvOeE1+biwCPW2dDWYoDEzACo5qVunBLP9G
         1cew==
X-Forwarded-Encrypted: i=1; AHgh+Rqh18xfnNa8zGBj7MmpuBlpe0b/T1W95V/9h+iDjpz1xOL5gX63f4wm/KEyAXaAphqkDcsVChD1DMR53NWnCvFcsA==@vger.kernel.org
X-Gm-Message-State: AFuF++kukTazCG1JtFIbwLNZtetM3t6WGWfaHQOrwx+OwuhUN6zinhZ5
	YZhk7pPbvHcsCbsxPVJb63TwxomuVMZKXyNgCUATYgwB4r+/fKPcq2kx
X-Gm-Gg: AR+sD13BvwY8JKQqsRKKYHXp/17tQY5vBKaLheMHG2jpVxnBo8+3MaRo+G9YMAyPc2t
	PLsqMftxj84yuendmTwRUcjjXNQ7znmb0nONtrrBXMkqmyli9RHhuSaZWyCaQTfK1Op6CCHcdaa
	EG0tU+WiwEZ7MuUupIP/53hj7W3yc0lWGXhW59qw8cxAbi5DJGF5ENQmEfazc7kcsxau8O9avcR
	RguEoyEo0VjPVBhPajmqn6ixRdBbQp06m/Zp4gFbnrJDu1ZMoR/lo1jQM6tpzmVFsyHyAo87LN1
	YFoablUn82Dbwtjib5Iv0pTtV/lT3lnli5wkNRO/XcE+bhNhXJGd3+G+EdxR+AaS4iSaVuI2e49
	2+7Te/WAdQG0lQKqRJ3xMSOdCEkjcQqsx9mYWiJQpJNFDO0A3GGHIbKmt+lBmyWPx3mcBaDFqfx
	i1YDpklCWmFqr1k4Zte3RoDA/FQlb0hQKPGVGhe6ZTyCenEgnQiBbXMqz2xaxvoHEQ0pI86lfTU
	dKev7YnV+W4Ng==
X-Received: by 2002:a17:906:eecb:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c250c3935b3mr1143856366b.17.1787766548026;
        Wed, 26 Aug 2026 10:49:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
Date: Wed, 26 Aug 2026 18:48:44 +0100
Message-ID: <20260826174854.199139-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add DU and DSI nodes to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Dropped renesas,sysc-pwrrdy from dsi node.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 6ff145dc81fa..cc8bfb24da87 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,49 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		dsi: dsi@10850000 {
+			compatible = "renesas,r9a08g046-mipi-dsi";
+			reg = <0 0x10850000 0 0x20000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_CORE R9A08G046_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_LPCLK>;
+			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			resets = <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>;
+			reset-names = "rst", "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vspd: vsp@10870000 {
 			compatible = "renesas,r9a08g046-vsp2",
 				     "renesas,r9a07g044-vsp2";
@@ -721,6 +764,40 @@ fcpvd: fcp@10880000 {
 			power-domains = <&cpg>;
 		};
 
+		du: display@10890000 {
+			compatible = "renesas,r9a08g046-du";
+			reg = <0 0x10890000 0 0x10000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


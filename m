Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18C483BDC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329752; cv=none; b=C8J+rmDprkjV19tk7nWJjUdSn/oT/yq+zwkZpZCXY0HfEvyTBm66svz3wF0UWjz9D+X1ACVlhYWm+16XVpMM5sPNTu/Me4tEh6ThvNxeew8HiM1Dj4yRAp0QrOzIFA5gwbDPY04HwLx73X9MVEOo5b6cOeDgkOwpi9229f7fU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329752; c=relaxed/simple;
	bh=iRKRIycCvcKqPjLNh88Zh533HoO63Je7dMr06fWDt+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFE6o1CRhAM1K9M2zmlzfV2G5wG3dNwbyLha1Zpz1TngTv91NnPyJu444/3rB6Lju1y5B4aohS0hCb6N+i36POUVUgjU5HXgp7W9cBgasi1fRtLFAugcqKGQBMS/ndUa6k4L0L4hxPXgwooM0/xK0u8KH7iX5lXM54jB/dIoL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8rAMNu+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8rAMNu+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4498985e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329745; x=1785934545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTuEH5lpMdAEcWjhyDWlMU+ZO+/JKfEhygzkvHRW+1M=;
        b=C8rAMNu+/uzjiGZrcEvSK7FMbDxwlLMsrJ2g8QKe/96InLR8rFD7cX3CMojjf4nLmG
         hGAhyl5VU63S8JyiQiq3hSABraO5V5fbS0jQs9OGreyH9KR+iGmsdc36IK6GXiuSy2WW
         ZH3Lj2/meScmjwfP995wqH7PfhXGsbztQKB42CmeTKT3ldNFhjRLouaQifTofEFgv7P3
         MNetozXz5rCawZnteiTpWoP9HUEL4HLGO9GG6oUfVH6k0Wgp90OmBEN7pynAYreuYmXw
         7M8lvHn0sp6FoIbLpRraSVWIGP2KHvfZvY3BMxjbRwIOjRInLD9EyANpIygTxRl9QF8I
         /vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329745; x=1785934545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTuEH5lpMdAEcWjhyDWlMU+ZO+/JKfEhygzkvHRW+1M=;
        b=OiHvqUBD6cp0Ei/x3hkxyabEH3TXboLs13eP/gnpd4VHY/7iWeXxo0FtThwkervakE
         vNouWDVCGm9P8IZK73ZK/PkFRLPTCG73u5jvr95qRSbwqjYN2jVzIGx3kc8ZQmIA6ciq
         WGGLR2tGlmnwr2BgR7ba7VeCXomwqyq3oWG2+RWn7hzsraOyA1ZaeDsd/VBAw7DLPIl6
         YRQSbesELVgi3rb09yWHKUXZpRRvXZ+QR9PrLLmZn596sRm/Td58BonZvN4QVWXiWd0e
         r35nWU9X+pHbaAwishXhCuE8AN7hkyyNxGc+8UnMDKLJMklazZ0Lizpgm/ZKm23oimim
         h7QQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpmTI8juJjC/WzjTgXjXWC4Es5IssHvGMfPijya7I6lPMnBMn/L/T5VOs8b4f6UI/YuBQPD18hgDjCu044NGEVYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Ob74R2X1OrY1huWOqjguaUY4bnR2q2iZ8ATs5UHK7Co7qx2I
	28sMewFXH2z9FGSvbB2q+zBEw6vpJuL+kxIMUPBKpUStTSIfR7Z3THQa
X-Gm-Gg: AR+sD13Wh1wehMcRylMr87Lz4axuY99jZO5Sp8j9MI1hcDCuREpm+yRc6zEkn3z2Yoj
	+OGsxYiwaKcAxh76cgRG1E9S1bB/XKjIEyWA5c8+r28HpZKLt6xyF2TcxD1/Kix+YqKoT7aQXUg
	qvTprMaGCU2OdOUx2RWMbpzDp4YVTjgeSkj+v+MBifJoxUhqXKYzd+Kj3SPca5LM/HZa4CXVN8F
	bovXmGeY42cb+P4sclCTgNKV8cIvSGPQ/rITWFP2book4I4Kh0ZV4T+ObEszg9R3mmTH13oHRvm
	d4DIrI0bamr41VdcKdc7tZfIMda9Ht1pyGnl5+UMiwzLlMzL8QsdDkKvOLMoLYwkdmm3QDlgo3Q
	OWE5SogyrllzgRq42b7yakDx162vtqUpbyyTMXSM9oqg7jZFRrygiQfog/62GCC6741iAllWsic
	hEGnqMD8nOYVHGhr2EciNPW6qBzXVKMsgc9+CSaArYHel8um9LD5gQx3ShJtCmWSRLRkj2weFlh
	ViPgkd/tzKs5w==
X-Received: by 2002:a05:600c:a016:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-496c65a2d7cmr72308465e9.34.1785329745092;
        Wed, 29 Jul 2026 05:55:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:43 -0700 (PDT)
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
Subject: [PATCH v2 13/16] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
Date: Wed, 29 Jul 2026 13:55:05 +0100
Message-ID: <20260729125516.230757-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Dropped renesas,sysc-pwrrdy from dsi node.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 14c7f0b0b2a6..8a0bc4d2b150 100644
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


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF63346B4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982652; cv=none; b=PYsHwlwpQlVBOawonGMZ1vv38iX3IVXdOJVygdwzS/IYlHku7wDSOpo4T891K32dYiUY8ToXB73pSmex61rv4RKClXbydm86UpFhYB3zSMDwcSYU6tx0J4m1MSVD1g0nzwMqHLWLcC935v0pN/2DfVZJJwaF5QkLlo+TKS7McYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982652; c=relaxed/simple;
	bh=jaykkqk6APytVlB8lFP/9ih0dnKFDdj7DFXU0SmefTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY/Wl4jpW2ZyLV7Ez7i4S4MDFd8LiWuYiVW0TrmSHAnk+OMOZxYp0Pe5OwisIx5GnxYAhG+yQykC7/i7xyG2JD5Htf0mZCvFz6/mibMqC12duniaBMsj0lGkdNexGmTO8PE4zbE25GlEuc3yYcOQLYza+lOeaG1ufgDps3JRXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7WASimF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7WASimF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso5324265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982647; x=1789587447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=Q7WASimFmTwpkNEsw4F1I3NZhXGUpgObBGCT7BM9au96qaAB4CMyFoZM/DxXcqo6OD
         uyqyjzXzoxUcprBJQfky/3/RI1Dbs1ncrqS+Evzmr/7syThPptsPu+38AkDEclu5cY4I
         Q0DBkNSFxU399vN8SN6FZnTfDTzYhosvHswAc8faHWBvf1disPAavcJx9jq5t3FwZ9hL
         6k/eW2qRJIIc8bkXuwjAwUQ56gxZ3hLhL7xjyd/FnHRIxhBWYWRmYOH5kLLAdCjb8dPD
         3rmN17mKDOqKy8rsWm4VMjrm4KOHUkWEJwSx9nVVkeVLSWsGOZqBoBugjm06LoAUT9Pw
         pOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982647; x=1789587447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=ALx2neHkuBY7LRQmjxBFjQD5CPA94LJcLVj1k6Tx2wLOci51YhC7qJoO4drk2ZCpPe
         HL3xhwgPxeeqwQlD9wbktFQZxT8WBuxpWeZ2rYDFE/w7Cpqdxzf645B8zpB9bjUgy1Qk
         wi33HO9Rse2fPETtTN9S2tJEvSwp8i4VtGKvmeiA21MDBGWUtn7iQf3zsVADXy+uv0Yx
         osbV1DH2lrIpBu8dP8nnkeVji2RHefdzkNEupTl18T8tQ9XiA2virL6YOEW9pDbFrDFb
         FocM5ZofY7t77gOeIIl8WrPmn3adgmUuUo3wLNWZ/jF4p02rmE2D6iF/0e1QNmZ1XKtB
         lhGg==
X-Gm-Message-State: AFuF++k6vxAXcm+OzYnvgMCGoisBy6dq6wlS3iBM5EDBOD4wzWqelU0R
	2UO1p/xrhv4WhKWSxeTwDiZDeSWPE1c+K333Y63znh8ca3O6j/dCYFUK
X-Gm-Gg: AYBFou0bBlcz6qMRjGKTIC1+kNU6brGMJXc4S4sAA2/NHMylot7jF1BjRT8q+WUeu2N
	dCOYtSO1AtC5hLpize3AiIo6gMI2E2BeIbWIwFGM67N+IZlYHsVp7xPGKCyuKefd9Hz6uIjBinp
	97HJy0YCY97hne5okbEVps2xE5/EfKyLXMsibb+qsl0KV2tdBW4aSzXUhA0qowLC9juETbJhLbB
	H3mF6zpfvQZolXhrOymyGLt3WKBpKQuYLMhzhmytj23beZfp9YoL8PQB/4FI6eSxGRr//OxW9uJ
	C6WF6eHN9adBQcOQofiJuJCpolPna8gpuGk7KrLCWK4f8GkGwsqIkpb2OEn5SOV/RiDznRBQJdV
	8OWatO6iblBGYxy+A4XEgyH9GIZuAKt5dk58FwUGswsGjlG1pjpT3fHl4WYVADnRWxp5XxanBjJ
	xdZV9EE6HAltPXEtQ6cU/voTBDKxrrFPaEOtgjwGO5IHVm9kIbitLPf0EonSHdzQGHBV3e9aduy
	qtJEB0uQDdMP9QI9csUrDObvT294MRidNtkD2R4n/oY86lcMFRhbW2YCKpZ42r+EqGOlfIYcGfs
	GnAIZG/ZVOLrnSd16XnouQ==
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr68465945e9.6.1788982647257;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/3] arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
Date: Wed,  9 Sep 2026 20:36:38 +0100
Message-ID: <20260909193640.8069-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Wrap sdhi0, sdhi1, and sdhi2 in dedicated "simple-bus" wrapper nodes
(aof_sdhi0_bus, aof_sdhi1_bus, aof_sdhi2_bus), each carrying a dma-ranges
property.

Add dma-ranges to the enclosing bus node instead of the SDHI node itself,
since of_dma_configure() applies a dma-ranges property found on a device's
parent bus node, not one placed directly on the device. Wrapping each SDHI
instance in its own simple-bus node lets each one carry an independent
dma-ranges without affecting its siblings.

The same dma-ranges also let the rz-sysc driver derive the SYS_AOFn address
extension register programming for each SDHI instance, identified by its
MMIO base, per the SoC's address space extension mechanism.

Set each wrapper's dma-ranges to:

    dma-ranges = <0x0 0x40000000  0x0 0x40000000  0x0 0xc0000000>;

Leave the corresponding SDHI's low 1 GiB device-side segment
(0x0 - 0x3fffffff, SRAM/peripheral/xSPI/PCIe space) at its
identity-mapped reset default, and remap its remaining 3 GiB device-side
space (0x40000000-0xffffffff) 1:1 onto the same physical range. DDR on
this SoC spans up to 16 GiB starting at 0x40000000 (DDR0 and DDR1
combined), so this 3 GiB range stays entirely within DDR0's native base
and changes nothing for any of the three SDHI instances.

Allow boards that need a different target window (e.g. DDR1, or a
dedicated reserved-memory pool) to override dma-ranges per instance, as
done for SDHI1 on the RZ/V2H EVK in a subsequent commit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 123 +++++++++++++--------
 1 file changed, 75 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..34639106d2cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1577,63 +1577,90 @@ usb3_phy1: usb-phy@15880000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c00000 0 0x10000>;
-			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
-				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa7>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi0_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI0-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi0_bus: sdhi0-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi0: mmc@15c00000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c00000 0 0x10000>;
+				interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
+					<&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa7>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi0_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI0-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi1: mmc@15c10000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c10000 0 0x10000>;
-			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
-				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa8>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi1_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI1-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi1_bus: sdhi1-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi1: mmc@15c10000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c10000 0 0x10000>;
+				interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
+					<&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa8>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi1_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI1-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi2: mmc@15c20000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c20000 0 0x10000>;
-			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
-				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa9>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi2_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI2-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi2_bus: sdhi2-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi2: mmc@15c20000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c20000 0 0x10000>;
+				interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
+					<&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa9>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi2_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI2-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-- 
2.55.0


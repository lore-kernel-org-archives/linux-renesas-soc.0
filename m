Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805320;
	b=ysNoiIGwMV+tPmp8i195rcDlsxdn5Xe/g0ZlWLoqQhihYvPtOsjj60N0yBqasiMxBxXa
	 HLDPK5LobjfQgQ/jzhk8dcunT5MwFdsv3YeVrVo4/3ba0IzoLXS7PMk10W+ivnDKPegKj
	 sm2XW/YsO9hSqE19exDnuwgGe/9pdAw8Fxddq94VnEb2iodcnaql9FCGQKAFzVyc+NHeO
	 5/d/gRDeE1czq5jdkXEfUkAt09cOC6W5HZ5aOIuoFdc+3Q5BJesKKL8oH1yKKhsDqjrVg
	 GXBFk5GC2TGr/BebHXugk0QZQOThKeuz4NTB56GOCCeGH+lnVxe4GwZtpb0wzRB7dTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
	b=bnbAOWZPr1OUcQTwSTxu3igrHV01ctnBze1ZA27nT6ALw8NgnUJwlz5oePvpRcKlNMPC
	 uMAfolQU3HmVoFFoegV5l/WlGGnY0koBpkUwCUYfBOAHBQC6nwa+QGcp4Giau6bp6/BpX
	 7Xbldq5Fiqx9T+SoIRq6V/Ptkl+9DMJPoG9Ol3ZFHypFrFTJdtlhaA2O7jGOKoepV6rE8
	 EAgjFJ+sZtjuVOmPTNryai5CuxAKaCrA7GxPo9w2/4O6kbHCymPsGOQYr4pA2GSv/z2UU
	 lvA7gHCb80a9EJWfu698v/I7MwvzDqhi2IhHjeVisRVDFkVMsjp1NDFANHGD+kx/kbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62C606D806
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 15:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B62C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so748113f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=eQR4rYHj73X7fzzSCfY6Vkl7vWu8lDHDACWqotIGF/PbUoGrpqfjLQvrlixhH33p+M
         8IzO+5MOfFq1Zlpp1qp7bNsiS2qSb5ntV/FBV+nopeBApWthTWVqmDymvs8WBsESxmMf
         DOwuNLBoDkNr62jnWtFyGLlSKb6ipXvXmXxlDO1hdL3ZtKfU9hw1E6SjdtnD6LjCKonG
         +Ja8uKRPUxepl0nb+qNzPlHJADjPju4KwcbOMrflBH6juaszbb6TbAPgGXkL5ZJCLGMu
         y9QVVOxCM/kFwt6AYw2TSRJPCLLqKfmBEu3sVA64dCU6iNeuGb7+sOjUUs6y/zX0GEkC
         24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=FPchClfWvufE54n8jTc1YCUd//xYXN2XXogCXsDAqcgYfQfr3RQH0kueONDOTKYj/6
         /R3MUgc3PFdrXUWSS9IfU4KCv/HvQUMyPYEFWgbpf5aVMPYLSk5K1t2cu+UrdRp+FwRK
         CmRF0Tr0gHFsCiMaBnfC1dSKX3hM3gXuBaSUc45PC/pvx6Sizv1PMy7L3dqifuFAiS22
         o05euBQwEeLvEVZ06vr1Au6DAlItQROrdxO/+6gSeZKblbWzQ/g9mBE3VhBKhE8Vf4NJ
         WsHzbydKbI2t1oBcYNTD2ETuUZtSU2eKgIJN0BIpR5GBej3YWrMlDt5MANJ/7rzBfWN3
         vv/Q==
X-Gm-Message-State: APuU4Z/ehOHNca+I+0QZPOEkuNCYnBaQk5vuEbf3YtBsKRQOCmuTARny
	eQybgL8BYs5rCj5uJPeGyS3wY2+vQ8rULrMnXyI7rUgCkxBcdm2WqfPa
X-Gm-Gg: AYBFou3XhXumsKrIjJQTWT/Ng7UIr5GmEm1X+Q/Ymoc2UMySU9lMCUDoPPOvQpRTyRG
	JDWVTPr1SzlaGLraO6uMHy6Vq/GkSfmQ3ILPBuolUvPwfH8pOFD1UsQE4wVudSU2yMRmJGg8e2u
	c1A/vBNuAkTfggAna9P79V4IqZWDvR7dDEO9NtDUJCUC8bVyiWgMk42wfFr9FJWGqUEUjwsuNeY
	LkvR+QllB8MFzdafa5Yf2neJa/OBKBGBRUeCYlO3pkisxlvnpisaIi29PaInzBXpKz1cT7/m+9A
	1SjorKNTAK30RsdjUBD6IEiZYQkmT4nwg2AIsF09Qc6p+zfHUZOuyuLQkaS4cm99cZzMfu4aYgT
	BS77Sbggdrdsae+x7YCRD4oFdOFB+rtoe8o2n9MDWXYvhUiJ67GlIQwtrntCEsXau/GKoj2fzv8
	S9k741wnab1oNXZNdrjf+I6zYR+cvlwRT9tzfcsv30D2bpZgKVsEETUz472Hs+/AvkRYKoPP237
	OpN35zNc3oRKvkLjOBvFwvt+i6ScUd1tApm4vNI2ev2BlGjwhx3GBPLPmEyesHz9gay/m12J9oD
	vKt70/jGZV/TwMymxnbzUROWDgRSc8OM37H+jT9+8BBoZX2LoDN1JybcSzTCYoDVvA==
X-Received: by 2002:a05:6000:2288:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e6e2e76a5mr36167522f8f.9.1793805317529;
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:12 +0000
Subject: [PATCH v8 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
 device nodes
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-usb_rzg3l-v8-3-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=2186;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=4Zwn7eiGx5F+e7i3Q24k8P/CK7A6GlG6OQaRfATc4Lk=;
 b=76K4k07s6+fybYDFWpnzklY7KhumEnz8DNk21e/s0oOMjA6/zO1v4oU1N7bzNteHER8ir6GvQ
 oUW/Wr3FWO1AbcuJ/IeeSTW0YfP91NnC1nWF62oFoPxdLcAcduTpKRf
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Replaced place holders.
v7:
 * Moved the patch from [1]
 * Collected the tag.
[1] https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 4df290c9937d..7e379f6ab837 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1406,8 +1406,41 @@ usb2_phy1: usb-phy@11e90200 {
 		};
 
 		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11e30000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		pcie: pcie@11e40000 {

-- 
2.43.0


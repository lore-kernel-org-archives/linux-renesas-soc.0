Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604748;
	b=nYXZjS/EhxUsie1J1aP0Fk9S8GSCMWqU6qpS7yUdbN1QVMGKOk/tPmtEvj2b/hCFTrm0
	 gDOiSeOE42eaneqJ0HtUn4P4mcdyLeYb2Gnpual1JL5KbuSCEKGqpM21qkF8FLwIPmOQB
	 wrojj9UI4cKd+PrTL4+yeZXQKQiaoG8CRrXSJYN5QAVhG87ZoiG3A4iTVWkVgakM5gkv8
	 ReskW9syvslReXoJ4mUY/FHEVWs1wKz37jVS47ifJMPgJo6rA/gMSLu7ypxN1rLwqpbkD
	 8B5R9hD2tZy2Llka4h1dxtNl8kGPlkYyJG3pi4ywJmMav3w4KimdxVZOXC0w1jvKzCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
	b=h/NIyZKinp58FmeRv6oVLBK7RdjfOOujWG7lRTvL9zgvxaq/yXV6RcLuU/MF2Qw6PJTh
	 MDljbS5NMNChoJsEI4cmP4ksvUF6yGElAn1kg3BTLwtRJgeX0VhO7voT78QZ1+ZkNa/HN
	 kFETg3Nkz1SUvdITXC8whLbAELdWemMqwRMeEl2ixmeKBlXwlv1GeTm99FUOl1IDG5sdL
	 nPHIJuJxWx6jXsGXMAwX8LhGDAFBWwOy7ULBO3MwcwOjPeC9Nfy0gH0v5JICo9Tx01s2V
	 9iLTDoTftuZwAPTZ6yILwbOMgZBjQ1xfFCl336Uct7xryGUk0IQEGzmcvftmCR9NDdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F128606A691
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F128606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so4427835e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604747; x=1796209547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=sTb6+TANK+dvAYUWFozbgumb8FQ7J4ZZhik5EqfemTwFdtzMiv5T2nYdXRLjKGsyi7
         BVHnhyqOAjbdOsHCFF9+olCr2ylSz1zZyAwpIKMpsZ/AgaEcEGh9Jt2PzK0ay9nrf1Ie
         KcwiRQaEulFzULW4WPYWy3cpQ5ToB2kitTJpufaU9wVi1xtie3FTSSdbRk/uz/KssBxg
         sFzp8P/XR7V86zWwF2RfPU+F86bHRBtSR3R+FbcrdNK3rU65Dhw6TgL87s8UD5Ws94lY
         9LYRFyN6+A3ci3BYX6J3oZeEVAkzQMAO/OXIuZeArCprqnWFGlHouwgcQ9vKKKhDy0G0
         Un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604747; x=1796209547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=qON0BcQQbuaKsw3IIw9++6GTCmN1IUKsLmYp9JYVobDKclTkngyqwRe0yv5/chlJHi
         jU+8slystiWMO/rJFRWVGQ52nB66ONtibaJHWEVpLo/X86CdglRpLkWXI3sOXoGDibkC
         PXAOtJGpqalISU7zTWyH7HqlUKuJMnVyizbjziS3VSvZ9kdq0bCB3Y2VxxwHrhsU3rzE
         0PumIF5+geUS6o7465iFjSqRSKmm7loiHagbQUwfvnzs5C/UIyfnqFRP0HqQppQRM+iB
         8bu5LHRuI236CWpTzR9jvHwuXArBcjgs8Xn6OXrqsj1qqhJV9ecKDyD5qkQfyZn/4qDk
         PLqw==
X-Gm-Message-State: APuU4Z8dI7x+b38AywnQoDHVfWDj9YXysrnud5Nil6COdoNH5l+RL6GO
	a0k+SwXUKmaKCyNLzttxPcVhEmyB+j9fa3OLZfGzpb+dYL2TkcYJJXvr
X-Gm-Gg: AZFdTZe95kguzaMToCdNyWt764U40s97S7h2/R1SWeI/1qLNBeVxyDFXdBEpetNITne
	307lyD5dAPrpNxOTza0C6WQS0Zose6hr0iDSMcudygMkWx2U/aRpBcaJmkPstGsVYAipfE+CeFo
	DnRVfB1sK7RHdgoxdhILTn547pO2Ekvu5ocdDjC8aq5TcqK2EQ/gChyZOSxmr49xWSZUtHwEovT
	lEJw4yHVpAklBzeAU9JJidoLJzDgbb3L7D/BpTbJ5zvTAbRrJyWkpT+223Cp38Sk8SneJ4v+/zp
	jSCamv7l91gj8BpbCR6Iy5l4vPlvBV/fZTHQ+RkyOVGJymf90WUee+tixv1tXuyfXlxtmxcMsk4
	KhH6smQmrQYFD7U4vVaajDYHID+NmFl1QB7kP1qIUVsJDahCzz9xLn3baNsjlPtMSe0E08s+NqZ
	sRjFJBeS/as8Z8Qkr2n2gXJeNq/c082csFH7TNg+ncW6Ozpy8SV2ZmSjguVDojDEdgT4HVwMk5J
	JrnU/2ylW7SaU6zcuNSlLbDVV6K9LrMUvcr8Bn3qiLfzTgzUQD8ttcopjyCSbU2UMDSdkpzmQEO
	YN5BniVZ7NIsxVzlC7q1l94cLNW/XlRTsRT+0f0SlfIDiesimQLxn+XvHjTLbks1
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr334773935e9.17.1795604746756;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:44 +0000
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
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
Message-Id: <20261125-usb_rzg3l-v9-3-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=2210;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Jh1Kyo5ZTMRj6dJgXKWzlKlzlSobHFJ8xV3AIFHgvak=;
 b=bHT+na2aEZLyXbW1MWwSkKw27tYSvY49RMc5kxmpOQqSlRJn6Cjk3JjA/OX9iLGM+BZuISbbQ
 /8bBQzDmxOOBBgyAun3tgbSo3N62yBczIoeAOBnPER8oEF8174HrhoZ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
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
index b41a813b01b8..682301a38a71 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1518,8 +1518,41 @@ usb2_phy1: usb-phy@11e90200 {
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


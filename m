Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604749;
	b=eWPSkRfd70c0A/Q4G91NKQfqsu3JvX2Vu/TQEBTXkp6DWgMHCDsMfBMdosHysV3asEZq
	 xaYVpaG7HE9R8IKRi0PTfvmudA4pzEBupEzXsMLLOC5HYL+DwF8WEI3SiYl/zlC/lc0u3
	 34MYDKxJEph1Fy8e+gI79m4E1AygxhbgYj8Ngr49OglEmycKqdi/+tD0NNoDG4cQnvCLP
	 ww267JSCqRiapsfPaxviHGU3/g0FhSVsXR/bFIsX/pReGw9IDFWByjo3rbXI/Azq1VzpM
	 SRSoGNyjecp6Voaw1Zkj7YgsECFYcF6+xOh+d4UnfTxxbaojF+dg54S3ZBjdW+yoNdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=09K4lGp/JnF05X+XGpt/i5g5uy43EeVqHfVZ7BHq6iE=;
	b=oNg1o1Ovvtg+DD9VC5iGLcOkMIgvDtMJsXtbAgnkmMRXWup3PZaY97T0eu2sHQk8SPcr
	 Q7mCGs27Lcx2ygByrjwVQDjMOI3FrdpszfHm/258re3YjEo06nUxC/N0CWkPtFKFwkUS+
	 V53oSkSzcWmrMdIEugMUeI+bRTz08ra+PADOxiqYYWg0u8rI1fqM7k63311cS+VyQ8UW5
	 NHj8OVfm816/lMKL6BFPrn+JVQ1xp0p7Bl+vh5vKtKmNKYI3fgdwjmKKfOAaIJQDiVaqV
	 rshiQc36zs5JaD7GBsH5z+oIr/h6LI+T4QGJpVnEpChXsS7MkZibpd7fUfWJ+uYKF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqeIy1dI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5C606A69D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D5C606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqeIy1dI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so49998815e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604748; x=1796209548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09K4lGp/JnF05X+XGpt/i5g5uy43EeVqHfVZ7BHq6iE=;
        b=RqeIy1dImvRxEyhep9ysebODz3tgV5tL1lqbsvROB6IwixIQm4Yn2/GxSUejfUBVuv
         mmTRtvSA+c+fOBFU7HfW+ybydGyCh6dcaMRq3f54qOdzoRWMI1+jhsOg2QPT0mbPKojR
         nziQSHaMY3Xq9PgGVbhB6bu0yH2DUqXrsXiJQO611w3eWmjBzP7NeyycMx4Ncgv32JON
         7CxQ2ap3ku/q/ri5nHYPZQPlTjVBNLOUsT9PMXE9pKTQagDB+hiEpF18MhhFAAqBKZ06
         fJ/LxnuBp6LYxxuEKEMVP/l0kWl4P/TNOil8AZHjz1QsvMCFJgXXJCq2auIBSTP4B7nU
         a7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604748; x=1796209548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09K4lGp/JnF05X+XGpt/i5g5uy43EeVqHfVZ7BHq6iE=;
        b=ynSOAvuxix8T6fhctbV89qRSdnMhHYHFW5VMLO3Zfd5a2dtu9Rh7oMfkGPpYXf0obX
         e6wEIOYPGCU57gHjmMINW1xcMjtdfQMVuBjTg+8Cz0EtJ9qm8G/PDD3ndaOPCIv1sCH0
         XwBLJlr+hXPw73vIVbyazSl5xHGxZhb4Rowh8ZPXwNuiucydATRBYPlErqgx1UJUQLK5
         1Jpylf4X+QfcTwxDfOM0a444UYWAnJS5164ee6TmFnwyGmjJUZv+SHOhQvDwivoKr8wE
         AUcpWRt4XnchD7H8Wiv5vTSKj337CNWrPZxBlL2bexa8Vj++NfooBiKm4ff42omJnoMs
         WZ1w==
X-Gm-Message-State: APuU4Z9k6nJAV6F4qQqqCAN00CYSNQiDq2nI8TXXJ3jCHXwIb/bEx+h6
	IE4RqN8/rM27woUUOY2hdPlNo4tWDq86j5h+HBZW2q6Hn/dmTuqEfgEc
X-Gm-Gg: AZFdTZcfw1bKky/Wq1GlS6Id0dJYINvG4t3pRYbqoCjUOwacu0yhJPeNJls0Ba8k/ck
	/rVdAeOtx+raRg6VfXEKqnipa3AxeeWf7Dmx8QNOXMPwj5I6GOLVQSK/z2HBSSmKb8H+/1Pkp4v
	8KBcmbsSyOX2Dk915AQNGhDL/aTDRDdtCoqfl1eHAxFBp5HFEYjCSGzi3KZRXTOwRzNnX/u+csf
	39bpJBbGR5S+VGBNHk4sszfsorma0Qp29y+vAALD/5DUyF/ftB+T9u/RjBomY4H0FKtiNrb3e+T
	rygXDIrCrxCj2RCQEb50uY2dC7oPqrNCkLNZ6WNPNOFKm1k2m1I5y/sC+fbx97fz4AbyndXLXnj
	KIg/tpzBeA41AyS9bIiMWGUIt4V8h3r+FDbay1DMmAFqQ5E4N8EBsFqxNs+opa2NSsP0fpHtg1w
	HNZTkHm76T8MHU3PtvkP/YTy2n4cpgzOVFR/sUBATSTtQ3qqX5EnWv59UzwPcM7YMkuj5qBVPBA
	DvrFGQHZ8BZoaC4V28sNz2BPFVoiK3KE7C+MrSum1H+y2KJV92v6ynJz1Xc2qXk17Uu2dyCiC/j
	yrz0Nd6CgZ2PI8PBYdinduxbxT95Am1V0bcZQC5v6JmTF69jpbbSuOq4TQ8OMJY6
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr347205155e9.31.1795604747563;
        Wed, 25 Nov 2026 03:05:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:47 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:45 +0000
Subject: [PATCH v9 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 support
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
Message-Id: <20261125-usb_rzg3l-v9-4-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=2668;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=2JNLz/zuyJoEmPb6HyoWFLLHFip41Wo3wsHG06Tf8hk=;
 b=hpAEc5bJe2SUzu7+Enn51ab/pjq71TSQ9fVIcTGn1t9DVWz7cjwaflINP3dt/rvrjnYmPRfTV
 Q3NAvbFpQLcCKhRtu7I2JOI3noDOudphk/Z1ijjwlR9MWCJxgbnqNhp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 Host/Function on the RZ/G3L SMARC EVK board.

Drop the explicit "disabled" overrides for the OHCI, EHCI and HSUSB
nodes, as they are disabled by default in the SoC DTSI. Enable the USB
PHY controller and both USB2 PHYs.

Port 1 has no OTG pins.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Restored usb1_pins to fix over-current condition during boot.
v7->v8:
 * Updated commit header.
 * Dropped redundant nodes from board dts as it is defined in common
   board dtsi
 * Dropped usb1_pins.
v6->v7:
 * Moved the patch.
 * dr_mode changed to 'host' as function is not enabled yet.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 49 +++++++++++++---------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index abe0ae7cbc44..c96d742422b3 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -132,18 +132,6 @@ &can_transceiver {
 	status = "okay";
 };
 
-&ehci0 {
-	status = "disabled";
-};
-
-&ehci1 {
-	status = "disabled";
-};
-
-&hsusb0 {
-	status = "disabled";
-};
-
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -195,19 +183,15 @@ &keys {
 #endif
 };
 
-&ohci0 {
-	status = "disabled";
-};
-
-&ohci1 {
-	status = "disabled";
-};
-
 &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	pinctrl-names = "default";
 };
 
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -352,6 +336,16 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 4, 12)>, /* USB21_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 5, 12)>; /* USB21_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -427,3 +421,18 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};

-- 
2.43.0


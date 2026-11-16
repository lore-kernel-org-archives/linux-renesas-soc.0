Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843190;
	b=UezAIPVUJDqUUXefpSKn5L8wh6UUz+vtWclblmLPO/DQ9coVBP8aw13AmexCvzhh8EPD
	 qhBZiT3o1uZSH+hm6AP29Qxo3/V3PaTjSw0NJiEfTW7y2CM8QpZ7v6mxvqr8fOZwWCvgN
	 TFw+jJgEiTT/XdHSU6FKOE++YiPWbeHSQEGW8Sg3ODcOF+NjRx9I+pQ6RL67RZqZHZ+FZ
	 LGMWrdAlaKq/MmCNoevqwmaxSVNJC7l0Q7YoIey03sGM7I3nIoKFI03tuNtknDEiGRZRu
	 Dmj4qLGK8ks6JAcyWKSnKOgCWzd4036RBhXmskK5W0g+Kr9uvekWj9kzTU5EgLvb1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
	b=QUYQjISgULJ6VS44ePLA8ILpwqZtTQUSY0XqR+l08awqB+y49LrPx9Ii53t0/RbHXdqU
	 oyb2PynbwQEN1Souz7EwF1X16xT2a8R//Sagn/Mh9J79S5RfXO21mCsNj5tm8x/QRP1dv
	 XIYcDBWHQaS516YnUwPFYXVO5Vr4f78lS3VCjuWlwXM4Sm2oe6sO1WgimaFzzSDrYtzcK
	 avmyNx7dflmUqw/yC2zsP0LER8vs/nvVGFTsmMYLsB8Vkk3rdWm+AWbJNk4GV1TiFPW9j
	 5GnmEEvG5J1k5gcWXCgxfqtB5c3BBuQct6ATaRPxl87txRkbiLC2eRQlL2pYYxsY3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryIdEDyF;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A887606A884
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A887606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryIdEDyF
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38100155e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843188; x=1795447988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
        b=ryIdEDyFDs5cHYpLuMt5wkrw9A55eaiObVkG7jWQS7AOYHuon/3ahte/hkeWkqB/Z/
         5xUOor+mw5oHsJPQgA/cPHc0MaQKj8uX3UG99cOJZyrUxWSLUhDWBe8w0I8HcPIunlLn
         O1PTBNZgQHOhr20Mt8kzup2NI/eQcnpotPKQwHjdsjr0f5hlZJAF8wjT2flA+ZBJDDHJ
         KNIoTIRkyCdrhyRhnfO3DnV2AAVROOM3puPyDStbZRqtOxvLdkXwUEBBuiK4Tvcfi28n
         7fN57D4pBkojzYVveSZ+Zn2/mqJiD3rgVrTrta2o2vOSt7ozYzUD6Z5/65U7aMVI5gXF
         4IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843188; x=1795447988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
        b=JiBtmtuM6ljOFWmevCOi9Us7FKHuG7s0uE7W0v+ArK02m8moqOn0Cr5kXIxtiq9G/0
         NzM3nfmdMvElaN/brOLoCaInzUs02wChJ1GjuxXbXol/1Iqogy0YNj8/CKAcw/2G73AV
         vb8xAuwE9CP0rZAqQNh3mx/Q616MaTcBdPWGRDArQ258lhGjfmDgJ8SW0we6H6eat03X
         IopiQmoTw3n890P30kfNKfNazjtr7EjAF2CdYZiDlJHiUAeuhLt9lXAWPcH8oAaxsArY
         mjHjom3c/XwCDMJTsLlAawYjP/xwVg4nZinjU+FLauSemUrFZWkZHD03ciwbOVjdpvBg
         Qn9g==
X-Gm-Message-State: APuU4Z9M7fDAiqYkgDIIft5hdXMhHnLPisNJIR5sAHXbXMMfxprZxJsE
	KaVRVFRqjaM/PwbOiqw/VeKR98F3EAjo9SpCsI99NCBt0KjBxoCVGyeu
X-Gm-Gg: AYBFou1OIn4Apq9CrsTCirsWc7GjV5EWYeflsAOgqPUJoz7LJJS1HlnKeg8gGd+cASq
	8E+Kx0uvUihK2V6/xhEJkQCwWN7FXfU9tkqqf6Ib2RAoo6iKFE44hm4U5PvNAhf0uTtGWl3AcNe
	XACKq/GTD8XIAqcvw4MKshhyMWzCX2pAvqDcvA6OokYs+Mtv+5JUvMuzWTKaVd2qmRX4uf5lk+O
	+e1X+HEbSk9z9AyJnTGft30+zWrg1QLsWZ1oszC/87A+eG5t+Vj/t7fTI6lbje3dB+xfYZx7T8B
	UjsOa7pS2YdF0fCDqxgAoauVDRRJ1HujYxJ+rygQCELBRKHNR3ZqehOMS3MQotufW6+kzS0KBaB
	nxscTWVKBCH++F4KpFJibIgWU8uVuEmkX8JT7GD22LRpjktfPgf0Yht1aI8swkHd+gMxz6zTX8i
	xOEJXit+5uPGliypG4YRcQzJhpTzu/MN9Z12OPBT9litWcXZrNrukEAoANBjsLCRZ/mHvuGHQuT
	8AAlOS0hxUYt5SJSbxlS/dZtnIMFXAgz2ssk/aifCTbrUBmHncbZO+g6zy5T57uBhhXteA7pgKl
	KXuMhb54yO7EtfJZQ9foxY34sjoZMSm8V2Ks5qCEXjDyBYqLlgfI1DuQlJZuNj/mFQ==
X-Received: by 2002:a05:600c:6206:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb687c5079mr121080955e9.8.1794843187787;
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 15:33:05 +0000
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
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
Message-Id: <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=2530;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=MBMsJHEXlBjneZEz7hzvDUbXcDmUBxSqtdCD9gjGz4k=;
 b=zDYN1fO7M8tHthmxufJNI9PxwB7bog1Ay6y4sHKkXoZIwTBKVUZa9R5eltdv2AL4y89qgaeoK
 KxgGzMka33qCDASrpTEWzsPJK6mKA97m/KPNATdTzzSEqsxUC3JlIGe
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the CANFD placeholder with the full node description:
interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
and three disabled channel sub-nodes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped fallback compatible based on bindings.
 * Retained the tag as the change is trivial.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 43 +++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 29ce1ab2a57f..682301a38a71 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -28,6 +28,13 @@ audio_clk2: audio2-clk {
 		clock-frequency = <0>;
 	};
 
+	can_clk: can-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
@@ -651,8 +658,42 @@ rsci3: serial@100f3000 {
 		};
 
 		canfd: can@100c0000 {
+			compatible = "renesas,r9a08g046-canfd";
 			reg = <0 0x100c0000 0 0x20000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx";
+			clocks = <&cpg CPG_MOD R9A08G046_CANFD_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_CANFD_CLK_RAM>,
+				 <&can_clk>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			resets = <&cpg R9A08G046_CANFD_RSTP_N>,
+				 <&cpg R9A08G046_CANFD_RSTC_N>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+			channel2 {
+				status = "disabled";
+			};
 		};
 
 		ssi0: ssi@100e4000 {

-- 
2.43.0


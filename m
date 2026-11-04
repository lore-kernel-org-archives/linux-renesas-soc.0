Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805320;
	b=bL/rG79LRGCQVzbneGPdOsLaUE2V86SfEt1/WsxZCxpTFaARLPXfh0YJR9Pt7JBMu282
	 S4moIu7JqW3Ksc+BksnndGlQHEaPbA/FgHxKIXn2PDg7gSTIPazJT1d1rlafiqFSCbumP
	 08ik9cR7D7AfiNCqCRR2aBd+wK4JKzgucbHj71IXdkdsYjfGhhpSQJMrztoy+Vj7Vnq57
	 j8chr8JJhqv+uFsbb/6GwEFur6kIIPUsxPVUCQGLSFvX1BmqIx8y0cuDgxz2LyXlnzuLB
	 s8p5XfL7IbZqSCLsEFvCSPVJRYHt05cQmTXZyp9C3yoY8iNUlW8NIKFFlYlTW1ek2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
	b=Zh6VDUQbuEu9EAf5mcq1NarDo5UuWeBu6YgSD3hJlXG9mWl5YeK6HVqHCvHNuyCBvqfm
	 zHrhF+/rvTvrCffD6HBzAIViK8bG4AJKimE8JerxJmzyZVXyBkfDvLevlUiBCCWnNNwt/
	 4z+yDo54+LqDOQjJlw1LQGhBZeWDUuHT3PUILjJ/FGvwObYa7s6/FSxu4k5iM3f51Cv0o
	 e96EEhSKKs4UJj+5U7cJNAxghHpLv0VxxRl8gRPBqKjMgj7To53OLVDpwrVFhEwiNUoNw
	 jN6+i835C9XK6OQbc98/Fk+sGOPEhRihYKsdsNbAobRynPP0Ef1mdWGY9e58U045YtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6LY+J7M;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B89606D812
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 15:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B89606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6LY+J7M
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7609865e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
        b=M6LY+J7Maap5Xkn35WhtQ4qpZIjdiLwIhtpYcaP9gnj984fV0oknNqjEMp2OegYMFI
         aumcBMEIAt32eGfRe7wcGT6ACO/pz2N4VVwXNjjMbo/9g2J6K1XnKxM5cRImahGq06HQ
         tJ4MoUZG1R3aDKsLG7SxTca8A9vCquS8imLq/JEqJpJkM/4D0HFralwa8VyQypN4ygY0
         IRoe8JhKpodd9P6m76lJhYL59HHtAblnYAjAr28Q62qBncgmr7ViCJYBt/bePYtM9hjr
         UFMduYQXZEweWE7+NhoNJFhYMYTKm/Y7uq0GdGsHlB6hIR38Re0OSMu7KSxgh+c2zvMS
         /Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
        b=sn1AP+pgBOpO46ZQjTl7wVPj+tdAA/+C1cAV6X/UX9goZn+iZynje3S76rMozY7ESP
         I3VQxj8+xoWm0ENw6EdEVLo0NbHV92A94sl4q51u9498pGKtX4mvj55HDYTcJbZnMLBD
         /UAwtnlLcH4pU396OLCJm+8YKMnpo2bTJm/iQCWLtMqqaUnbj7tWmPze1JpCdOVdcwMG
         eMt0mJScw3lOfCBj/T/rOG+2QIRn1yefmlIvG3mEWIwluxmE06Tw6bZc0FHkS9EbB0xX
         Csium8Et91f8KrDQVPZLVpbTxgZMIIMet5fm+pTAZbYizCPBgfHkMKyyFfcWSGUUZci8
         i4jw==
X-Gm-Message-State: APuU4Z+tAW6aaf/YG1S3MX0y9aO+tiDx/QGlfGV3RYa04tCohsKTUmML
	MHEID7qm7ntsr6sgFlAEF5wyX1XTVtCGjh2yyvDUDWxYJPKzocyqVWsO
X-Gm-Gg: AYBFou1EP9K76Gsv+hAlSz3RRHadPP8JxNSPBC5oj8dgWOaAiV6lg4UcLQS52Atl/HZ
	33ggmTtEKs+v2WUwUKptpG0fOLu7N5wuU1uFHosguML4ymg5dT7mametqEtkf1IbshkRJHiT/PS
	vkSBq5xrgBpwLOpWpGlOi1bnZ2jYX5cKXrMHUl+ItiUB7tljU9dHksQS9+BnM1rmNjdi9SYi089
	7Hk0yP/3A+xpsFhlbpVXz28R87Ut92PehWYtEG9La1o2crB0k9K6g9yZ9ZOfX3ZWJJQJBmKq9k6
	I/qCLw26E3c3XIgFa7HAQ303rWFJyr56rkqPJK9ArVTPiDBr6GEgJXpNrllnm2bfbPTg2i1yye5
	orY3c0b7QnSyXGXNcN4yO/ftPhiKTvHLOIA96LcT7K5cxKU3lub/cu2giMuoAJWtixgGSw2EGT8
	aKyKjlUeb5XKBf5vx33W04Sfl00V4o6CbsGifCrmRxvmXXn2C4GNApDinoPwLTaI3sbjujziDhD
	8JEjh6W3StXgrGbeqTC+C/MEN0qxIruUk2OwBhOWXZzPDH2QggIfhv3IOoSpr1CtBFZ/SQXkjI2
	JYk0diKz9AQ57a9nkeu8TVWsKLKzN5njYnvccN/4kvsxlWts7W5DRNs7QanvdD6MWA==
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr364163455e9.28.1793805318506;
        Wed, 04 Nov 2026 07:15:18 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:18 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:13 +0000
Subject: [PATCH v8 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
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
Message-Id: <20261104-usb_rzg3l-v8-4-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=2436;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=YojL+tlinE7FIZ2yeWFo6aqIrFv+jHkcwPWa0n5GxOM=;
 b=qvqZR72nd3jkfSRiegsp8j/z9jBmkwHWkyrsvNPMZD0V96dBR0A57iLA022H7Js+e5d7JveyS
 2lHoXLZDrTvB/6Bl/eYIAv6+X21qKBK0x7WHXSi52+0tIh5OSjDppeJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 Host/Function on the RZ/G3L SMARC EVK board.

Drop the explicit "disabled" overrides for the OHCI, EHCI and HSUSB
nodes, as they are disabled by default in the SoC DTSI. Enable the USB
PHY controller and both USB2 PHYs, with VBUS supplies, and add the USB0
pin control (OVRCUR/VBUSEN). Port 1 has no OTG pins.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 42 +++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 68d7b579e352..9ffaead2c6be 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -71,18 +71,6 @@ codec_dai: codec {
 #endif
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
@@ -134,19 +122,15 @@ &keys {
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
@@ -217,6 +201,11 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -277,3 +266,16 @@ &ssi0 {
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
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};

-- 
2.43.0


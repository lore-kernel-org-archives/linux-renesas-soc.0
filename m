Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70139448CF6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011772; cv=none; b=fv0gGXGaRzNXDF+DT2zu+ZtaUenjcKRTIrwj8OpnS/Ek2Z4L5n2ouNJKHxPQQYoYibAsSM1TPHNsmsXZ0q81pAGAvLkBtIWd9JHHogihL0Yq6+sr6g4tu7MhWHwLJInJLmToIng+FP33rvGevAk/ffI9KcekObMNwkcFSDOqGbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011772; c=relaxed/simple;
	bh=gfkMS6eWCk5oR6ED6A/K8/atxPuQQfqZSoybnWP6lv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEWuhK4zpQyFK6LNUGyQkZuZhztrnMZDKQ6UC6TC1E6GirSHXUt02CTx8beq0io4RgMBy0a37ZMvnTI7ybvp4G4lQxYP3WXafVcwJiiyV9Ccig/TzGHB4m29UHZxywO2BSNxrVSN9/49VQo+fU+4EhV1nuINicNZkqGBivaCqsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwDaPTy/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwDaPTy/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720f3bf164so515295f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011768; x=1786616568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zgSk0cJL2xA/gsDWtUjojCnhT9i9FEuOvZpCrKndJo=;
        b=kwDaPTy/4cr+bRkijQ2dnJPwIwhrL2Tmpa7EhrL1T9F+bverapLdV4vThRhwb4swDX
         p4MG6KV11I1ObzxE9wy1oxn45SX/LyofyJDiG8JX0qDVRmEK701lpYhXXa/twPk0fFUS
         hOrz2WpHv1ptq4SDWb6Tofx6uw+hg7onSPMGZ4RCco1p5fEN8DIdkiGrzchY5K5uAQ+4
         lz/hNUoG8RHZ5PRZrER+5qlnYbN9qhfD7V7dZKvGN9XuUxL2dFON30oCZoVQt/s2Ns6H
         99vUPQx4QSsq7oRLgWqfpkABvRzgHRyfTdLtQEXKdRAYCIGLBYPUjBOMY/NBXH3g4B8O
         cIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011768; x=1786616568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zgSk0cJL2xA/gsDWtUjojCnhT9i9FEuOvZpCrKndJo=;
        b=Hlzg7CfBfGVaEi+RcD77A7Y7oswK3TB8rj0f0KxYV0x77RnFc5GTMmh5veTEH3cD9K
         2rZINWcmJnMizIT/2/aIEJYjjOyzDXo5AiEq6Y6wuzHthoefd5kJGL/FN0kpD6Id8O1k
         M/4cnZCYOnM/PlVmO+zG1vuLb3aSGwPRBLbG1qnVMW5fimXu7NQODBGzYIq1AUc3vHgH
         VoYB5HbnHKEMkWKgViw2+6wYh6soZwPYTYX70xhM1bheryLE/pu5E/3w6rTQqJTASD7p
         jVerJknZep9vdS6hivgIwDOlJujodN6M78pLqslpR/uWLQBPND0vkEBQ5y0ZHp0kK6pC
         5Qlg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4c+sYFT+sOybqjpj+pmCkDub0gMiybT5UabTbOfmfz0EWGGFZgFIWN/AbxRnaiPQ/xvrSsvNJE1FWrVwmkd7/Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mm7eiaWetXXV6m0HpfffPt28pvbBMxJyo8rx3ka8hWlZL5kQ
	qlztNW99Mc04ukfTkEusiWBvh+I4tw+Z1VM4YpnxhLFLFK781NKyvaGu
X-Gm-Gg: AR+sD10ZOpUiAdrZMCXcYlPlGBkqNjagA9rK7AaFoxZ99a/LmhZCKJO0jnRS23FdzCA
	EXdRfsa9QZVTzP2YBm+gzh7YLF1ujjX/l4kN1JZDeLDYKI4NkeSdVh+P6TIwpmQnraN9EvwZf5o
	xS5M1W8kPrtfQn7TNnC0gYf+P5oeXcyk0P798LxcpPaYhWBDLCXWQL5XFUeLdQ1OhU8uI6otxz/
	GYuTm6BntpnNvX/yv1UZ77BisDj+wXIJS+BFUvtx6HfPJcVDJQGVlVfs9MpSkhAI5E4VvxN6Vr7
	BhrLuDLApU0v2PhHBHpCBhjSAHiDSh49kbyZaXz+b1n2FmJaWvWWt/h/eBqRyBHvTvW0s/dtKB+
	mdZ9x8NvzxUxrYhC8ddrMTK9QpJq70Z6rlmJrCvMA0nzvAx4bAeH8ZKsFAzQaWanePZ8uQHNsiz
	RbocEHdI2xYCP44/VCx6WM9jbtF/tOQcNTI9nj2c6M0sRXqSvZcbgstxA5EJScB6X8c6fY9VHdj
	O3zKxvbwN8y
X-Received: by 2002:a05:600c:4ed1:b0:498:1577:e11a with SMTP id 5b1f17b1804b1-49952ef4740mr63833245e9.5.1786011768349;
        Thu, 06 Aug 2026 03:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:48 -0700 (PDT)
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
Subject: [PATCH v6 10/10] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Thu,  6 Aug 2026 11:22:29 +0100
Message-ID: <20260806102236.149159-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..b189ae8e808d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -138,6 +148,20 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -259,6 +283,16 @@ ssi0_pins: ssi0 {
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
@@ -330,3 +364,18 @@ &ssi0 {
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


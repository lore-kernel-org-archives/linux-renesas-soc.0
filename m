Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB746A5FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544400; cv=none; b=SW2qiP1a453vJDPaYzsj70l/ZX2IB6DObxZv+5fbDJO0ZGUr8vNEfOJFEBgouNrpUCDbMNFmOTh9pIXDx9d2CbYPx3Ub5Venr7g37NOK8+AX89CmDQ1SvmgyD5gpMPT/x58x8gprfs1C+ZaEHvdvGJUGlGThz7jATPOt4tWRnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544400; c=relaxed/simple;
	bh=vGCKx1jO2fnjohxYXmY2u5KREn20DVZ1p2jr3ZYBXLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eH+dwvEfaSJ9ACyjRqiUzwFe0YmCenCgy7f9wtwzEv1oRpZN/ziJ3oCHP8ArR6h3/NWTAKpWf87d9eKUEV44auXoeF1Tji3EUgkqW26xrZFhNLO3AMQSZEiBYuONWMg77O+K1UERREQ0q7E99flXdfr5flIUvwEU+gosfkGXsK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvpipG4z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvpipG4z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so14046525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544397; x=1787149197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxuE3pMnvCOTWKB+kOJcuq7ATx4mF7nI4NvRJRTu1Zk=;
        b=kvpipG4zdUoLzZrP/p/zPXHMou+t9jTZuom0ucmSKMOLtinFu7NhWYSfkhgjkC4Az4
         gNJLGvCkMkDiawQ3E1slIz0LLcZ6fhNx1bQXGLTNYbTkoFfEwend2wIaJ6YbRQnDn3Lb
         QnD3hsMb/n7L6+KONPfTHMvFkWqNbAxUeIQJXWhuSA+w6xznmDkJFlktHNJQiP4IWmxz
         Hx6pgvG+aVecbEOgrY1BPoutnUIu2spAS8DIuiqAt3vStcN3RdurTAk86zSKfdXxURD9
         3kVI3409+x7UwVVvnBGb2VV5ui3w/I782GwnnpYzwnrshF8S3ddHtuUAogHeRZF/yx9c
         cy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544397; x=1787149197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxuE3pMnvCOTWKB+kOJcuq7ATx4mF7nI4NvRJRTu1Zk=;
        b=dRn69F54ULvyF1nUvAZhVSBDOax6/3T6N89vGjQGjc8DXLqMT6uytzP51x8m7n8wy3
         /dkZN7aOyZKtIHt2Xf9tXXWkcxtVDgD0MQnFVem1PP0VDjluSTmllz1qwfK5D/oIPybC
         4e8xuHhGIlXKwZK5GHxKmY6mrMf5hI7MAPooh1NaYaEKjAxJBjRviIP0vy0CScwkMtdt
         s7AsoH0jWCSN3PEUlP/WLA9Sqn7hMIOzOt/jUT/xDdMYkelMli/CkvwS6gVD6+i0tQd+
         XnCJB16Jg/PHjldxt6qU/RqYgyjPrmPQqPRM/Iza5cxxjAQdtpCNGaTA9DZhDv73WcaW
         mfRw==
X-Forwarded-Encrypted: i=1; AHgh+RrD0Gb76yxQhujxhnNUQNzdUU+2HIqJL9/yV+pd44t74Gh1cYyLjksZQGBCWSM6kRyPdjVtWi9JBLJKbbyOII4OHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSdTVwcZ7MWZTtjZON7zl8Mi4XuV5Y9MaPZoKJPrU1w7ehApL
	TV9USYtWsKM0l5pOhzPoH5hyF+N+O2Ibd02i7ctkKYOgtrn/s0lE1/VF
X-Gm-Gg: AR+sD13nDHHznD7ggYkPnEyr13lMdsE+eUcz4mcup6JBw8GklZ2j1REG6JrjTCuquyF
	ei1EvG7kATlXcACD+3sYtyXCeRf47ObMmmAndUbBi/OvxDDkMwTgMeq5eHWl0+Wnd6nfpiic9Uk
	7vlguIyZQC7ZbTCH2zjzj+xMrRZliRdS8koZw0f8i89qZkf2VUXEqzW+Gl+owGHS6xlYF6q85My
	dEx1YMGTBVk1qmiwAgmUpWDlVEYh69DDr1juNlVvNmjnJPAW5n298S4HDryRaPJt23+kyt1GBK3
	aIbXk5R9EpdD0S4vs1hdgHFvzIpwrELLvaW3FPsAkuSGp5TykjTrj4nkieunQnaacK7fUvdMGgO
	ePXE0+a4MACAC0Bw6TS7crRUZfaKQOXuIAC2utWrBuEoPIA2DZms+XKKcmD8AaA68QwAne5jVyK
	kgeUc+fPYv3oWFMQHc5haZe170ih3ITWKqe9YBLyPF88pskk7cu3YQ0PYsffFYuljoCugw1C3lj
	o++A/kGSIBXOA==
X-Received: by 2002:a05:600c:1d0a:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-4997c379313mr56996825e9.1.1786544397326;
        Wed, 12 Aug 2026 07:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:55 -0700 (PDT)
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
Subject: [PATCH v7 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 Host support
Date: Wed, 12 Aug 2026 15:19:26 +0100
Message-ID: <20260812141940.246223-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 Host on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..522cfde4b66a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "host";
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
+	dr_mode = "host";
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


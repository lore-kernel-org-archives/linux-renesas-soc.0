Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8447B439
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325837; cv=none; b=erWiKrBAs9vixKdoudB69O2tc1C7Z+CYH8pJe9lD14pmAa7FBZfnd1iAJfovea68iZ/7333thu+vjGCL01HUhI2LYhUzFjLoEqZhsyc/Qt7IuJ4eUfDUxorhP0bnBU/pNWcxPhzUl738KxF8lRSyaeLxAmWqQ5vVf5+hg8vfH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325837; c=relaxed/simple;
	bh=ot2ooccPgQduimVTn/sfPlBNaNev3Imd8d0arFh/060=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWRJ40TlVkEGcyz7DYVG+mSWyuorV9m9AsOf8ADioXAqHrdJxMj5Za2/DIJrTcl6KwMOKqGa47EP2UlbPNNpGbwdP1V8cjWyMSmuEP0Ql3Oc3tx2IzOpKSETXSFD/8aLdny7RwwrYmwLMJh1geeiNklBAf4C/1uuyXe5apAr+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci1pBQQP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci1pBQQP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954d383e64so5213765e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325833; x=1785930633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jeyxYmzwaVa+m+94QZq0khwAwHl6AtMmkImgnG3dqQ=;
        b=ci1pBQQPWt7L4/DiPXAFnoJEJZwbNWv8YbFcTuXBJPwtb5dxlR7cibCW5bI/eO6CuH
         tsWcd0Yz7IBovuXRgkem/tkMKsxcoIb55iD+KnKbf0Gud49NTDUbNFmFB0OEJWX0lixZ
         GXYnAg+i/+7YJIauBvjy6t7Q0XGJmKtioAxKRrUK2KnT/4vu3c4961em/Qdv9TgndlhG
         3UFjCe78ponu/1yGS3hqYVKwFDRlH7AwpG/yvXLZrTOFOKIaCUqt2atUj2zm8MD3CeRp
         4vNtLaaRtZPdMoNqOumwEH3ojJ9iGMpSPevnFw5l/yBsjvIcK0BwxUSHjOTnGo+0uZgE
         vTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325833; x=1785930633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jeyxYmzwaVa+m+94QZq0khwAwHl6AtMmkImgnG3dqQ=;
        b=kqVPDwkNepu0aSoDCVfZc/9O4U/5UiaD+BmN4cCeuBFahF7UGufg8sTDQTezVuuB37
         Vtyckc3QuoPVJtYIx+Mb6KW4QLO4KRWKx4/Hp25vVSXi9LC79xr0O5U6pbyYeszaaI9v
         uE4Cj4g+u771UFLn/j1w3wX2FAHefU1eVJURAVIoL20/4z4yvvRRMcOFeaHV3IMt6YP3
         taiLz40JWCKbewDN2wYLfrIrmICGTbzv1VXMCjHqaJT4m6h/FQcwxmWYuOFMoZpc+9CX
         /S2+OOw/DqUCKCULP1/cEzHg7N8dRXNhZXXMtrd0GhlWR1ZAnoNdAAqoMtlOGRchStXl
         dbag==
X-Forwarded-Encrypted: i=1; AHgh+RpjN1mSGaFQs9c2VlRuxfujgntOBLleBuGisXN2M1Bj6n6wlxggidAxCIiJbl4BeY3iav+1vVsU+rUN33i877RBVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybvcFYVpB8I/PO/rNRqGwpdhmLtHd4gpA6zi/QDS7wGjI2y9fI
	KiG/v1epM5T78mnxCBLSE22G44tEJ8W+MvlGMK8TAt9+/hb5xilIVGzo
X-Gm-Gg: AR+sD11OgADd9cAGiavIJ8N4nRoEDXAsV7gDxEUxKSyeToKWA59m9rLSHqr27J2mv6v
	sPfkgePiV/KHRHPS1yH6ieg2FUq3fsxN2fcCckBNNPg+7+T8DO7VODOMMTKgMZGVdWOXDuhPhSr
	cbDLGBZTswdmNvFVFDIqI45ORjpzCCeqeDFpKC8gfTSbU/JsKcnc/PgOIqx2ZcALmmy4iapvF8S
	6+ojTpcstG6hsCC6LNS9B8C58Q3hsox9KBzX6Tl5JhItnL8qD3gXCgRK+sAQNyYKuInG27CdhcJ
	gqrmezudxBQV0JApsG6PP99cm0Y6X3O3pfBUCqD6zN0jzhw5883GSg3uq2ilYL5fzeN8taYxPMc
	jzgMKqGRileQGm1GpdxQdPfICNoz9NUE/eB1CArOmzPUpM7+mh66IjGbSnDew7/l3o7vYWHsl8F
	wCrUO9EJ7PgGFx/2QZu9LoK5vNjHoYVzxfLF2VGN0jG0l/nGkO6TLnu6Fcnefk5SS+8a1hDAZJw
	YH8qhBC2PouVw==
X-Received: by 2002:a05:600c:5491:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-496c65aad1cmr84444925e9.30.1785325832980;
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
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
Subject: [PATCH v5 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Wed, 29 Jul 2026 12:50:17 +0100
Message-ID: <20260729115022.222340-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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


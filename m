Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395EF33F8D9;
	Sun,  5 Jul 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783256025; cv=none; b=H6mhokFI2Dk+4w7JvGPDWfCSw4GZVxysTw/jZosH5907RJTNAPSmeLPouXvzFfRv4Q0DHk33vBvoH/B8WR/AsYKDlMZ4IJx1sh0FtzPCZzLsvEeRVPTh9pFy/CgQ/aMkhNu/wtXLF+wa8476mX6maSDouH/eKR8JaesRHaZhbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783256025; c=relaxed/simple;
	bh=TTtNzHArwyUcJ6V6T3vEECmYy4VQ8v4+vftXgVVxzqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJyPikxIWTJ9+KVp/kX1fhE+FTTRECcCCThSCg9/pfpI1oSP5Rhm/raOmjEUU2FAGjpnMeSQwvQdXBkIMEzKlbKmkn/JODELpCSoEVEWCuMNaIJZZxqWN1MLWdQYoxriGq2O5jlWzlh/h1AFC1d1CbpZ7ZMPkXlDPvu2845ORtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HkyBt8GE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yb6Gz8Hz; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HkyBt8GE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yb6Gz8Hz"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gtS8v0dlpz9ttN;
	Sun,  5 Jul 2026 14:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=HkyBt8GEUigNtYGx6Kz76fT31Q/i00IxuN97Ba/amJhBbRD7umdCMp8M9VQk1RNcR+Ek0B
	Ng2DrdPyslID+ksmOfHfRJXT8UTEwmplHHYNGMebeZYmRlQCBDM0jWjam2MuIHTJI4Y77c
	Z6SGg+B4YcfPNpg8ZbMC5WedEOpsPct5c1vLIEy7Y6KhSH3KoN3TmvrkqyHgsZnzHG9nbK
	y7kc7dn775jLiKYx5D7ZYQDhj38mTGdddGOKx4IOI7YYTonzrlUdMfmQahdu0xaZPzbrty
	cjVldQdIbaf/6kY70UQ3+VR9zRlkLd17hkcIkKjAGfacDW6dJpebKAtEzz+h0g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=yb6Gz8HzZ4qBR8B8XAh8DqJSK+H6pMi8Oth+TdB5DelXAbIaTsG2kwo2qlpszBF4DGrwsD
	FRCEFeYkNKB2dAdev2GSr/NE5c9y04aa7axnycOWWb1bl1hk9Gn96zaa6aSq/XRtR1Hi5x
	oob95xfTkCkE6ceZEnIkYqBM9UVFW/ezLD7jX1lPy/qk2rL/klp9NwIVXE1s6HzUCIEooH
	Y3XuB+sQtstK2OCF8/jfyuRRjQxblZe2UETsBTdkdsVBDE6lObJvdOv1aTNdrarQ910L8e
	LB7hwN5QTR0hOiw/bft+SeIPexbI+Y0k7ttFLZXVSyRK7U0s3+PSAS+L/81uew==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2C busses
Date: Sun,  5 Jul 2026 14:52:46 +0200
Message-ID: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kyf8qh67uftqszxe71j5suhbdm8fs1bz
X-MBO-RS-ID: 88e8264257d96620000

The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
board may be controlled from userspace using matching userspace tooling
that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
and I2C4 to allow userspace applications to use those busses and access
peripherals attached to those busses.

Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso     | 1 -
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts           | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
index c730ef39c7d7d..6f10310140b9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -41,7 +41,6 @@ &i2c3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	clock-frequency = <400000>;
-	status = "okay";
 
 	pwmhat: pwm@1a {
 		compatible = "argon40,fan-hat";
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index af680290ce817..a6294fd32daee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -498,6 +498,7 @@ &i2c3 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 31 / IO_CN */
@@ -506,6 +507,7 @@ &i2c4 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 18 / POWER_CORE and Page 19 / POWER_PMIC */
-- 
2.53.0


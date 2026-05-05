Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DC3AEF3B;
	Tue,  5 May 2026 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952645; cv=none; b=f5o1sjwRh5cqHh5tW+KjGaO9ZFC9kL09pHNnAkGpgpPVzV5z1E+ifBVRsjyDcFTHHgyiyOi1xv+d0J7QZ1PwR6RVgk4dSJtBHN3Qw5AWQZBLq5FcWS+MSjdMvIHjDRrxVDOLbaUh9uAjNs4nLGrZz90Ti995fpXhNnI3/4KJ4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952645; c=relaxed/simple;
	bh=B7PnpgLk9fOgRys2BUSDz0BqEi+yzK6zlm6jlVD80eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3iHam+c5S+ID2BU1rCF0dCvNJKVmf5a5L+W/4qwWgMR+G1y+iJ61O2s8uBoYLxyhqAg3FvztflnUAvCaUdSGQU079AcMJ4svk09I8dqT1HZ1IH4HbiYw24A4KhZUnSm2fivjDeetsfdVGNvmEmXsK9IY7FUPP2hzYv+u8lQ7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WcNABeYC; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=med/3/Er; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WcNABeYC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="med/3/Er"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8krx6FV6z9tw8;
	Tue,  5 May 2026 05:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKs36l33LjxXtK5zLdlYl9mdFNuvitANVVnZZJYiHag=;
	b=WcNABeYC39EwaGQoBtOiBKb3MzgdaaQaCch2BIiP0UEljLH3h2H3IT2UXCUaS77ARufmwM
	wddITgUE3a41krWsbRSXJiHx50N7i8tIBPXf1XWRj9Uw9e2Rq+ScwNuKg1WhPY50KoTGlI
	xPgsatU6FjCdy86Bw1c0o7mhp5YZAXNympYXWtDPn8/HxFzxNb1BAal75+ergrHU/JuDzc
	jTQP9ZeHDzzC7vucx9tMGm6kQCGYCv4RSq8zF/VFJGHuaR4xc8eLDNk/Rx3TUrYAcKopV4
	40cE0bGQDHG331DmzznaItpaGBTBimUByhnMqrsQfEDB10bv4E6ies93x3t2Xw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKs36l33LjxXtK5zLdlYl9mdFNuvitANVVnZZJYiHag=;
	b=med/3/Erh+tT0Ae1dwGSxEX61HHV5X61QtYHRi6mEL7DWHjZjpT7GC6XYILzwvnjTQimfF
	9f/IAUNpGjHxHSbFgZ/Uuo0pamjjXss0a6Luxe7CRZWRkfEN3fKJA3J/feh7vM3S1ydwAJ
	ELD/dJirmiQs2PSuWFStmCLgvyPmRObb4t/jjldpz1bh4ouTeTkCmRdyegt+Gd0RHIm5MM
	KITxvw0Jaq65FNKIOK1Cy2jlDFL7ddlFpL2cR0K3GZmkB8ik8Lm/D64J3WgfyVh1VsKSZn
	ywDUh50oPNXnhUJFSBYY1LlsQcZyEQkbfvEUS+gYttBRYSWayivC3ZrZGa0mmg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:51 +0200
Message-ID: <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: orhfs1wfo8wtgrezgfwrexybbqgdicr4
X-MBO-RS-ID: 91f77169026af94cd62

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index b4024e85ae5aa..c5045bda45c33 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -169,6 +169,8 @@ avb0_phy: ethernet-phy@0 {
 			reg = <0>;
 			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
 		};
 	};
 };
-- 
2.53.0


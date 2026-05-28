Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48E33ADB0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951766; cv=none; b=EyW00ScxuQ6MiC1m74V/aaCx8u8oiX8XVQZvGXFaudcVt8JleYYH5EeMxbF2LyJ0xp4HNL5R3YYs2Md2WFtCryVZw2NmYER/Lo+KhSEIK5NJPIioBxHQZQavnJM1hYqZU58D+tnifNSUs2ipFQTcpnZTKYSm5ZhxPd0WwMoakmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951766; c=relaxed/simple;
	bh=Jhc8qUWtSc1IrwDFgxavhQukC6b4/3jebcQu5s1mIXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJUVqk2jEbIXueEuSshjVQBKik7C9kzSJzqFcBFXBVHT6aXFNtiuS6UwRQUpynLrGrQX5uKRZWLl68NrsCsXiVuTygeb8uUid2NLCR81ukaIApSy5+JzU/G9XHq58OO336Grhp3FpkhebDDe6yf8iIYJ/p/jTzVCWIfBWOrPrhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=km6DaGjr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="km6DaGjr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so130550705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951763; x=1780556563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27noQEsp6n6LMgwARN2ogBjiIyea81AwQFILjhtoHss=;
        b=km6DaGjr4YMG+M8bOXSuk/bCo+AiChLYk9fwB+bHbAj4Fka+AAqVb49MBpm5XlGUul
         cZTuvSLBiFHdwY/2peZCpC4GZnH5s8vYVpQd6Ikbi2CcPQAQRJOxFt0PJs/kxJznwvwm
         DVp+Jw8QZ4hkcHDGt78w/DUTLZVhDEngYSY9sN05NFD/JoJ1247Gc0kiYHUjOhXBfwwA
         xOB/U9yOMAunt/eOjLndOIBfOxxkraRUTVnXVqgLwsIB1QJwZlLv3h9YLEmwmCaj+27p
         pxp+088mXTwkFYHufgrKShDjDguBdoGVoKNacj6PTok50T9lIVRUzKZmTAztJS7yARSW
         PFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951763; x=1780556563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=27noQEsp6n6LMgwARN2ogBjiIyea81AwQFILjhtoHss=;
        b=bxUVu8628rN0FJUHgwke9N4KsIpIgpZjbRy9+B+D3aYjIAswn06KTI3M/Ij+uGCg9u
         gvViRnCeWyrCz6nMH+OchUiHHF6RNe+8PQWise7KEvf32xDdLCKXPSSYScbIDkXC5GIF
         4r0lPj5Hjkb6Jz/VPUd0exKrEY4Hvrj1GFT2jSuvxsGZQlCnj9Hr8MicVYaMT8C1Z/Lf
         1eaQRuVwowPPy47UxdIE7MoUCfmoCOD70tadLzKF3tf9TTxuOJPo84/Pyf/3cih2tDUU
         X2Yu/TUZwrSEUc/JTqdrih++hPmHz84cl8Dd7DMrQoruGEIPSXfFfmNcsmh6QJgHLXHc
         r/XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ODTGBgYJLvDc0vN4NO+vTbJKod2uccY1TKouuhek81dDUm0ycUoGO+TcuCzUk9fkx9k+7zhyoRvr1ZZwhzhrpwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OiKwS5HiRimFOaVBXW+eLacEYLwIROgS+ClGiFuL6dYKxpx+
	FhCSY0ovkfiT4bpqhS1q0aGG9OCI7aSP2XdOj/hQ9FEd7sS1O0gpN01E
X-Gm-Gg: Acq92OFX/eqLNWfpQ9x8Jfmi08eyIVn7YRbi1GVBU2s48JFWdhKZ2R54Xq4sf2BwbAk
	121MVxczcEJu7lce7vMpJM9sXgF0SckN4ASbmOZk5XexpbBNBW9rdc9r7nheqmF40qCloUG8Gud
	V/wHrQnGVlRvpReLCiW4xTSG6mzFzx+2o+DIu6QGfJOC38lU3/hQqdd65LGm0IgeMdLX+cLc8T7
	yq3zMt+KXvoTkX9tMAWKs3VgwDvHIy8/4BLDlwd1PyHFDYWnHCY5hnm/81gfsINPti0yUyFeQgV
	Hz++QvEW7nHDlxdGfNCEhQjfevaBlQUU3OdkZSwkqXU0+BPdEHqLii6tnrhy0oThaCmSaV0lDUC
	5ErehutopVxQGL5B9kYNd63iLnjJqvzJ+20FStJppcxhmRxfEpDYEAFf69mX/LpGpD8l6lmyf0t
	Wx8fLSIwDppE2WRi3vFV+bWCu70D+F44qzMjv8RSTNYcn2lPvTt35efTJJMMo=
X-Received: by 2002:a05:600c:3506:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-490464eae0emr410227015e9.15.1779951762470;
        Thu, 28 May 2026 00:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm28528385e9.2.2026.05.28.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:42 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
Date: Thu, 28 May 2026 08:02:34 +0100
Message-ID: <20260528070239.33352-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
USER_SW3. Instantiate the gpio-keys driver for these buttons by
removing place holders and replacing proper pins for the buttons.

The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
system during s2idle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated the macro value for RZ_BOOT_MODE3, so setting the switch ON
   pulls low, selecting SDIO {CD,IOVS,PWEN} and GPIO4 active.
 * Updated comment for SW_GPIO4 as it uses a single-pole double-throw
   switch.
 * Updated macro value for SW_GPIO4 such that SW_GPIO4 == 1 would mean
   that GPIO4 is enabled.
 * Updated keys device node with !RZ_BOOT_MODE3 || !SW_GPIO4.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 26 ++++++++++++++-----
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 17 ++++++++++++
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 0ae052238b3b..ef00e316fbde 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -7,10 +7,18 @@
 
 /dts-v1/;
 
-/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
-#define KEY_1_GPIO		1
-#define KEY_2_GPIO		2
-#define KEY_3_GPIO		3
+/* Switch selection settings */
+#define RZ_BOOT_MODE3		1
+#define SW_DPI_EN		0
+#define SW_GPIO4		1
+
+#define PMOD_GPIO4		0
+#define PMOD_GPIO6		0
+#define PMOD_GPIO7		0
+
+#define KEY_1_GPIO		RZG3L_GPIO(J, 3)
+#define KEY_2_GPIO		RZG3L_GPIO(6, 4)
+#define KEY_3_GPIO		RZG3L_GPIO(6, 5)
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -30,11 +38,17 @@ aliases {
 };
 
 &keys {
-	status = "disabled";
-
+#if !RZ_BOOT_MODE3 || !SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
+#endif
+
+#if SW_DPI_EN || PMOD_GPIO6
 	/delete-node/ key-2;
+#endif
+
+#if SW_DPI_EN || PMOD_GPIO7
 	/delete-node/ key-3;
+#endif
 };
 
 &pinctrl {
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 7770de2064d9..06c6ccac5ad2 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -5,6 +5,23 @@
  * Copyright (C) 2026 Renesas Electronics Corp.
  */
 
+/*
+ * Please set the below switch position on the SoM and the corresponding macro
+ * on the board DTS:
+ *
+ * Switch position SYS.5, Macro SW_DPI_EN:
+ *      0 - Select multiple SMARC signals active
+ *      1 - Select LCD
+ *
+ * Switch position BOOT.1, Macro RZ_BOOT_MODE3:
+ *      0 - Select JTAG enabled
+ *      1 - Select SDIO {CD,IOVS,PWEN} and GPIO4 Active
+ *
+ * Switch position SW_GPIO4, Macro SW_GPIO4:
+ *      0 - Select RZ_VBAT_TAMPER (position 2-1)
+ *      1 - Select GPIO4 (position 2-3)
+ */
+
 / {
 	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
 
-- 
2.43.0


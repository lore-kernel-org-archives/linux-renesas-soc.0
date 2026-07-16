Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE241F5C6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205292; cv=none; b=LE009I3B0kTlotfV7qHq0OGDPFpTUMf/nQWHrBLqZhxwlwZ6inzS8NzuTQEbNynlc1L7IQL0IpiVt8CJ6UmSno+FSH//XBugVANg2GhLULD0XUb2b65TbNanIXbLCeuBFJPjyu6NwgnSGmdi/WdVS8B3V0ClWPXS1i3pPsALmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205292; c=relaxed/simple;
	bh=LAeO8dJYWYKjZOE4b72ZYMIevY+gt9S6/2o3OOOJ24s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjEuzMvZYyxk/T7GqRO9zQB7dMi38RmqDhF8X1uYNJ2oVYHuk24v1ZBABOerTGpmCe9bPqqfE+Jz8YASPBsw0OjcjZ+Ncjm9645Z+Q8nX/pWc7DzjcwetHkcexVRkbJkYG/CQhjqM6N2qyZpKCZfQxmOSDijSxw6uDmxMOfZXWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myziPg59; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myziPg59"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so25594335e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205288; x=1784810088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrXyR15IqCRE9wmiui7ksY3rF9ArHCCSsOBf4Sb4Cqw=;
        b=myziPg59QHAOPigYDAcluqwCEgmDZK68/tkVYwTS581Cw9tmiA69zSoB/+16hDqA0r
         L1p6Div5OOhtbh++71aihdpjaO+xpxHz/egsEZxNO4JPaJcKlfBtMX8Yrvfu991JcDyU
         mI1gjtOdWUYb1qCa8ff8ufGm3sCAvhDNb1ZJg6MVdp3L+WDuCJqJjGcnGvS+BIOtSjFG
         U07p01d+z1Aipqce2I5+fO2zTNFJuahdVFzwHcewjVljwKO7GNkKsx8lYS/it3ykz8lL
         GeSx5pQApfR8D9GA09Mth39DkeKKdpWZ/lOWRXwIsZJGzxTcrb7F6sKaBgpxBeW0daGI
         A4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205288; x=1784810088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrXyR15IqCRE9wmiui7ksY3rF9ArHCCSsOBf4Sb4Cqw=;
        b=SZt2W9SUwT3MjFlsJ4NY+go/eCT5UT7/M2Allz4SGRF2dqqobd2WZQ/bO5cfde5nvz
         Y0bVjwBKfipq3yrHnB/8QqjB6L+eONN6+O8iXgVUNNmmWIWUenGUlY+C/XyJVhrsJZp/
         42AHyTBqoqk8MRPlmrDoDUN/U0MZiIfReWdAA4fXj33SNS/e1v3x3yh1BT1W3sBhJk64
         lDzgSAVND7Re29DMtPvW9XYulmne4zwmm1lt9Ll8W7HrPLZN+R5Oy6E7WI+0mXbtolrk
         Su2Qeg1dYzEjbYwQGV5QrPQQmAMMeFrUmsD0BgnvmHZGdthtvWVmOSuNKYaKJENKO3Ic
         j3CQ==
X-Gm-Message-State: AOJu0YyJ2s79mdjGaFIltpgZVpYQbwQKYNSaiQuCULUxQX+2nKZ5dXXT
	Du+PovFiC0NTd1/OzPSOcdw+21pmXzkXBHQkbzZR0ovgv22cwSdCbxDAJ+y19GG1BUk=
X-Gm-Gg: AfdE7cnHmRqQULkVPG7ZmhZ/4nyadmbx6RxnyEo4+qe7RX+p3KD4ZhmBpssS8QqJU/z
	51T5oqDQwNB4JTR00cr9+O4EM6YzCFfRRPe4UXNyl0u0S/JJGOAJx8aqKXMhXWUfW41z664pNi2
	E5cB9AvvkPa5/b3ItM5VW2ORGEpkNNQ3kq0zYKNmAwWjA+HGaeLundAPT/vfZJgw6wCSlk8nrGH
	p9o2JkAxZwXTOorrp1vAt4to1TgyS+ZYePVROkrY2dU2DopTy0asBgpdil9fDTTO3HWbAGwDCYM
	61LG26gP8Hh9Jr9S+aMvx6tVYy/QRC+cViiRaK+GQAMfdSWmXY5yBUcMr1UUOoUV7uke4un85CO
	GnJjAZiT2qIv97wwdBxmBTkONHUvoPJ9tzXQqIT4WFuDzQxgMqCsifP6vvn6AbSHqKc1r3UsSrQ
	rnYLqp+M9nxq7ZM72doynxxVFkEIOSd0wr0FBHQtHenkddV0NuzIWZZ47I8foZuT/a0XVdw11A3
	4+IDiYDs20j9ovnLPXh38ZpfZg=
X-Received: by 2002:a05:600c:19d4:b0:493:f442:3de9 with SMTP id 5b1f17b1804b1-4953c27e9cfmr71378815e9.27.1784205287531;
        Thu, 16 Jul 2026 05:34:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Thu, 16 Jul 2026 13:34:33 +0100
Message-ID: <20260716123434.2576253-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 9c45266ea595..7ce604c89ac5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8849BD84
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160084; cv=none; b=HzwcJ8AXlbOV98/0HGTwkGyKm97TkwDv7/nOdprBpwC08uSh0807T3RMFAI0Orj3+j0gCAF9BTlhfbR72B6elOL2uwG+COMr7d70UrKcrSrZwTFUDgRHDQLAS3PqMrHHp+S1MiAByupojmCuqFy4cHnt5vXyqCqRNWKyx7PT3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160084; c=relaxed/simple;
	bh=1lFgLtLwiG9ZlazEhqgrw6NCUNeBFzcT8X96+NwLVuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6yhFbv5FN1Yw62yrPTMzdiLsS5TRHAq5Ur+Se6oqRveFtdKFQfEi1azuChqhG04Z+rJiwPs7JIFiQPGM6YVaIJzgyC1eUwWDxf4Z8QIdmorUDsDavOfM5f2WKsNgBR6E5NCNKmQyamuLNtehV7/rOHA9mj4rUuBF7yxBpwuuMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9woJsjF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9woJsjF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso5704715e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160065; x=1790764865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLPiGOv8BG6J6N1wsKC4oaWQ6OSRmNQqyKq1m7eGBCg=;
        b=f9woJsjFIC+/W69h3fOGepQxMKPqkIl/oy9U8WCqFxQ3EVNem36QDllPRbko/dc6du
         U2WzfG2L9cfRpSQkxHgjjmlAmCdNowP9eG4ufKNyG0DaIkkUgqgQNHwLjM/QTZVY8gig
         qpyqFwEhi1jlJFOZDCHzFULs2NGZqOiJjalaWMJUDpNlhMIfq4/btRB+JdRStZDTRc5D
         0UCey/LAoqdO+enMUCOe28Ueb9G1dm0l9KZ85bgP8xqaSAKDNcObqcbpQ1zbsR8VojjX
         Rw8nqV9wUXGk0hY71AdMnPz9Yn7bHUrFCMTvoudegag6BgSTfiMZZXr7KVv53KSm+Ujw
         ulPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160065; x=1790764865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLPiGOv8BG6J6N1wsKC4oaWQ6OSRmNQqyKq1m7eGBCg=;
        b=EL9avxgzcN8OZDbs4+x/fIRys8lw8WQoVSIIOH/d9GS2LgDLYLmVt7MvaNoJh7ebeD
         yoQDyWaz4dgvADB3lxiQBKobQ+Vj5hfLkjhDIALJ5Edx4waspKvttapho0HqXBriYEU9
         DuJZGD/OEl8fU5CDjr4e34V7oan7wIMMEHf3xQIka4c3ZUQiCpDMug6Dg1L4YIPTnQFI
         cihwyruKcFcJMalChng4VdsSx9kj3LMIeqzrpgH8N9rl0gRRGdut1d7IQKo4mydSNyt7
         YpXSU3F5VQ36VWbrB1fOfpnVRE0TEHkQQJbAyWO+PzLv1X46/HtHzE5dqczVOzBUyq3w
         CAiA==
X-Gm-Message-State: AFuF++lShF1JYVMFcjIp71BKeovXj6j1Pw7qiuk4Xscp+gTHP6hOl540
	KSV1OB5i3RAt5mj9NSqf/AtnpAM2CYY+sbLEYmv3fwrTNl+P2qL6L5p9
X-Gm-Gg: AYBFou33VkpABT/bo4GtJDIm8rkI8xck96ZPdAQIZ6yiZAIk8hUY5fItAkXIHUDm+CG
	ia1xCl2hvXhkRNNbmxnv0ceVOFxfk5SAWBgKDSfXIqj3C6dui+zD06FIbyi2LFCi1mXNIX7rlBZ
	Ee7APf2AZHU43y5Ds2QBlHRruDyYBaWF4ZKyBVBaTNmfp/Un7+myDHflk24yRuSiMxSjt/LjIvZ
	l1wmght6b4AnEYtajppLjVuW10NbEPbTpDW5zAjuk98152htGFIf7UWCiYTb8cobv1QivWQ48As
	GoZ7hDcfrto43qUp5wT5vI7jUFr6apYpW5x5qUuwyFp7IeLh3BtCwFyi2cPKW2G/AqLEZR3P+ba
	UgeD53qceWWwRzUp4Vl+FG/3qiBSLSpBNyOW5b0Rs8jhOCvU3AfO9nVViFUSve/CIreIQHoDp+K
	7ybzeZttsk4DcwO0kyupN6ydJJs4i9fgwxtZBCz0ShFSfr+59NHWYB5HVpBljuDdL3RTZc79bf0
	zlS74fS/KCPuS+qNqm5w3vKze6NXiqa660LBtzaGCu6Etj44rHmGi7I1HvuzyzQAc9ve4zfIPgg
	xUPjNVol
X-Received: by 2002:a05:600c:4704:b0:49e:799e:c1c3 with SMTP id 5b1f17b1804b1-49fdf12d3dbmr24470955e9.17.1790160064510;
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 23 Sep 2026 11:40:53 +0100
Message-ID: <20260923104054.3324830-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 674e35e4f242..18d748661a60 100644
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
2.55.0


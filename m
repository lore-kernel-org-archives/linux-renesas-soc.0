Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D679404882
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873539; cv=none; b=BVICI8CUd1zdDrDn7+ZFwCTcjL7tVjRK9PHaaKmvtkD7OdAzvcKo/emYMrWz/MdISXO3CfC48jM6s84hsjsVZ7ThOwuOr1sOg+YQYlPlraG8VvF9x66nzyJFSAbvZYgqpDIseVtTLjpL5NNai+ua3z/sMAsMx14XFM85U7mK0Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873539; c=relaxed/simple;
	bh=/4c6htHbY/+pTDzTjgO76aMfdQ2UmFpC3eU2LEDgX34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D97I7v+dmXU1mOjz3EVKS0IPB4I3B63aInKGdYobXuwWKL1Zawjj2gyxkLnQqWfI5OzIxnqG8Nwi2IIMGsgB9V4W8kC5t9UeT9yXdXQVcbaP1pj9wQAJE4MJrqLM8mBLM/7U2h/gMBil0ycswTYE8Ju3dA2ranAVMJum2yQBpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzMnP34f; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzMnP34f"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso31493665e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873533; x=1791478333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=IzMnP34f6Ei8y7ngpA7BAVCYcTb3gBGSlJ3Byb5HRla+bSIHNqqtClj6gIrw7oJSjU
         wfqdywjlQ1xuy4g2f/jxSFWfrbNlGiVxFb4VzrM4oL8UNHbX1QgIbXaJVSdPBvL7jnSW
         E4VFZRUJS8LsFxeQfgFKOSpcZuE5hKrKPufMGjD8Rwcpl7rzIAA1qMGQq4kPX45tO4ok
         K84ZlfmLF+qYQ8YDDkcb/3GjxaKVHQ3o3ZDi2KZE4jnu7ptO5S/sm7XYE52xDTPIN2j/
         gnHHSnXUpkmZGkOlPI9ugQxEG11MyfIarNG8Xkng1z/posf+7KFFn/C9KDiHuHyg5f92
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873533; x=1791478333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=t01r9KUnGv4uFMDcEsXZM6soOzxzflKjwQkBQFwLtrI5oi/33wtesnoSmO1QfQvV6A
         tgrBRmcPwtJArEA+XXVhvFl12Jd1CZscVv+MrA6JGK8410IQZMwRkhiUuY0GCXSBithQ
         A9SaTDljiCQZmWmebmCuW8SuN/u5aZE7u2pd6V0wr3trmRQ2Vu9avJKhn7SQqP3Gdjnt
         H+Ika2mV9BgcX3owtW8xSVHxCe4Qc9gbr7u42hVIa5TZeUJ1fKtwuvwCy7ISAceS/Frr
         MA56HKyR+KYCh5Vl2vL15hIZeYtxiwyK7vDIUvrFokR8b6nj6vlqt+gsm07z3HjMcByj
         qBtA==
X-Gm-Message-State: AFuF++lYtmijnvAsXmX2EGkNgsV0ICzt1DMSBsHCrZtDtLLlQCWtVlUY
	HrBi2f5zy8GjbBRyKF+nfDuxo2EfPgpWf9i/TQY6Xxk6ZOTKEiUYvos+
X-Gm-Gg: AYBFou3gjwZxQfxXlzE0/BlSmw3vL2fGEOtqQ/1l3dAhHU8zsweryU7IXRorUl11FWi
	+dbGMhfv0NrxC+A4UhBMvQu6hNWDelVWqWhtk/cjuSJ1V97keF4N2LDcq4Lhrzs7cGVu1uQ4nmM
	TeOkSs2+g+dcbAFyMboYoC5+7A/NA2KsnzZG3ucc5PB6/U9Oe7QjroQCJ1Tz6yq68PP8SZTsWKv
	4EeiYFpWz9+RP9vAKf7O/mS/gUwMbq44nuFO9F1l6BAzPP7sDYge2d/D36jECsb/JeMHj8//PAY
	ORaR4y6nD/2LNIu2e1z2BBH1JLcv2zsqouoDq0xPMG8v5NtLnbuSrA9deEQc79NcLlUVP0qAEUA
	4J6AWQS3RzRhNeeph2DSbBG2UFgtDDhmG0/znPHo57LNy9+OdyCd0yS+eaefw2lvBGnb72H6G2E
	YvAgiYmFSGnOrKFCqm13suKSYz3th4gbJwKDOoX/2xdQ1lIGOJnWe2LwJElp8T00U0ynT27nb+Z
	efeGrzKQJGLb6S49RFi0Ml5gM4hsg14oeUeavuWL7DSNPLtJrJxswscE3hx+pH3meDU40QgN3q7
	wQmuRh/e
X-Received: by 2002:a05:600c:4592:b0:49f:ffc7:2099 with SMTP id 5b1f17b1804b1-4a0276ab7bbmr3757495e9.26.1790873532595;
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:01 +0100
Message-ID: <20261001165201.763882-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v7->v8:
- No change

v6->v7:
- No change

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
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=q+pqsrdmztG2IQcvfakdViptAQydeP7qnuyolhJsSs12w/QBL07uOx+pxdyXfjKJwE6T
	 u1rxkAvsMxpF0gJ8JwNfn3D96xLzxphhMA+R3hwlQK6bRZq092KS6uVXePzdqbE8l5GTr
	 4D+dGN66BQ9RjnYc5kkLYoTppj3GJxAXJxrMJeLqk4Gu3b2VMMkKSiECeaMcv5YnSkhNE
	 vZPRm5hPmUHJ++7N360r5h2ymLLsCg4hiuXVJd0dAirjTzc+3AxtgMmmEUhBCY4U5juK+
	 na30gh2uxPE17T1PpIlz3jcbnJWiGa5ZIsivTgMVFlPSDsiwo26TJKNuks4wKFdJ68w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
	b=WG6YK6r9WbP9vGwewgaFXNxPzA2Po0q4KPyIJKT+hZqh+TcsmRfCDOZXBVujnAlYqJ6/
	 6ghWl9kwQoNqI3OjrrDv5tDocUdvnVSO1MnoSWMUM6b1wWkINJclEFI9GTIuGoSc7iLgE
	 UXue38yInrMAXrA/PKp3xYUf3L6paws8pdx2ozvEUcBm9egUqLYNCk9aPGd1/jzR+B3jX
	 Yt0j2l/rKnZjfaZ9REklbFIxxzXCkzSUAc7D/j6B5vebqcTiXEApGIP3Pyi8Fz4XBiCEY
	 bI/CI5DFpNxsser5fW8p1w+GwBPB2HqPjGqHDu63u3kwriNCCY/wFY29IKHLMuidX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77845606A888
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77845606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so37233595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395244; x=1795000044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=hZbazZ2xx1xzRrcV2f+dFJ2skZ2Lu5V8v37Yd3xAvwy6+zV3qt9jdA3Y51aNt8JDqm
         GB3STnUMinZtNkXoIyPF8xoVeX97EPsffn4uNE82NmBLDRD4aP5P0ZdqCIqzlJ/po07W
         JI0EJTonArtRGK/2hss6Oy5v4S0jOZfaQG4TF/mDN/CFY0IUR5kvAJU1SzPUgqgyhOSt
         1AlzMu2GjwleFEAw7pmj/Gs27zS2/hbN0O1lLNWiU90tiL2wehYxPCWopVqPLPevXmeX
         pTkEmOetKS3TYYcbXr+IiLbI5czzgttJSokxjR9OeQetqaDWVkpM82qBMB7cbSQi4Rof
         jAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395244; x=1795000044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=lRdecmnmhQeEVozai3VzVVDZ8oRoPPrAhNuE02jqWVBn18sR2xZY1lAb8zUEr8lz8u
         nOpwhHw8c2KS8KdP1MTgWsJRPJbfqoACDq/o04o6quArDQNbDufcBm5fNekvYJNhtKUz
         tCZaNydDCOKd+lvCu8wc8zah5l7MWSMzlvOYtY0oXcdBpdG4NAtsFUOhgRsdyxbZLWnk
         xKcMIU4869zNjyni5egrL1OP6jrn/XufjFCDvb17AaoMfS6uB+sAP2zC9tzKxDSIhniN
         nGLerTsoY2yqfMlXfYn4kRrjDW6wqNE93yTurKgSh5P24L9gNLGNbu2ppa0ovpgBFrhn
         0AnA==
X-Gm-Message-State: APuU4Z8JMFgkTNsW9FzmfFDYAHWv3YcMg2kw8zuxUXO+oTdE+KCrbK6w
	wIa9bheZdQ4LSi1MaJWt7xAqnpBviXxaSavwxYt5xiPhK60H7opwhyEI
X-Gm-Gg: AYBFou0oPbzwvCV7e9c7SbvfUmoFchePu0RJ810DNhrqiyG6TQGtR/WDppWRigTL/e1
	hkmdgkHKESPvlRcuCpgKT9qo/J198l5aQXCYGRNMJh8zerDLijurvGs+FfNo0YPTT20H6mpdFV/
	Nk5grVZo48JaA9zk0od0SO3p08tRMxrQv+pC+LvR8z7qIiCbF/Q2JFTM/fFX9/3DlTmu70/YVVC
	o9rPhxWp6q7uFg5Qy0rPATTlE6J0ezaEVwEmqtfAf29F5zeIcdnO/DTpELY5Yu7r1SC5YGP/xpq
	a4Kr0KP/s46ncJ4CgC6bQOHNY9l8jr747iDvhGE1ZrzLEJOol9SvoVco+6qSczpkosS4+TpNRtj
	4sFgE8ZutnZ2QN4ne2VgCFOczVwgRDBBE5T+9iQ7L6zsYYPSKArVooF5n/5sc9+HBBmURTVUgf7
	Nf4UTlpB3M2WbhGSiglvrOwZjUJyDB9JRgAR8H+bLrFJ5PMcWG4QDAskVJVm4rSs+O5aUlOnz1W
	paQgvk2gANz0qV/ljctSPdOceKiA1lOub4wnU+IM425U0AN1few+1mdXljY2OBkP2tkl02nfklH
	OWw0IDo+jAqD4NCeI+yQTD+vnCEQJ45FUrtNGFmomDWyt8RQDoIXCNYty7HD88437Kc7+ZDJnRL
	5DGQkw9xuxTb9gAkkhRQsHXf2G9Tea3ngyDQAWGPyxhJcPaaIlJj3LvHq0+y0678Q+PyaqWZMGL
	yx8I8ZH5ov
X-Received: by 2002:a05:600c:1986:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ba09377221mr34575625e9.9.1794395243848;
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:06:59 +0000
Message-ID: <20261111110700.3331225-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
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
v8->v9
- No change

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
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 258c74c57b75..472cafe7d4b2 100644
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
2.56.1


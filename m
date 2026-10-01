Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0F4E0B8F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=rwHHtMj9CVcLNWCWXz4/3QYFblSGwYbBlW2dcmIO/c8xDpWrOghiGKC1dVuckyyZPZ4e0S2Ids6QOKDqjKtYvyWM3w8Izmnji1E0fY2IpdeVtBAWuTbF7n75su2oBRW8AZW9DUHR3PhcJJ2WaDBQcCql3ojqR+5ZrHbknh6n/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=uVcGLMDH2AwPjF/HVDOvxlHAEX5/rPpj/bHGgZgWVNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYVifDx4Hx3Hr0PxKdLuHVc0Os9nNputHtgp0yFJBzUpNvABuf8+71rnTBt++rS6Lfy5RLMxbsrmRlbv8eVNQ2F0q7rGXkvRDJ4aDyusgrwuOuIXjzqaZwvo06Mt/YBDZNjVNqunqXhFktIJCljVscZKQH/vF1MtBWsqhQe48a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azg/RB6c; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azg/RB6c"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so40802325e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873532; x=1791478332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=Azg/RB6cGTpZBEOhO9oYwMk32uwx40dpZRzVXFfQ4dGSiD8/4ab0LH+Ij5fXpdfNPQ
         /195Y1xRMyTVQgExxl9qgMzhhE/h5JJoRM4gWKeUsRLB7HOzmDaRYhyoJD7mn9p+dqF7
         UP0CpyAvd+k+QslsWKb1Loe2X+E69308sW0gDP7WfSwfWny40SsUUwZfexPAA6Z3ZJOD
         dlKoFozHYpLX6BFcRfynsFyVS/3fYewaXpaUHmR+xUVmkKcKdKMG6f7zY8tVpN8j7kjr
         vwbKZAwa0eaQFxOgK6bSpVWfKWE/lbQ3A8Bv0pli+EltNn/kEBZDVZgl/7su/DmvV2Rb
         u+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873532; x=1791478332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=kMCxFauyctYIQaGjgYGfeDapFLXcQe7nWuNc4jftE7LeOXSbtyvKWOWINWYcZHW5pp
         HYpDgIerILD+aacETbzOBLhLHgdsX6h8TW164DuWSamILjRc4mSWSIg2TSkxUDy3ru2K
         P3a/Luh/Z0UaumpsnnZXckLIivi8OLHAodrFOpiVQT7yn9ZyzlTyNKf2XnREGi66gc3a
         qWv/Jrb96Prqpkce6DbCgoXozx4MMJTGANmbKD0SALrSQhNxX7QWb0KP24cyqWBm94TE
         PuYt2pahdOz7EDNNgHPwKjZcqPfN3nX3MGmk76mLVFsuy76eNi+pI/yjadiXMD3ih4m/
         u6bg==
X-Gm-Message-State: AFuF++mEJ+jI4FdumTj3zIHywuZgvnooqn92rlrX2iWtdX9hHPgR8JWD
	FnRT6DbXJ/A8jQcDOn4n6hWF6YQ6DOt4Uf8h/g6WT29w54ud0xcq9ggV
X-Gm-Gg: AYBFou13UPNt0UcpR7GaDNReSkaFBJIDJF0OjsuB2J+uDzN+tov4vtXxvUf40f4iYDy
	Z0KUFjOxVZbjTl3o6sXzcbq8mlqsoMcGMl3AdmFVrd9c7G+2YHaUgy8bZPtrW1yIj8HicRzUnCQ
	c9aU+Zfh8uY7oT2CWfknLvpsCvCfSX1nANv1Ujx+6nb6E/DMJDSPxePfcilf4yHa1/JI5lTApCD
	H0N3YZE4WzCNUUdRgQHNWssikkwIrNVpc2rRmjjZgtDY8t/VsfNeGNRPyL5XGkVddAaGT+3QAyY
	uW6UC1UHXlWdDAcA5v1H7ER7bXlYDhM70yDT8+4z11z1NP3aa5x9Hj1cfR3xuyqEii/mtpFNsAx
	uOOyKS2m59QmOWZboqSFjq3PmqMLbXvGui94ncl+2kYuzk9wvZoYrHXcJqE9iuQTub0pQdpj2em
	NbB/YNBFrtt7HzejoycJWgbb9KNw6LkvtT0AsnWA/zhSR4XnV7ofLqpRLgQyilVIaVL4eGCSIcx
	Q/QRdCbZBIzS70OjOuMzP5Jy/XIMV5meLIqInve2fFcJuN85caQDe1dDMrcmXaptEwAIHJBGOEN
	xG+9eUNU
X-Received: by 2002:a05:600c:3b1d:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a0276b5d6bmr3767235e9.15.1790873531845;
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
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
Subject: [PATCH v8 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:00 +0100
Message-ID: <20261001165201.763882-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


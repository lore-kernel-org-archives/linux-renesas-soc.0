Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2A3A7582
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558404; cv=none; b=irKN0CM7KobpbYPti3uSmCK1B5mhG9KDqidjmW38+N/6kmC3F+0QTeQs/1vylM+YPPjHOc6Xw19fSgkJUzEj1RbioE1brjtIOPVVMNK5XX2KIS4OI1U5Ek3m+s2Ghw2xMjsw1aJPosKuB3lglGfM3BhAuFz+FNbVAEDMJQnsF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558404; c=relaxed/simple;
	bh=xqQ9VgRdGKzpJILJX0jsyXyl/q6X+3j8xqBdKhoxWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG0hGEE4ISu/UvjHY3MwGao9LKwAYf7Q39Eto2MLBVri/4VKHdIOT5W0YT7qn7xIO4WyNrm2eAcTHzsv0kx/CVIPh38YTE8kh3Wbpl5g+E5CK/U3O6u/AVFoD7+UMzp+CdzUWeVZ+RH2kIAn0zrcbU/bIrSJNB6EHZnLtMKnx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efMY7BO+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efMY7BO+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so4187927a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558395; x=1788163195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jyLDP3AZuhAYgYy6LRMaUUAZeFv7rhhN8YTWF4FaUI=;
        b=efMY7BO++Jt/dTvEi2fKwNtK+Odw5aDPPJiQWQoQQpN1xyoXzFMN3pnI7G8sxv0ejL
         ykfsysX+r1Nj56KeN+GMynWybuATKxCO8b41QqNtLoakQop6qZbFJpaR2GC6hbBMo0TG
         /NcY5IGr0TfoqmC7TryRg9RVyO814O6lwwP3MKdESfoRhJNV5mtmePkh5zFu7jnEnY1/
         zkfB481QDZyoJoWqWofBFo1jTwUcP314FY+yR329iEm/NTC2O+OKcRqc1n23lsxyyU58
         ae7QQqh+8NqJ5S1Yr/IheNHPNFsMCIKbr9Yoq3levvGSYkE4CYrYctWMlNOhEPJqmMuR
         j0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558395; x=1788163195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jyLDP3AZuhAYgYy6LRMaUUAZeFv7rhhN8YTWF4FaUI=;
        b=HXHnn45m6j0YHSR7/mb8fybH1P2RY8wJ3957JMmZP/TOmUlRGfgKAqy99RDiEBd3+N
         qqdR7mT36KE33wg8jVN196WlzhNUDfmzJTdmH5ROW/A+3F6yhhoc0wAAoPNcBgEjis+/
         FVuyE5hxguI4ZQTgpQUK54ONNmOvv7Kkt7SqQcxad5FAjpQn1oqUBuMP8T3qahc7FMZb
         7ATfCLXH44a0fOiG9fd9cg6xM+mcEDs8SvcB4rwCvRI1gQR/xXmkcvXoFMUX/H9pbWV4
         GOcCg07piIkCs4GqQh+qMC8TnR3ixY3QgaHWhHOtzP1DmQR4TmX7689Ih/cRiGPJSLs+
         fyFA==
X-Gm-Message-State: AFuF++l+8/d61mCg0a1TUKFa6VGHuxw8mBRydqQAcvqKkoj6J6mHheMN
	J+x6DO+NI7uMhZjwwKt6hmP52q30y0f/Kl9D/wGpdFhFxd2nnkK7npbGewkb/TKr
X-Gm-Gg: AR+sD139Yhk29hPoEG4gJ41Ug82NYtfS07RKaEfX75gWAOP/Uk7L8Hy6N6BCW5FUJl0
	l3Uo7x2KckkslC5omELV1SOLlgfVBdSZj5mvBvZBX6AUX/o+DzZF4K7Ittwp3bFTLHUnioQ2J8E
	uxwG/W7Hl+nJjOtvexOgP41MGKUOaQLwN9hjSIQqkGcvlBkCsamy5iW38mNg+lGwVwIbI9jh1kG
	DKh60r8fjJGgNuOaFAAnEkzb0Nc6iiwgjr2975EvKHRAXW9nKlzQY/tDJ0tyiiWdChQuq2Qo/sX
	+rzQ3w3kjd0/y3vEwoCWynMZXL6V02MKKJkFm1UMEmmnCsd1Ew8udWZ9mUjW6FX6qwHgIKGrcKW
	1IOmnOR0TfikB/CBPeN3tcJsGktyl6zUF4w2NEfJbuqOUBNdi3yCZmtBz1aMwdseQWyxmbpEtUE
	PaiBzKvN5XvdHZVeM/JowkL6TskHzdv9i2c8OViv0wSI/pmBbMovkFQj6Q0BAWKoLbFOt4t2fbe
	vGse9sQBokM0hV1uQJl+14IuhRLOU2/C3YKz9pcXSHaihczdrCnXLgPZdCY5ert9PpkW819
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr49453936637.2.1787558395066;
        Mon, 24 Aug 2026 00:59:55 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node
Date: Mon, 24 Aug 2026 08:59:34 +0100
Message-ID: <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Real Time Clock (RTC) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index d5eafaf23e75..33f953c110bb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1173,6 +1173,19 @@ pinctrl: pinctrl@802c0000 {
 			power-domains = <&cpg>;
 		};
 
+		rtc0: rtc@81009000 {
+			compatible = "renesas,r9a09g077-rtc";
+			reg = <0 0x81009000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G077_PCLKRTC>;
+			clock-names = "hclk", "xtal";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.43.0


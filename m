Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AD351AFC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679062; cv=none; b=eSNt7CjoO79PqJo2Ad/5kEnUlbpOkeL3rhImOIpF7zhPiyqclbshBH9tXUAmUyEc2M8IlQDpNt+I1c06F/D/IkcyHYnVYUeWdgHeLXcEdQx88QrrTVEyHhoZ/jE96YtL4IKvtI17M4UD/pt6Rt/z63ZJUP94zNXRyGBT8xKEfjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679062; c=relaxed/simple;
	bh=c8gFQju7qYKoJ1DhysSntnpkgdrEjZCiThpuf8nIj4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEdh3pPrd0YslLk0HjhSil1K9JYkt+LpetyixTB5mqHMS/2ZQFJpOfc1jiH4oWrGHoy+CIm9qAWwFHXivxmJY475vUPO/7sxednV2rCaXcFMZRxdP7Ap4J95RB+j/vkFu7+lUhhDaKLG84zuHOXq4wUJrslIbCor5fnppMsdRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD7MS1Ws; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD7MS1Ws"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so353379f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679045; x=1791283845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ayzr1Po0TVrNS9uJonSH7T9Z1tDxQXM4xxoMfibzG/o=;
        b=WD7MS1WspYvkaVJBF6D4etN9U6IPOhsMLHNHBUY/+z/7W2Fnvw4QbwTm3SpJy5k/Oc
         HTi4uqfyt61igi3/669HmfQbeqJKiWKJ2XBapXVkJ39aZwRk58J/uKguUcJboMGDdI2V
         TAPWgrfCaM6x03lPQXKSuLc8piMVIKtJ9b/SQj/Lmp0wyIccmc4Sq1BIe+sWUwLkG76R
         74W0XT9EXgojs3lMkwD4XX5Mx6ziHVl7L4ScDIu11OAMuHK+xsOJkV/w1JsZfPr18iQk
         oemScT2f+MUZbCQI1f2TjtDKjRCCNMSJqkH+fN17nh6U/7K8meRn+P3DNys8L7aerFOt
         MRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679045; x=1791283845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ayzr1Po0TVrNS9uJonSH7T9Z1tDxQXM4xxoMfibzG/o=;
        b=k+rEBRMEfGFLvSZHFPpkY3BPd7+4spFN6H3Z1s7jiUF03/yZibblYhzA8p8P13KMM5
         OLk4SUMS+vpF4j1FFahllLkoeQzZNe4iuEdlgVUUwN82r4chht8D/+Uzi5i3sSVJmv6F
         GHG/HcQDKijIRIvp2uNBw3Uae9E59jF17p2zMAY4V72fQzfAr33SuUZi4rN/MqgEsas7
         mB0lS2XheNmVknvS7QLmC/StNznss9tI/K/JDl7gOIrZvhZ+G5zRF8YfY8FK3S0BZsxi
         jrNdcaAFbCrcPGC7dE/kAHaMdOgTIQa8V81Qvr0Sd6Lset4J3b7nTDSNqvhpdhUX4fTr
         0N9A==
X-Gm-Message-State: AFq9FYL9CAIvhb2siAvRpgSbSmQJ/RB8BsgKjxsfEHSkxjlhcajH3tvp
	2/RffRHHcquJsXH5CBzFF4HttNX4fTVSAsZxdKUk8ozJKFhgMqxRg2UN
X-Gm-Gg: AYBFou1NdTpkdsDPd7xXkUhL0YDNw2wRud6WaprKQJbUpo7ZXnCsRYGOknWtVymxksM
	mEUEGxUDWpEE5ZFTPrMGZHH2/lGSjhu47qxoAOrKdoGcFJouU67oerEi2igyJgbzhkHP/HeWMT2
	WDUXlcyrYMtv1Z8kzMD91DuF4XubvEjFj8XG58Axwl98dd9VOS0/ZJQ2luksrjgODG9r0pOmiQl
	pzdH1iFJ+tT3X9eSUScH0vUmC4lTr5yCW0Q5z2IUqD80wSiDRjzr5jr0urtYuX1vMTrzbvw1J27
	dkn8Ps07t+hkYQ63IUbbdAdkwgy9b7y67B2J8OvANn33zuzi2kMBZzjGxrsfQqmOaXc5MvTTpHm
	ESI6d+kvDvlwoyEiAa4p5131+7opnlNtHawD36oHFxI5yaYmy5XTjZ0Z7RlkSSIYNa6Cvw6mP40
	PqUtXyonHALL6TwEkacsO0HjYoA19GJJmgo7YPyLwRcd7fFG+WgNvsUPpi+iN4eU7eC40uKCXcr
	5qRPcn2V7m53g2jRJp29dkcDIM60iOBhRYVvaCXXYnzJz4pOR8OfLCEK6oPkMkrISRIZI2N32u+
	uF8PJdSpFjcYFJMQ0Q==
X-Received: by 2002:a05:6000:4707:b0:488:5fcd:c1e with SMTP id ffacd0b85a97d-48872a72594mr26255356f8f.18.1790679045215;
        Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
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
Subject: [PATCH v7 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Tue, 29 Sep 2026 11:50:20 +0100
Message-ID: <20260929105021.542730-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


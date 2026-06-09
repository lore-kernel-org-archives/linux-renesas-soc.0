Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96719CC0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009688; cv=none; b=Af8WsKdYj86O+pPnSCiw7+ac6URRn9bcL7/t8aUFhh/BRjiYphS5ixVKhDJLeSZxuWcQY4pkkug34wD4cIqY0yb8p8Mw4g7cjgtiSzjwgdxPcI0Wba48+Bsa7CSH051ynaq3YSe5iHImy/Rm15eqe3Ex/6JINV4ruWtO2FgQcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009688; c=relaxed/simple;
	bh=jpAzcsar83RT/yJsgZz3cbdGzD5XuyeMnf3Y+zyOldU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGpDFJdAORzUrRNKo8HQzQIRY6blHmGotmA8rSxVef0yDhFZXfeLcxDackmxy42uTJqozXWWCRuP+FzftSwwt2fulVavx5+o0Qf9k/v9IjFwMeJTKN8c2YOV5yZ8FpyM0OlOGtyw20s0Jc61uAymC++r2nPzlEYnzGgToKKXAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDfl/XTe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDfl/XTe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so33061935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009684; x=1781614484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=HDfl/XTeZUCD217RLs54Z2TKrKBvaxJreTkz8oicVKPk1NTpon9CGJsmjb2yzoqwJY
         ozoojxieVtq5KZgXDzqOJXERCu2H5EatEowNsGAQ+8a55cBvvgJB24z0Oc+5w6Z6ydsz
         EJUUKjdtxdy+f96ubUCm6InEJkNbLon0lm2y1tbf/KAcnO+PhoiHSyZJ0jAgInQEIsxP
         2+4rds7G2jIfncw4J8yMgmJn4IUamSi7QBJMPL++xqYaGhJbz8cWwAA9fGYXBl1W0LQK
         Et1ThKe/m3U4NojyJz4q+7eYuA/YCe+cJKWdLxq8Ds4Y74mBdZsMyemU8m5OObE0gxqB
         LuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009684; x=1781614484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=QutdFtsErdqvc0HuPZyoHSkXsKilvNSN0To1CCIYggCDPUtXvkUpyhB93sYehJAtic
         2Y1WvKa6+kGKsfpG93aCvLS3R2+gtT8solCZ4+H1AvMbPv0q7PiQzSdUMtH8jRYbqgBl
         zMWNrEDw6TiCQe7yoAObp77Apyn44+AAMw1K5QQCMPtTEkn9U9zScVXGH4Px6n5zK6KP
         GxefKrDrhgFYrmObTdAQx8wy9efEkYfjSqzEfU2d4OK8PQf0oS1ylFRrByuV03E3fiAF
         24A9rLXpeaf49ghLCXNTaFOkAAetyVqC5QkuUF4x7VaeT73tyX//E62ZsoqOjeBBAA2c
         16Uw==
X-Gm-Message-State: AOJu0Yy8GjXKB/Ymppwiyq/a3uHatQaSlyWPGf8qW0Li05g1EUZzFwI+
	3dhjF0iyKW8AfV3kp7JX34dcB4MNaKYM9P6yZY4h0QiR9kIM/WjN7vw4
X-Gm-Gg: Acq92OFcUdFFj9obUvRdaPDmiBctsfRBBIJ/Vxw0UNvkgK1U8ocj39XjfhM/KzK0rwC
	/lbiucubrfFG8uvAbWqv5FbmHSKQ49ZYBhQCaU3sqVbDoOVjJYJNhD9LH502f4Oc5wGZCFxKFEf
	sMUa00yrYY944E69r+DWzLQJA+CuFJHiJvXZhbuxbjXHqjJuEFeOFK9WaXuhMG/Zk4orVfuBqMo
	hEQGdBWXNxTgrVJnz24yxU8/ZA5kRhaIw2onffqlRdx5bapQJNfsiDMdmlGZd3MAGM12G5IBsQ4
	X0BB+W7vYCTcWJmfdj8pjnb9ac5NS3NCXYPjDF+PWb9yv9mA1v4ZpMURdyYBb00mNHAgSp/G29I
	6WKBxOwQ6wqpIBylZWPIpAmx4yFGAhqQMDKAeR7iLwqXaKf5Drhu27BeqbeLr7sfVtDt3ihf/rG
	4B3JeeFvyvcRvzjTmdHauylwFljMbYnPpECga9x/jTDkWKDP02k4DF3FsQcsTJNa5nn2stH06Lb
	6d1mpw+2/NDJzCMp1eK55JXj5AiPO5gmUEOR3AWoGv7RSQUqMn8jLZ5FWD1V0RLT4fL
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr321650975e9.2.1781009683630;
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
Date: Tue,  9 Jun 2026 13:53:49 +0100
Message-ID: <20260609125353.401124-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..dda7008acdd9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1376,6 +1376,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84749158F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988522; cv=none; b=vEFVlBGoPPOVk6Jtv7/Cg1YCIA3vrWYFLWNQJlEW4XJbyqgYRUhII1M1O+/DEPeaZHWt0f0NqVnLQWok9HH6yMotw7tTVfh9ISGub4otClrsgZVZkBWYLDTlIg0vhnbCFVhym9d0OkpNSQZdVcyaE+JzHqG+j0bhdojSzy5YWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988522; c=relaxed/simple;
	bh=El7Fck6y7ypxHU4T5nHt8VEDERbOkkCbpy9voDft7SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bF97koSGPzYponzn/V11N/317+7GqqzgFL/mQkHVCt9CI3cLF52UIP3J/yhpttq5a+21xUc7JSeK8F635UWm5YQrc67XhGhTY7O0CeI2u4E40xfL7ylu1SarSwPS7h9khTvw1IMvbY1xi8yN27t1XedLE2UyLiHkU8MfRGX2rII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqBoXwXW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqBoXwXW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so14666665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988517; x=1790593317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Egn531y6D5eia68zUO0Bjiv9ns5XoXFVaQXnVIjBldw=;
        b=eqBoXwXWuds2UhyGnuScSX/jJuBU8QBg4ccV8H1r0Ms3MVO1HuQ/GEzyhfg2PRjdlJ
         7i+JjNwbJIdSAl0+pGm3aQcXybtQH32nxsypDxCnZJeKKf6E8jvPp50mug89iMxuEj9y
         9mezbXYpwBUWZ69qnSsrNOcnK0xpV2vxZrh/R2IuS2um7LASuU3ZA6EbmXtNi057/VNZ
         eel27rMcM3XWgz4uW+NlNhPnMm21MhA99IprPtxnZ6+xJlAYqG6xfYpxFKnDHuPynvWr
         lk8uOyqJ8ImluEUxuyJRiZ30DjUHNV4J+81GgXY7+SP+JiMFd/N+aJ01cjd0hR10gnm4
         fEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988517; x=1790593317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Egn531y6D5eia68zUO0Bjiv9ns5XoXFVaQXnVIjBldw=;
        b=OOcA+cwlN5wpZpB0EgEXjLfYfPGIo5niRkkNlwVcxt6/PZzDNBwAQcTUuVYYpCiqYR
         x0Cx63Fm45QH9L5USrsauYMctrgUqjcb7ehur2g/EbFYhfGNs88k12jcO00Vow6aXRll
         nEHG+kUkE281QsDfQSz0dpIc57iQWYpufDHn1Ud6KboO3/0YiPWmcWVaE0WkjUzYvYsG
         6WNfRIlN1GBY7meAVJUP2yIxEldSh+Q3KykHt3/AgmP4pq0QjWe2dYVh8Ryx5QOr1hbB
         DGZtFUEurYHgPOycnfIwKalcHBLTgVrifP1hoh1ji9RL1DI6ZC6g+TUjxK5eueCd6gPR
         /YQA==
X-Forwarded-Encrypted: i=1; AKwUvBxb5RJA085pLK9MwATa7Y1V9E+EQnOZ13gZKLVjCMvfrQ3N1EjbJxm2pHDuPM2RiRMbKA5ARkdFlcHhtffg0yNTyg==@vger.kernel.org
X-Gm-Message-State: AFuF++nB2SR9E0NQIcAdqA+e0XveJFujTHaNdohKjQ7kY2Ff3m2n3FBD
	3NVLKrA/IsZrDJnZq3rbKYodBdwT0JdHbHDtwEhxe0tBzqWdpOA7Mz2d
X-Gm-Gg: AYBFou0ChPnVzcnGATamqBx3qhznRgJV8h3C/0V1nLhD8qo0tJ5qGvqYxHE4lIQzVRv
	4b1tGT+Ed2LYBQiiowh2zLgmAsZ/mFS66Bg7VPZ8jxMeiMIbVANSZ+YylAUr+z6FzPCfwxAsoiS
	Zcl7I0EBWfkCtyRGw53H8395w+Z/6JsaIIPaPq2tzFta0xWUHZuP9yZh2yULltdWSrXXRvlrRli
	9X0XD1aT3+FJCEGGX6dbEG3+Q/TrxNK1CRiCx/SsTn1tMDeyXtiCPAXYca6YZ81ADP1CLP/tJkE
	Xs+RoraTIC1qL2QAvcSTvrFq3y+8DEXn0YFm7QSN9ZM3XRODxsWRbk9Pwei46sBzXXyiQ72k4Hm
	7AS0JzxSDgT6zVjRq/lBW8OJ2d7gYBF1o5tr95/D2mjP1gu//4DsBLMpFTuv2m6ZQiIz7/x5efb
	/SdyHZ9aQv1Pte3csnXm/NkywS/EwcwbeZAK98Z1qY9SBEua4XcrzrC5k+z2uqTs62vZBi9D5BM
	BaMnV/2Gn4fWwfU1Ky2vXZuOal3LISaiG4N9KU6GZaYCrGmzKHXhJaGQw6m7n5o3QYWkgH9J/nw
	DnzNaG8=
X-Received: by 2002:a05:600c:8b24:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fce78360emr88120395e9.20.1789988517491;
        Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
Date: Mon, 21 Sep 2026 12:01:43 +0100
Message-ID: <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the compare match and compare mismatch interrupts from the ADC
device nodes, as these interrupts are not wired to the GIC according to
the hardware manual Rev.1.30.

Fixes: a82a42963c89 ("arm64: dts: renesas: r9a09g077: Add ADCs support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 486692bb84cf..674e35e4f242 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1271,11 +1271,9 @@ adc0: adc@90014000 {
 				     <GIC_SPI 699 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 700 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 851 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 852 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 206>;
 			clock-names = "adclk", "pclk";
@@ -1295,11 +1293,9 @@ adc1: adc@90014400 {
 				     <GIC_SPI 704 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 705 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 853 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 854 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 207>;
 			clock-names = "adclk", "pclk";
@@ -1319,11 +1315,9 @@ adc2: adc@80008000 {
 				     <GIC_SPI 709 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 710 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 855 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 856 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 225>;
 			clock-names = "adclk", "pclk";
-- 
2.55.0


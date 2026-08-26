Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6045FFCC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766571; cv=none; b=b23xj3XvzKb54gHz2DNCVRr65PrYyuuJSvxYcjKRa9m9Ako8w35oP4Dlw/HPstX90rpXXn+7ksCnWige+a1h3ue1bc/WQUyGx9Rv5s0GeFzS80KzapzNzPEPsAc8CAXbHLLOfDPGNELz1rczgjdLqUBOO6vooIs0lHCioc6W5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766571; c=relaxed/simple;
	bh=ywTK2DeK7x/fgkvo5FtlN8KM8nTduWZcKwVxsajGRbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCDiS2d7QKjKngRV7g+upC3CjEvFOXTSG/th/Ra8ERX4vCCJWJ22mzIVQZI+H8NjXyY2Y1XvtzQASZ6pZ5WSpjDyGF5Ea2l02B0fMfPHOP9DLpFrs0YlYiUTm0AM4t5d44K6XTTUZuLn7eK1Vz2jKLGS0FvrVekzuaZwLgO5vFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg+1r55x; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg+1r55x"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2531f453eeso74086266b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766546; x=1788371346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=Yg+1r55x5+gexqA2HILICtrF/8Z6OJ6lgunOVRzIByPj3xm7NKYnmzCAHD4eUx1z/H
         ZKB0zBdny++JvR0zo4Gcj/oARNGBiFFBrN8wwFjYP46gcIlGVO7GOwDJF4mcAryLLPiZ
         Bd4HDa3WGNS+A4VYCf0Zv3jReNzbTLj3K837uBe5goirw4uxxeOavFsEg9FDMIBBu39I
         P4UhKiTXjmX4Ez+lWD8YWGU9SI0YDBk6infGBNCU9pHq17ZjaPTVJQ/49miT4YdWP3D3
         JOgs+4Wyi++UJWeHrb703x2x/2BHXsOrx9Idl03bpDM3hIoYhgBouduJ+IBmm965CBQE
         V96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766546; x=1788371346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=Br/vE1+EELmEH/sotmutklyvatJJsFN+FcqtkWruHlq8FVpHqekdqDCvYSUm9MOQsZ
         7Sx58PWy088yIDn094xx4427yZLKsr2iKwDKD1UVXJjbMXWqD2E6SMTPTYBjfE402TCU
         AxiZY9KNlbL8P9sNVJ4AppwME9W+Wo3kDQjS/5wj5o9F2WuO/2KvJhfpCV15TUL5dT5i
         vsWJ1fdbZ1udp03c5bpRgZy58UsdwfIxseeIjHB74O4j3ceeyYaXNiYMnlc0yLBtwcz1
         2vOiJqqrQPPnZ9oFfMQGCzVc97UGtqvsOgCFN04FkudQK3kW+7uFMwbAS3BKGG6/ujAD
         ByNg==
X-Forwarded-Encrypted: i=1; AHgh+Rpji2p0/QATZ6i1Ss5n3uMgbkL40dyfhStmS1PI+YBnYU2zUVrIDhX3CwUKY9BzvTzR5AI+YLxc+k5udWg3TRpAwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kVVaxw6VBhT9d/tO71AGQup4FJDKwYTjntKff1x0+LQyQ93IEy
	8ghKq6tgM0PwskkmqB8yiRhBTVxwNIEjkSiy0cb0Fuc/Jno4LuXDxRA4
X-Gm-Gg: AR+sD10JQUL/jdvi4C8t+/+EPuIShQxxjiSygLUvXelOgUvu20p+8Dox8XnqO9ct+Wk
	t4dDGSZQKNgRnUVnEqEnVRhrg1ynHlQbjwxfdrDbxHrjleZ52PLFOqtC+pre5pnFm3w9kKymlRT
	4ccVnlHcXAuKCowG0PBQajf2HclVWj9yZJjNefgOXrC+fPxqzIbUzmWXbnfdW+20kxdVDr7arss
	vtSQsHwt6yBvpjZsVJEJBEnGF8Md3wnv6jfpAWJiTrBGvM3C8to4lEghruKbI9W7jndWhZto23x
	jhGKi1ryDDf+P5dMmiYqmXugD4sZsujUc/rlfL8S63400al4pLBAb/Uj+fIlepJ0x5vhe7s/Rd6
	TyVIQdEpXU9B2phsRfqn7vDEqVpeszOeJJeEdhf23EGZnEJFDuL3J8BTu8gJ5DggPa+UbNmkA2E
	iAnqTOnavozI4gksOJ6kkXmKv4zyoo25i7fcFWIGOTQbjvlkSCPmBMx0ABBJwJqnAQWt6yjErgA
	Oy79wXglz/WnvsIjyplJJla
X-Received: by 2002:a17:907:948a:b0:c20:f95c:907a with SMTP id a640c23a62f3a-c250c318b25mr986184366b.17.1787766546005;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:05 -0700 (PDT)
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
Subject: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Wed, 26 Aug 2026 18:48:42 +0100
Message-ID: <20260826174854.199139-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 9f5ea62efc2c..ad38aee2efb3 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


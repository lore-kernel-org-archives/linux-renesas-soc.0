Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38083486647
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329764; cv=none; b=bFewTdzjwVZnANnwudX8XR63B4ywVx6B8il01i/x8apzad7OepRFGzsav2SoNBEvteBcp/BFVCREqo4ruStdF0BiODSJIaV9d3b5/M/8axSU2hogqfgfr3DeepRQZgfZOg0N2meGKeTfxr4iZtdMAOgUS9d4W6/9RCcvoH2UKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329764; c=relaxed/simple;
	bh=v5TD73c14fBvGUqzvpEveOuuW8r1VEaiGuWjzI6l2AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/+Z7kfu+T1lS85D4T8flYtd5y/kQzk1J6JMNECX1Z8Fw5erJ785vT4SUDh0RY4MhJ+f+wG1KDEFLlTGe7WK5ZJpGyX6trgvQzPfEs5FmZCjMiCeK6RrbCIDmlYkLR4b1T4Ie4A1zA9f4HhwY2nzAJL7TVIQRj1r9ZwOfem2R34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7HH7JC3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7HH7JC3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so382190f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329742; x=1785934542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8f3N9RJ5+paWCMwW54eIfDA7ydsdinyye/pP58159A=;
        b=i7HH7JC3/47FhFYPAonKj6wDkKsaJtoYOE9CfoCrlQNq911Xu6mEqeKmNM8TGnSfOe
         HpESNHVotOj6wIevhG57Ag/OtUcO3JaqfXNE9Vkmf8svoyiJdVmvwY2S/rV+uNf4brLE
         4LUjnOdHfdQLscCajjlOzrtNSu/paQmXrvagiw7poZr/dXpKKwFU77QCfs96ZJ05TXQk
         N7zu2zzpG1vbfjq+U25O+jHx02QNwr5D5ux1va1E7G7GvEcsteD/gMont6LfriGZtWcD
         5Oca5BMw65llGu93Rob3uiizXSPmHo3LnNnNvo+INp8NUUutMcsDHUr3HMWGpYZX0sEI
         gV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329742; x=1785934542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8f3N9RJ5+paWCMwW54eIfDA7ydsdinyye/pP58159A=;
        b=av/SH1Lpw43DMdrez0KId+WVTKT2OQ/ad4VNk3UBIUTkz0IhAVG9qMJKXWdCZQEqtY
         vqOd6hNMbzuS14uJr9uxr11To0jp/XGn6TuAhgFPv3QiT1ZsEpdtHDA0gqT8Y3prk3yO
         LuY/D79Z5hHOvExQMuMLLboeS73K14vHAXpzL4v9GAheeIOJdew1+9cZT/tY7l89jJ/P
         nMjSMdj62UPJ3xdksTzC3jfsBXGse/LM1MvkmJ/iWTNNMAXTD4n6gT5GddTNEdTXnF1G
         xmvv2J//lDs00WQhxeSX4dWBJGFUaWcfgSsfx3buXcKOoRazuCl6ZPDfG3BKLpgz82v8
         2Jzg==
X-Forwarded-Encrypted: i=1; AHgh+Rqgwo9emtnM2IQQxxbVhl1oGr2huTBkCUHKKukmPKAabBD5wHL088l2/+/0MadGB5weENcOAqlMWqUa75OMn2aYbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79MyF0KvMU8O9draBIv8FMC6PMjMd5wpKGT4PVOAd2KcwJI83
	6qE6+mVnxF4pvuM4LTgITd0rMjqOHkkRrDOBne5rNpvx3MCcr7PGJIUq
X-Gm-Gg: AR+sD13TBDgNSV2EEKCk6+DYk6OkHOygPhLIKqfpYv5l+FhdFxWUXKfX4NsTVkIoIdc
	qr31XrDZsQPWk7aBbMU0Uq43zFY8IQEikUv47U5lXd4K2/5voT2xfxuisuAhJpcWLZO4PA2Nv3C
	qZc+uQTMhDvA8m23JquQCo0uKrM/7VaTZqw/T16PfmaxasEzhaljm5aHok3IwRbvoqSsZWVRIhl
	B7noVrlXeIXJdmpXgXANCFcwIqCl/SIRLRplIt1/f1xM4h7W2kUtbrcRPFrs+gDMQeBOOLpXzn9
	1CujAYXSE7Pz5+YV7AF27u5eLvtpSDKrud9TUicEcprph/BKr6Kx0hLbf943ivPotemqgohX3Lo
	FlkgFtxcAGcFvtjTnx07O7PUh1dZ6gljxJvqYNFzoQuhhDZEPMghu6SeIBwhJ4iG74myOiCXGFf
	7/DGAWOEgVhC0t8cRYz7dNTj6m10rm1RE+kU64PyNaHFYi3otGOm/NghyUZW3zWV5EWtWCQ3pX0
	pKyOm6B5kYhiQ==
X-Received: by 2002:a05:6000:2505:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fb1e95112mr7422725f8f.24.1785329742432;
        Wed, 29 Jul 2026 05:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:41 -0700 (PDT)
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
Subject: [PATCH v2 12/16] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Wed, 29 Jul 2026 13:55:04 +0100
Message-ID: <20260729125516.230757-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03693f01228a..14c7f0b0b2a6 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0


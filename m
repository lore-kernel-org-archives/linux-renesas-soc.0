Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D4488755
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329754; cv=none; b=J6aghrXA3hOKJs6FpWa9CaL2g6LHkc/ZgEhzaxavFXzfoB5ItI13NgRxDdXKKZhLYhq8YXTQQyNR+401+bCLju8aw//fXUWffHvL6tFD/LlOhFb9QoJAWF6qjMPbQW4Bct3GULK6gEIlV4Xvt4w0j2a/b76By7kIaFKoAAp19RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329754; c=relaxed/simple;
	bh=jKuYe1gjfWOfeiEBjkLMptmfqmvZ5RHA0qmCLGwyojI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQjgS3v5tClB7hYYJmCzlo3yLH737pru/AGCP2lG/OIvzpXk8VHlGuC5Eqc6Eup4QdnEcG9zQmViCVJW7MuvPsyVVMTmYuBmUisHltRtZBEx96sGjy3EF/PgqVld6mc81CUSmfCzRHdGq34ei9Q+PTgK23rfby77tAa85tY00ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJIEtZtd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJIEtZtd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4798bea72f9so641545f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329747; x=1785934547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6oFe1dKIkM2bpE8E9b0CLYYbXOCyfPkm1wpQCExeCo=;
        b=fJIEtZtdMEWi+wJ9canab8Px8ix0efeTR6VJQmjACSZmcPcL/Q9czWOwELMycyDNhO
         rYU5Z0EKgLpS39y2tT5/0O928CdWuG2kano2jVNrPyoCCFdXE8HNFMZpq3Y7olgRoKZk
         miDX/79YsWRNpR9Box+Ltfarh+i1rjOorE2ZHS4d3uomEkH0wEU7aw9UmSYyRNW+4ZuX
         TPDnyingaHm3efug0ETRCaebyrV7+9S2z+ptGZC1Eni6uIIuya2wD/paf8zd0ceZ+WDy
         /TwbWL/PKW6s+o5BN1zdg3kRAwE/4UlR6rWoYmkbNCkxOoFmZjxilNV5xjJvAfKEiixF
         7Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329747; x=1785934547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6oFe1dKIkM2bpE8E9b0CLYYbXOCyfPkm1wpQCExeCo=;
        b=FDoFdsBv+uFynWFECzH7XEjGcjeU8bz/NZ7rJjPENa4GhjvuNP3UeQVKVz8ZQtjh45
         fVXIg/RVmOZBay+G6Q1ypi+91wq018CPn+/JDtrPoGLprWir5P8rFrGUZnyNyn0egweT
         Btr49HIw46dgaBZKUfXmM7D4s9hdiWq+g95yzEFrUclkKVXE3OSQ70FNuQ5qsdWFCSMW
         fn8AeMyjcPD8amrHdTSfEwEH1mwpwAetjepV04Pwf20oKajiigV208pcBDA5ekHUfYse
         rl6WREo/GDyiDZvNqlm7YQ95SdyEW9EwVw6WCu4l592xlbz4rbISkeVrWLILLWLTPCqg
         6LvA==
X-Forwarded-Encrypted: i=1; AHgh+RoeRbmHBNbuRQvTcVa1dNBsqvm0lffbQ8bxnjlophLF7xVyS3OBv7IyGhlJiMvMY2Y3TIryaA2lCuM8tUapuC4E0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCpY+40v1g2pqutmMSB4nTIi8ZpeTHiFobK6YzQNDiCmviGTT
	TuhEsqRwWLVPfXLkw6qvp38a16XA2a7R8eYBngCKhLH+oyprM9/NPO6R
X-Gm-Gg: AR+sD13oyfzu9nmKzqm9FeJdPDcQULf8xmmWQ67/OQ5E6WZ5jod1kjKze3YBPZbP1JH
	GeqqRHX2tiEv5AFXd3Xl8UuEv+s2gu6AeC34sX2dbvQymIUsHW7g9NRvWXmORKlmM8U9FqVbR+u
	b3j+KIxdCU0/D1nZth5PHDbtSTaJuLQRr3+wFsCn39mVjlJENI67IfG4gE0guveggYv56B1s6Zf
	+tAev/ghYgplVzFKR0S0yA/IjiHrcHMsluhaaMR330MF5ZyVI02iKcc2mB7P/G2h6UqIaFde3KI
	dm1vbIw/fu+s9fyI/xBFs2V9OLl0Zh+7V5ai0cGMGmegvh6jicehatz2pOM9FQ1cBiDStI6Uh2s
	xiNS7x2fvjY2RhsmElCxMS7Fe4egm7nfZFPqdSZ0+kuXV7cXERIbJ1C81mmlVlAJi9RhLvcydEf
	C4vt5ThaC5TTT99ZZvCk1MRqMN8k2WqxDnl0zyZIA9mARwQ1tXC55NjKm3iHczfPzW3JdwRjuoF
	43Z4D9IAu9wlQ==
X-Received: by 2002:a05:6000:40cb:b0:47f:697b:de65 with SMTP id ffacd0b85a97d-47fb1f30f67mr7822735f8f.60.1785329746690;
        Wed, 29 Jul 2026 05:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:45 -0700 (PDT)
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
Subject: [PATCH v2 14/16] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Wed, 29 Jul 2026 13:55:06 +0100
Message-ID: <20260729125516.230757-15-biju.das.jz@bp.renesas.com>
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

Add LVDS node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 8a0bc4d2b150..ce057b5db285 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -794,6 +794,43 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+					du_out_lvds: endpoint {
+						remote-endpoint = <&lvds_in>;
+					};
+				};
+			};
+		};
+
+		lvds: lvds@108a0000 {
+			compatible = "renesas,r9a08g046-lvds";
+			reg = <0 0x108a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+			clock-names = "pclk", "phyclk", "dotclk";
+			resets = <&cpg R9A08G046_LVDS_RESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+			reset-names = "lvdrst", "prst", "rst", "arst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds_in: endpoint {
+						remote-endpoint = <&du_out_lvds>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds_out: endpoint {
+					};
 				};
 			};
 		};
-- 
2.43.0


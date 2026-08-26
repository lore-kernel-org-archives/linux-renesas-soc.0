Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA56471260
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766560; cv=none; b=N4z3W6NW2j7xdP/tPKD8DWv0BktzhyQOiLd4CnxcpNyQ5ofd/1CJ8FPZizN7CyQDlIgabxMNSbaHn3uZN1zqf8fMPh+zv6AfOlvuxBUZ7mZIOdd5I3KBidpx7irco3l0717EaJdDwYKUIow5oCuvAM4II++IqgPq4bZjJFw1Bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766560; c=relaxed/simple;
	bh=skBvxLh49SoooPdmm9rKFZkjaJowmW2KUOSBS4qAXPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6lH//ROFJl08nZMYvm+icGh6GoKNuIIPWtrERGetfe9YTLVpcVpIn75ceSOF00CPgCuKZSixUzMiwU1CimiXdKL4erdg4FbHSf+J/YoWDTAr1ORzuF0FoYrImjcFi0NNGHSPVDQDyzN9tyrshTtyfRDTfo3othk4b+k342xMMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljEfFFEb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljEfFFEb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15cd3fd760so146523066b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766549; x=1788371349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0Me3YVClny3tyUAJzGZc7ucjtkhZP3LdciOFdTRFRQ=;
        b=ljEfFFEbp2wMJMA0HU8A1T1T8Uvulf8WVqwe8XJ8SVA5uJdYogH4OSbUVNNj1voDWF
         G0rIVjSUKPrfkUAEjMpoZlcgW8/vAtb8Z05HBscxNRym5QHNuVPSQDYIJ0TsmBK1hZT3
         OeugCZjBx/byntlaOKMEnLLgHL4AqpsZCwC/Jhq5dPQj7XfhMR6+X7e04lMmbBUACdSb
         /JsH1W46k7jj/ekWSYlggOLlPCYcjoBcmGBpwj14OzE6XFKPjGdrJH4kfiI5tTbKwXRu
         j2FgBGm1jkTul6WtzOmJdn2dD17GQLxq7p+z2ysBFq4QKWOVOQkhHCv0Y5d3mlf1wbs5
         OJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766549; x=1788371349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0Me3YVClny3tyUAJzGZc7ucjtkhZP3LdciOFdTRFRQ=;
        b=AN2IP7rjlVanJBhxtjIR2E1QxS3DuvkmDcwW+JTl0PFyvHT1p35k2TJZHyylFyXG9D
         NstcVoH3IvCqzmJlmquzjGyJQpane3Ls+7LEJEg8u1UeuDiOL+upSdzQq4MK/4wYV/36
         Vid3fF1aEy6DZwEz7vZ7jIdw+4qZXBu76nSfEgXboXOnEsLsvjD7Il6F75uUe40aWaY+
         OGQFSntGZPoc6W+cgWcYkJxwFBllqJnG9k/4riF/wYXZh8dMr2+RwH9vnRH3m9geCljD
         MHX8A8ws2SUuuyVOD1HGZLFOJfYLqznpe3p4iFiKDQE+2UTNwWkSlDufFFqf48R2EdZh
         SB0w==
X-Forwarded-Encrypted: i=1; AHgh+RpOmZVt+DIU2WOAaUrzmS8GbX38vMJY4Ivbz3hS1FqvYpaCIWOJkxJPfb6bNemF8TVegqZ/44umOYiY15GQEo7CDA==@vger.kernel.org
X-Gm-Message-State: AFuF++nrtiltmhmeFiv7P1kKWK9Tes4qa1w7iIwBobvIzODNaYLZdze3
	ut7vEeaR9I4MBwm6PwphxI/e3Csf/r/+ueg1NpgNvKC4ilJv1jdn2DM7
X-Gm-Gg: AR+sD10a3dlhwPBUqoPAP1CHft7LBkfbM0b+/N8bRl0SYQ56+YzCiTRjcScj7bOt7l/
	8XqwHXbPxU8CzFHupRlLxvmtfdzMXYhh+MIhb0IbdcpVtL7xsCHZtL56OTulVcpnErTX31eBsHk
	es5wj57LkfeqZiWsEElAdUGB3ANzzA+C4ZFNAB4SeZTe8aFwposs7faoJS6/6bG+BQoA4WXqfxL
	f9u7CpPg09uNyOV3K4glZ9/lp/CCe63ESYmxfLJBjGs/FCUAbRKL3gtJXZS2jdogDqwi49Aam0M
	YNve9bEtMiIeD0VCZvyckn3PHm+0OVXYi4xOiQw7jBZDPQ7sTp+BrYmdn44PcZCSjoA8/fckmfa
	jo2aXlIPOMyl2rBnsCQes7iCjM6Iuyk49FUDnyoqibFPqnDnKfcuNm0WcQca4oPz1ZwQzA4q+FM
	Sd8r86nhany7FSPnOBsrf4TfFeRRBQ41tiRVBnLxnFYprIMtma2BjAnWmkW7woB9FN4DdXRdgjM
	Tu5yzp8obIAftCQCVJwO24Y
X-Received: by 2002:a17:907:1c99:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c250c38520emr1078858166b.23.1787766549069;
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:08 -0700 (PDT)
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
Subject: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Wed, 26 Aug 2026 18:48:45 +0100
Message-ID: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
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

Add LVDS node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index cc8bfb24da87..f652ad3f1d1a 100644
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


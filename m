Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEED331212
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681816; cv=none; b=ZYYQn/QYQdMx3dRE/dAqMAzA8wYtmjP10DUSUNPovZWTaceMEz7VLIGn4IMc5BiTLAqrnUz4MReWitV/EBhfT9YgLzB3pF7nHNXS4K2G+AhRN6vLlNcYFNfZ458lXQ6oqYJhpJhA7hSEz4Symk+BA4L/2e+9rCQcNo3w7pSE0XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681816; c=relaxed/simple;
	bh=5HXaWSiI3vXmlt7Hf8eg5mNctMjnuBFiMLGRDTMd4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+ttxLGvlG2dmO0zo/jqehV7yFF+rfgZOiLSuo+fvz/kQp0Ud4hvk+lPEndkpex+Gn71Kh0ytXSWMCsiEwX/Jp/tZT4iZlPwZ9e/sxn3Ob6cB5/5rAFdPM5keWWFe9uAxMta7/ZHq0ZBE+SJmV9+oL86bEqnjYjTzfj39mSn3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb4vb6Fn; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb4vb6Fn"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso7376845e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681812; x=1770286612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=gb4vb6FnoVGBDcVVQowirz1CAzZuZ0Bi1n/PHQMcbYdDFkPGavm7MX7k/GG/lRnzSU
         xLZZZNFJrlKUoqiztoloet/s8kSQLC5dE9Kev0SXq+bU18n83dSOFQwm5Fqk8exTguH2
         wxEI+GCgA3rjTo0Cvm2I08Y98bgDKS0AJ/AWGhFi+0QoL6FqL0vL+E1wgyR8zkESvzpV
         6OAWrbvKxrlLBFB8qg20qOMW2B/FLCVVGjeWhLTq2jre4toGF6yVQ7NIzOVGQsxRsJsl
         QidAe7yJ5dBkvU3Isb/Xtu+/YiFxE7iCAwFhszYh63Lxs0wISHJDI2/JIShdOmjcAVyo
         gAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681812; x=1770286612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=mFY1x5ibX/CicTCNfxjgbH3LOKQuc8ld32RdRVw6VaLR5hoACbdo+5U5arqQpqX02H
         VwT9+GKWMmII/I5TQAuZWMkP4r2W7OOOCSvEQoqRaX4v8PSR9Z8CbI0ZELkXZWhkjjov
         soUqCtJdCtyL+int1yv/EbPjpQmDgTbcQtNpwTVWi+tZMhu1MR0jumTjRXP+uEQDGtcB
         F7nxBuP5nVaJ/l9PRK1lQiZb37I9ePNECEBj1FybFg9z+OS/QoG0scVNxhhzHDrGulq+
         wLVU5ntxgR8vjwd8Rcrw4h/VDERwTU8m1gTzCb0fcteia09XTvwl2r50du16rcueueNL
         K4OA==
X-Gm-Message-State: AOJu0Yy8F4XrWcaZxieuKc0j1VwZHw1+vUEkO4P0JQc/tX8AkBrtXf5c
	TCTE40xGlWhXhdheEYRfb6zzfL+O24k9Vpr5vbCaSOdHMVf8LH5xyg/MsaHUw7uS
X-Gm-Gg: AZuq6aJrlDR62Xs28js3fRh0AwVHIuSyw+bUjSqSwl2QKzZ+lP3/8JKbpz80RI0cBDA
	sRvdzLHPYZBj3jhaaZ2WaKSvJk/NhGPdDjYTylCR1S3AZYj24Jlze7/Uu/xGUC1zFFf2c3d3MXg
	O8jY8atk33XyJR/J7Hel+bOL0H5ca/sLp94VFcHTSOhwkRM//+elS1GFJMcc+FEebzTIM2vIR5C
	GWJdQfXfpdJl+9cC43LJGFNrVdbjSbmsPKJlDUOiDap1B4xxfj0gpCyGx6+xgy7Y28uSTFdFs+r
	6vUe/+9ncZy6IcK1HZa4Wqa+iiASZy5pcW+zMRWaDNyiTPWjL/xrwIKovu4qf+Fu7p8//GY5uHL
	7gT9GU+VpPTQzRBYuBCgCSyDa0D4x4RHS8oWgUahxUZv9f1IU4oHb/RDUaBTh3SZ9Xp4eHtRBw2
	DwjqN0/APUGzdT+fHn
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr91235405e9.34.1769681811780;
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 2/9] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 29 Jan 2026 10:16:37 +0000
Message-ID: <a040f07000220605875775161b51f34bebed8a67.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  1 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fbbba53cde9b..dc7f92c35eae 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a08g046-pinctrl # RZ/G3L
               - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
diff --git a/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
new file mode 100644
index 000000000000..660c26477d42
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
+#define RZG3L_P2	2
+#define RZG3L_P3	3
+#define RZG3L_P4	4
+#define RZG3L_P5	5
+#define RZG3L_P6	6
+#define RZG3L_P7	7
+#define RZG3L_P8	8
+#define RZG3L_PA	10
+#define RZG3L_PB	11
+#define RZG3L_PC	12
+#define RZG3L_PD	13
+#define RZG3L_PE	14
+#define RZG3L_PF	15
+#define RZG3L_PG	16
+#define RZG3L_PH	17
+#define RZG3L_PJ	19
+#define RZG3L_PK	20
+#define RZG3L_PL	21
+#define RZG3L_PM	22
+#define RZG3L_PS	28
+
+#define RZG3L_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
+#define RZG3L_GPIO(port, pin)		RZG2L_GPIO(RZG3L_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */
-- 
2.43.0


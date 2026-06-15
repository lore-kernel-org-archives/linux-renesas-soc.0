Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F223F4DD2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534404; cv=none; b=H1njxrPPtN5rNlTXL9Joh15V5kti6jwav1COUCGCbHK0zyKRI7OViXJ59gf7wLEl88FZBj7fibmPibKgtRz9x2vSj7rfu/ui2Ya47/WK57CCeP9eKFm7yEpxW6T7BTa991RXVrwwmdfVIPUZAUaXBL0lPU/es2XfbExO1I/azLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534404; c=relaxed/simple;
	bh=RPYCKUoaLHx21mEpdL26fmX9w4xAgCZxloQUVPzEaaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lb9bbzLBKYlQStb5kJi6S+SFVbiwaiTFs5VUMar7egNBdjrmnWTQrbMGmM9WLvlGBF/H9rpf+nuW19HTLJScGVDUBEk/w6svvoHMyMfE/gaHXrdFQx84VH+3yCVk4cywdvQyJYX0JjdQyq5miCG0adanRkycKoXT8o2v+j+mKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNHajxpP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNHajxpP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso44757345e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534402; x=1782139202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=RNHajxpP9OT7RBWJDkxfPGRnH+aeTYtSjVibR6AwR53qdyiQ8zL4Ln52zpVJhnrbRI
         KiXZAQwS3ilMZdcvEoqYwNjqPwu2+vvcl5jeLM3Gc4D1zBTZpwh0H+BqSvPYmexdNNsj
         bXiGLzzp6pKyZmibSBUp6O3f//it++Y9+nMopopQ3JovHfAxa+RqYU7KVhL4pi4LPdn4
         pkCX+Zd/huVLT23nw5NiwUxItqGT6pVYYe7D8O20vfmzBRvUtvZ3WKKOJsihJSVS1Z6S
         3N/xLpaunucSJdNvlgbBepeTtPcBqiBQ9BcQ5UTta7loOiOOzykCXdtykMawQK21cdEJ
         Z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534402; x=1782139202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=AFxWUy3DWXDtgZaarCHUxUgfUlcCyf3NYE3Df82FMoRrms5JZnf2fz+yUfDUiqL+Jq
         kcrLzH3zIHI2eOiDhzI3bvpb+gDuH8xVnKYDNKjCqlFJnR4BwRH+omn5uoH98QXXnsYG
         XzOgjhnY6SPd2LPhGf7f0gDTq0wwZYxnrbVN0q5E5pdrAvKJjaHyfhbAnj5n9964Hroy
         gzVii/v/GLiGZ75NPotCGq3jImeP5U+D1Ff+GoRKinlJfq5gY97KxZce1+QQS06AnMgV
         J23gXLHcTo+WYIFxnGZ+FuxFIyaJzT7g9UQlcKko/0iFC0CZrDfNl8lEfP44geZGnwCk
         xwJA==
X-Forwarded-Encrypted: i=1; AFNElJ9/sp2pYfdcHj96/SwEisqOWQiqDNtY2HGomKLRQFtSx3lhO1Xq7oc+XGybOjuYMOP/5dJfRfclRYMxPV4yllj2eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYYMPoGgr3sZN/Is35v2qB4ymAP8/t+zzieBgwkn6WpUB+mlr
	DR4Ras1KFLmCbwUUmgnb+gaIgLk2cA06EliQq57oZKXA0dDx6wUuqwQw
X-Gm-Gg: Acq92OECrtNVZtEav0UMf1ZxliuZ+Bk1sNxEzpHmJWRUMxhVeTX/VEd4zSYKhb3/jF3
	A+1mBGhZ+0tEUTn3oLOUX/hJXzkv7DkEZCKcxenORQQWWxe6ZI4sjJkqNdigfDQvHk/0Lg8zvaE
	qY7efQxteOpT+4O84PvETF2NjWssEg5S2TR4tLn7iBKulI0qStE+Q+zFn6tAg99eV3jL5axVrOb
	0Fn3fwl+7h0+QIo2rSAWl77iFhxE2LQEJZV/3tIbBONaYpDc48j3v578M+71M2u+RYIul9VY3eu
	znF1nBL+v+10IahmSQ7NNJ/6OcHULl2FtsEMfyWy57LVfNx9IOwZpeKo5m7ltDjxtgyqpXx6sLs
	Kw9ZWZ7oPRJ9c95dyC+WsjEbQIC9AbNtRQjQIEdqm5CDiDMj2/sJ25ky0TnuYWV3UJQgHMWlQUE
	31FXTMLU2HAHbNNJ+uzTM3WK39wEItgpG0Ye7PDwj+ZpHZAeVhDxYrxmdgc3UDAFq+y1DQjxro2
	CEEsvi4cPMqaprQ0DmlaNUyiBYJ43OrTLryotNhTnnUsYw=
X-Received: by 2002:a05:600c:4709:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-4922007472cmr139483105e9.11.1781534401612;
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
Date: Mon, 15 Jun 2026 15:39:42 +0100
Message-ID: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Note that the LCDC_CLKD clock is utilized as the operating clock source
for the RTC IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index f6cb8d649a46..aa47685f329a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
 #define R9A09G077_LCDC_CLKD		25
+#define R9A09G077_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 312e563b322e..1c73d0dcef18 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
 #define R9A09G087_LCDC_CLKD		25
+#define R9A09G087_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0


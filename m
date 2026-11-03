Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726469;
	b=5W+kVEcO925UX91dsq60cRcSlhmKEgDL3n9viMLKRVWBqQnaZ3JDhJdVY4Mx398J5QrD
	 5emLJCF0DchD76tHVkFQSxQuEaz6mhBy0hdDTt+7NG22A9tk9HQYKFxAA7Rj4CEeNPM9K
	 RWE/KCbmuWDCHbf2UQU2kcePiYyg2j16sl6xS8P0ENbNNoQF2b8SAe9DxADIvFYrNGbkb
	 /Ka4JBeamtUDhpvWkADE0Bp1E4bCxRnTvLwP6rzD5Km0WhazBRKGEq/udtP+1vj8MKIvn
	 I3babKy/mQP6LVBNzYNt7XQU9PkXhFMwUdcfX5UcJOq0FGFPnwy+QnBArMRWUBe1rzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HfoDPTXioBc1cw45nHPpU8QQl7Ua5gtA7+x/5ww4cF0=;
	b=RY+IaNCPvE5N1nqeFdIYPK2iJHciF8QjJ2qD2DylvsOJOodV4anETDlLY28+5MzwTtWg
	 hi6TbYIWJSu5/cFuoxvAiqGrPVVxICdyCL+q5hQe/a8ER9G30vpUlaKdvo8dgCP31eLWD
	 d/nqc9NdMMKfDR9BzWmeSMpsPG1FHAydcXmpqhZnoKUNRd4lfpn5ZPlS2d1nZqjobYVY2
	 jD6dAQRRmj8EVPVVB3iFI4TYmpbm3kdfYYStVy3qn3868herH3t22kqIqZD70C0LNpreb
	 MEmz1jKjD770//FDcoSVetOdvH1SX+q0p8qFOE4RGPzhpdAFgDPK5oOGDcpaPAoMbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wvsu0LoA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB8606A332
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 17:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFB8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wvsu0LoA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so30865925e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726467; x=1794331267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfoDPTXioBc1cw45nHPpU8QQl7Ua5gtA7+x/5ww4cF0=;
        b=Wvsu0LoAjvvBSfsL6lKbBuUu9tNsqEXNvmWchiclGkjkIdNhokKIm+bwurrP2PKfyr
         RW6iQX2OGaDGsZSoJkRm6emOcxSZ+u/F+LDsU8bZbpRL1uwom0m52SXliTei6wIgAo87
         gI3+tqd4AF2Df4srlZiVkS9PwKJUFEhPcYqSDBAUD5lOsEt+lmUTgZaN1HS4X4XjgAFU
         powa0TM1SjFI+hNsZUEazfq42/mrFdiaYx/GQ4qzQb21a7QQfVj/4knLtbfkywxD8era
         XL0JckbT2wFeOJuw5G0Ww5aZDbzWjrvYDiQtmpMIermDjfhlvjT+gCVuaS7mUP/FxEhD
         Lzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726467; x=1794331267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfoDPTXioBc1cw45nHPpU8QQl7Ua5gtA7+x/5ww4cF0=;
        b=P2GM0gINb30r0FxqtAa3wgAPLK5d3w3rzJqOMRMh2SfM8lX0rrp3hMpuuNd6Nd8YIr
         R9p2XFnPFHr6eoP+vkRve7/HVI5L4VZchn/9xHzBUUsRgNdAu97nLFS8nNgw/s9LjUc2
         sjXVLndFcrhgJVlHEH43ztzt0aHs5/YipfWoWLvMjI2zZU9QNUakyMmmzncJa+8TvcW/
         bvrQprhE1d3jTlMV8ONLyYTXpwFJC8I820Qf6qmozznaJCjmg+IjMgo5AN71lfCFhJvw
         tS5xFErmhv3zRgFiTzAbnPz1TbaKLmDfYXcT0FdtifYby5CBJMJkfx8OEiFeoDtqDhJK
         cmcw==
X-Gm-Message-State: APuU4Z/giuc3/lHu0HXqCKt4YJvKtKnNMoSgrTvksvWDE7Kv+7l8bUDh
	UquKWAfra00V1xGL5ObfJ6GxQ5C67TiMUy7+4GO25Yw3Gtr1nYBvpKsikg2nvjBd2suVIg==
X-Gm-Gg: AYBFou0CBunIff5zuqH4rDjQEQ/DbhIcHQFjTphDLHyQcsMoYIRA3gG6T+dXsrEjDrb
	rFmddUjpgX/qlyMguo1ExDFgCAM0jymRAKCVx+QjkiSmuPuF45ee2hchWQGVSAS/PXhSY60YEye
	kyzwvr/SSEl8Wapw5zF4SkBwE0YP4g/jV8fyUVAxuvMj0GAqM7SaNT89s72ZwUKHQKeMi6juoSs
	T/aHEiL16zoJMtUHk1A0xDuS4kTdVr16Ke0xqLrHcFjgirHtzOlMLbPeK9lQgPfTp9pDOQgJvou
	kWStNA7DOY3aMBR5YJ0nXZ9FJYIhektfkzeRj6p5BPTQbejUoivPnpCP9jCk1F5qsMJwUu5zG2c
	gqtQmP9lpGsj8i9fflv6kv38ky6TRSNkzunpM0kfwHln9TLBrYHtJHdoenr84541JrFTPOOPXMO
	pILqCw43gSi6NtkllmlvViQh59uIhN1BLCw9P0oikJ9LM3h3HaIN9LCL0LI7VHFYc5DCgmrYMqX
	JHixtGYdwicol7CZIvWKd0mIDnpawKsp8eVaf7IMra3yLkvTbtoaBJqVtiI4c5Rc9fojBlfEgCe
	RxGg+UUVJ8DJHLYhP+aaHTUVm5SBmoZbe1MsO+y6SoKnW0f+0ikEIXOd6XB22i0P+5zdAhsBfYo
	XuqvQ+lI+2IkWMIk9JDXmhjl15vpMsRGudvjkJbY=
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr316878005e9.24.1793726466560;
        Tue, 03 Nov 2026 09:21:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:06 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rzv2h-cpg: Allow MIPI DSI to reuse PLL divider parameters
Date: Tue,  3 Nov 2026 17:20:54 +0000
Message-ID: <20261103172057.617203-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CPG PLLDSI output feeds the PLLDSI inside the MIPI DSI block, so
the divider parameters selected by the CPG must also satisfy the DSI
PLL constraints. The DSI driver checks both sets of constraints during
mode validation, but the CPG's .determine_rate() callback performs its
own search and can select a different combination.

Allow the DSI driver to cache the selected divider parameters per DSI
PLL instance and reuse them in .determine_rate() when the requested
rate matches the cached frequency, including its error. Protect the
shared cache with a spinlock to avoid races between mode validation
and rate determination.

Move the maximum number of DSI PLL instances to the public header so
the CPG driver and library share the same limit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg-lib.c | 48 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 15 ++++++---
 include/linux/clk/renesas.h         | 16 ++++++++++
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rzv2h-cpg-lib.c
index 124239c7327e..4b59bf60edb0 100644
--- a/drivers/clk/renesas/rzv2h-cpg-lib.c
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -7,12 +7,60 @@
  *
  */
 
+#include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk/renesas.h>
 #include <linux/export.h>
 #include <linux/math.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
+/*
+ * Divider parameters handed over by the MIPI DSI driver, which evaluates both
+ * the CPG and the DSI PLL constraints before settling on a combination. They
+ * are indexed by DSI PLL instance, as the producer only knows the instance it
+ * targets, so they are shared by all CPG instances. The producer runs in the
+ * DSI mode validation path and the consumer in .determine_rate(), so the
+ * accesses are protected by a spinlock.
+ */
+static DEFINE_SPINLOCK(cache_pll_dsi_lock);
+static struct rzv2h_pll_div_pars cache_pll_dsi_pars[RZV2H_CPG_MAX_DSI_PLL];
+
+/**
+ * rzv2h_cpg_cache_pll_pars - Cache divider parameters for a PLLDSI instance
+ *
+ * @pars: PLL and divider parameters computed by the MIPI DSI driver
+ * @dsi_instance: PLLDSI instance the parameters are meant for
+ *
+ * Stores @pars so that the PLLDSI divider's .determine_rate() can use them
+ * instead of running its own search, when asked for the matching rate. The
+ * DSI driver needs this because the display clock is set before the DSI
+ * bridge is enabled, and the CPG alone does not know the DSI PLL constraints.
+ *
+ * A later call for the same @dsi_instance overwrites the previous entry.
+ * An out-of-range @dsi_instance is ignored with a warning.
+ */
+void rzv2h_cpg_cache_pll_pars(struct rzv2h_pll_div_pars pars,
+			      unsigned int dsi_instance)
+{
+	if (WARN_ON(dsi_instance >= RZV2H_CPG_MAX_DSI_PLL))
+		return;
+
+	guard(spinlock)(&cache_pll_dsi_lock);
+	cache_pll_dsi_pars[dsi_instance] = pars;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_cache_pll_pars, "RZV2H_CPG");
+
+struct rzv2h_pll_div_pars rzv2h_cpg_get_cached_pll_pars(unsigned int dsi_instance)
+{
+	if (WARN_ON(dsi_instance >= RZV2H_CPG_MAX_DSI_PLL))
+		return (struct rzv2h_pll_div_pars){0};
+
+	guard(spinlock)(&cache_pll_dsi_lock);
+	return cache_pll_dsi_pars[dsi_instance];
+}
+
 /**
  * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
  * for a given frequency.
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 7ca2447fd811..e6f6a3fec449 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bug.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
@@ -72,9 +73,6 @@
 
 #define CPG_CLKSTATUS0		(0x700)
 
-/* On RZ/G3E SoC we have two DSI PLLs */
-#define MAX_CPG_DSI_PLL		2
-
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -123,7 +121,7 @@ struct rzv2h_cpg_priv {
 
 	struct reset_controller_dev rcdev;
 
-	struct rzv2h_pll_dsi_info pll_dsi_info[MAX_CPG_DSI_PLL];
+	struct rzv2h_pll_dsi_info pll_dsi_info[RZV2H_CPG_MAX_DSI_PLL];
 };
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
@@ -235,6 +233,7 @@ static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
 {
 	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
 	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_pll_div_pars cached_dsi_parameters;
 	struct rzv2h_cpg_priv *priv = dsi_div->priv;
 	u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
 	struct rzv2h_pll_div_pars *dsi_params;
@@ -247,6 +246,14 @@ static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
 	dsi_params = &dsi_info->pll_dsi_parameters;
 
 	rate_millihz = mul_u32_u32(req->rate, MILLI);
+
+	cached_dsi_parameters = rzv2h_cpg_get_cached_pll_pars(pll_clk->pll.instance);
+	if (rate_millihz == cached_dsi_parameters.div.error_millihz +
+			    cached_dsi_parameters.div.freq_millihz) {
+		*dsi_params = cached_dsi_parameters;
+		goto exit_determine_rate;
+	}
+
 	if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
 		goto exit_determine_rate;
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c9495558cd5c..c1582ed9bf69 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -159,6 +159,9 @@ struct rzv2h_pll_div_pars {
 	} div;
 };
 
+/* On RZ/G3E SoC we have two DSI PLLs */
+#define RZV2H_CPG_MAX_DSI_PLL		2
+
 #define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
 	static const struct rzv2h_pll_limits (name) = {			\
 		.fout = { .min = 25 * MEGA, .max = 375 * MEGA },	\
@@ -196,6 +199,9 @@ bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 				 struct rzv2h_pll_div_pars *pars,
 				 const u8 *table, u8 table_size, u64 freq_millihz);
+void rzv2h_cpg_cache_pll_pars(struct rzv2h_pll_div_pars pars,
+			      unsigned int dsi_instance);
+struct rzv2h_pll_div_pars rzv2h_cpg_get_cached_pll_pars(unsigned int dsi_instance);
 #else
 static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 					  struct rzv2h_pll_pars *pars,
@@ -211,6 +217,16 @@ static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *li
 {
 	return false;
 }
+
+static inline void rzv2h_cpg_cache_pll_pars(struct rzv2h_pll_div_pars pars,
+					    unsigned int dsi_instance)
+{
+}
+
+static inline struct rzv2h_pll_div_pars rzv2h_cpg_get_cached_pll_pars(unsigned int dsi_instance)
+{
+	return (struct rzv2h_pll_div_pars){0};
+}
 #endif
 
 #define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
-- 
2.56.0


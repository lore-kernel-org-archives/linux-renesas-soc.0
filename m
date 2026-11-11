Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395244;
	b=I73BXKKyzf4mrGtHXXbczqzsbJJF78ZKis7jYhBRXsVC9TzlGiUhJtuQAzYIfCktYiZR
	 1liD/c5suDx803PrxAt5TnA8kv27XVN8TAhtaLhP3Qqg8EpQfjk2ApMv8QZMJSD8HBzyB
	 dR35iwyiVLR0NB6EON6pfnPoDGaRBppH5oourS4xjEQB9XIfd7kcs8CJm8OsPGdS4Hnog
	 5SR+6jlgo//U+7YV3MjW7dGteS4uzmKjvHsU08off7GwlQUM3v3A1UBH8XLqJZ76ajRUl
	 oK9mWDmpHhRvnWneBAPWeomrpeM2cicz7/2LJdXDnbem5AeHI+3v2qcwjT9WTzs2XXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
	b=La7OteagVvEcyRT47wqI6Fit32Ac+WKGyUwsPQc0vVFLh0AbGA4PnewaMw9BHfz3jhiN
	 U8QjOsKcWwpvgqCZ/dDLr2/yUvgqk5k5beRUUULXqLrOmMyepPmedBkA0NihlnfMJljfe
	 scGK7JIEWNTj7abv3fIumvuvLmP1MBfLzIp9P45q6Yl8vr3m4qe2MgrkLuMgPte5kB5gp
	 X3S2tTj6fM+LMoo+NEhBgTPAOhE5bvjHEDHIhL8aJFuFBr0AqF50a9yt0G24GV9NsYAKU
	 aJavBohVuWI3W4IIUAOcnV6f4Pt8tIOi/GUo/hhTuNVljTlaENn2v9imv5ZN793e05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm8Hy4f0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6B606A333
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE6B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm8Hy4f0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso30698525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395243; x=1795000043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
        b=pm8Hy4f0jSS3E6MB3iGev0env48KECBGEevdmcbYfffKzZ8Jor8mkpdAiFiTO94sY/
         +3/lcKGwD13yZi60c1yIjHCHf+AbDsK0ojUXnoHEaMM9exl/6LCilCyr06lM5qXuwSPt
         Aoh2k5Q/zXzsrcJpALFGAjNhFrgQhC0IfoQ1S2o2XBAMdrHD95qiXaFK6v6gE+sEahJ6
         YtaMQjaB90RbPp1fAI1t8A/uZDGKzuwHJ9U2/ch2PuA8c6oHV72dV6D6SzCsRaCXRBOR
         cdZ7RMBmXuiFW2sUAk+pQC0k/D4mD/NmzWPgqf6fAVQ62JAv752KJ3nXsdrD8sCnnOz0
         glKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395243; x=1795000043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
        b=upMaejoB2J7vUkrpj3+wQFM4Ie5fC6c2cvnHB+qhZCmWmxGHE34G+4Hh0Hz//CIFR2
         2Ppkan+O0y5bnrs/NXVHKNRVJA2mu6y40dtLb6O7DWCgPtXIFQmTOuC8AbsXugoM6pBB
         3fCifbIi4ndadfoKhP1KnhZK2JhABsvwqmoCc/PtPUN/XG2OiZfGP9S4MDWwYQ8QwdQz
         uDxzBTV9wT+zzREM/RJi9eFJmDPYZaHmwhEE3u02MUnvEgBxK+CYKYWBZuMUGPyA3qU4
         J15SdFVgh/oWhIA/ElHUSjstu7D6bXRkErw7ZQSHLmWQDS9P11mK8iR8WqYK04NpwwEx
         DmKQ==
X-Gm-Message-State: APuU4Z8MJJanx7owafJ+yfJCx04+cPkAP/kxaMANQTCX27ssFNFuXMs/
	1cD52UeiocZr7WJqihx4aRyhR5T4ZPwXWYhYXJWxcAZw21YrbsslfXsE
X-Gm-Gg: AYBFou10s1SZf2uMCzbzLMOhYiP7hUVoEGMbx+dGxhBy8E+3/0cnT0v+qoa4OJ/hRb4
	sNb52abe0S8yQhrhyUV3AfqXwwjupgyUe6vxbs1tqN3Y4ECId0Cf82ejmiBQyHnDR9mHIsEhplE
	wSfG6tdktYh5sR95SLM+cPZYKVb7uH8Jr1fYmGJdQXAuoUaoyhHIU9BazOqAuPCQUrdvGlmJgYM
	Mpz3FobzqTSwIUEKw0Cx+jfVCAxTrF10ng368+RqajoFCnocZPyaQNI/EYdyUuGQyqoErT/ihVY
	T71IxVLcn3Um13vr/m1ATXa1HojnSB4wA67+ujLeh2MLDq5bjAPEGqFKzUWGTd58mXsiMCHgUed
	+QuIfBWu9B1/9OI+sctzgfp9hFYuV5dbCOHqIKzch3yIO5rRVzDCh9XhdnRXSPekUtcnbrIA+7F
	ASshBvguWJ1TiG/Dsa2DEjmAijIXG1DwuGmJLWCd5ZyGyPnSNeWs7VNcYpO93rIq7FjbsCcHSqG
	w14ZrgZhToX6sC/1h0jqaohBypJYL+7Q55nZ/LRHA6Jj/F650hEqMkJEyC4vlcIq7RaCTZI50eK
	i/pu7CnvhcpiHJUVjMsYUZyv1Kj0KF2OLUMJ+365QgbfALUnmlnm4+nxrfLN6Dg4KbWPu8ck7GD
	arE1wpqYtXa4wx7E9pl3dwfs/Qyela15TQONAW0+v9IHVOL/fDzbZkkBTVgrzMnfzeKWx3zds1E
	zlN0nx0Klx
X-Received: by 2002:a05:600c:3486:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba0936e95bmr39114245e9.12.1794395242201;
        Wed, 11 Nov 2026 03:07:22 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:21 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 1/4] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Wed, 11 Nov 2026 11:06:57 +0000
Message-ID: <20261111110700.3331225-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The WDTDCRm registers are not suitable for access through the SYSC regmap
from atomic or panic context, as regmap locking can deadlock when another
CPU holding the lock has already stopped.

Add a lockless helper to clear WDTDCRm.WDTSTOPCTRL and start the watchdog
counter using the existing SYSC register accessors.

Export the helper in the RZT2H_CPG namespace for use by the watchdog
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v8->v9:
- Rebased on -next due to devm_kzalloc_obj change

v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++-----
 include/linux/clk/renesas.h         |  6 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 7dd1f44b26e3..6ecf863b743e 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -103,10 +104,17 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZT2H_SYSC_BLOCK(x)		FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
 #define RZT2H_SYSC_REG_OFFSET(x)	FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
 
+/* WDT Debug Control Registers (WDTDCRm), in the block 1 SYSC region */
+#define RZT2H_WDTDCR(n)			(RZT2H_SYSC_BLOCK_MASK | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_WDTSTOPCTRL	BIT(0)
+#define RZT2H_WDT_MAX_INSTANCES		6
+
 struct r9a09g077_sysc_reg {
 	void __iomem *base[2];
 };
 
+static struct r9a09g077_sysc_reg *r9a09g077_sysc_regs;
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -963,10 +971,25 @@ static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int r
 	}
 }
 
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index)
+{
+	struct r9a09g077_sysc_reg *sysc = r9a09g077_sysc_regs;
+	unsigned int reg, val;
+
+	/* Sanity check: ensure sysc is initialized and wdt_index is valid */
+	if (!sysc || wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+		return;
+
+	reg = RZT2H_WDTDCR(wdt_index);
+	r9a09g077_regmap_read(sysc, reg, &val);
+	val &= ~RZT2H_WDTDCR_WDTSTOPCTRL;
+	r9a09g077_regmap_write(sysc, reg, val);
+}
+EXPORT_SYMBOL_NS_GPL(rzt2h_cpg_wdtdcr_count_start, "RZT2H_CPG");
+
 static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 {
 	struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
-	struct r9a09g077_sysc_reg *sysc_reg;
 	struct regmap *regmap;
 	struct resource res;
 	int ret;
@@ -991,13 +1014,13 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	if (!regmap_cfg)
 		return -ENOMEM;
 
-	sysc_reg = devm_kzalloc_obj(dev, *sysc_reg);
-	if (!sysc_reg)
+	r9a09g077_sysc_regs = devm_kzalloc_obj(dev, *r9a09g077_sysc_regs);
+	if (!r9a09g077_sysc_regs)
 		return -ENOMEM;
 
 	/* Only allow access in the SYSC regions */
-	sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
-	sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
 
 	regmap_cfg->name = "rzt2h_sysc";
 	regmap_cfg->reg_bits = 32;
@@ -1008,7 +1031,7 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
 	regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
 
-	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
+	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, r9a09g077_sysc_regs, regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c9495558cd5c..1e171db25eb7 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -216,4 +216,10 @@ static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *li
 #define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
 #define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
 
+#if defined(CONFIG_CLK_R9A09G077) || defined(CONFIG_CLK_R9A09G087)
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
+#else
+static inline void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index) { }
+#endif
+
 #endif
-- 
2.56.1


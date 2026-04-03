Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2530285406;
	Fri,  3 Apr 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206115; cv=none; b=QlR4j65EwGOjPN3tDGHn97IyYDn+CFCg7McfGnm/+//pTFCizb2p2Imn2CFCl4/QMhKMTdYt8L0oJIdmvgTS9andxE63+KrhnXTHUozGOMh952gmGTfMSICGl80widnBCSl7nKPAc4MjFRGqzN2xi2XGSaMp/XNQNRgIQwvpddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206115; c=relaxed/simple;
	bh=ZtKTpKYPoIVdUJ25mpfcGiRVpmcmaLoXuzuZNyrSqxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSkrry6An1IFm/Lf402NB18HmSV9Y2sWQzJiq2UoM4rpHwngjQajurQudGLoTs1E+VdEQVSMVk2vu70XmCe9Lz3vSoBU2dFj7VBRYjEV2t07WtvtBuzJJWxPCxhcczY2rIaV5bNoSO3d5er3hS7ilmQ15ysjK/Yug7w59XZcKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5259EC4CEF7;
	Fri,  3 Apr 2026 08:48:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] irqchip/renesas-rzv2h: Kill swint_names[]
Date: Fri,  3 Apr 2026 10:48:22 +0200
Message-ID: <aceab3fbc307ef428dfd62d8d846b68704dea012.1775205874.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205874.git.geert+renesas@glider.be>
References: <cover.1775205874.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array swint_names[] just contains expansions of "int-ca55-%u".
Replace it by formatting the strings where needed, to improve
readability.

Despite the two error messages can no longer be shared with the ICU
error cases, this reduces generated code size by 56 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
---
 drivers/irqchip/irq-renesas-rzv2h.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 6fa8141adcaa59f2..d075196bdc741c7f 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -755,10 +755,6 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 {
 	const struct rzv2h_hw_info *hw_info = rzv2h_icu_data->info;
 	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
-	static const char * const rzv2h_swint_names[] = {
-		"int-ca55-0", "int-ca55-1",
-		"int-ca55-2", "int-ca55-3",
-	};
 	static const char *icu_err = "icu-error-ca55";
 	void __iomem *base = rzv2h_icu_data->base;
 	struct device *dev = &pdev->dev;
@@ -774,16 +770,14 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 
 		virq = irq_create_fwspec_mapping(&fwspec);
 		if (!virq) {
-			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
-					     rzv2h_swint_names[i]);
+			return dev_err_probe(dev, -EINVAL,
+					     "failed to create int-ca55-%u IRQ mapping\n", i);
 		}
 
 		ret = devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(dev),
 				       (void *)(uintptr_t)i);
-		if (ret) {
-			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
-					     rzv2h_swint_names[i]);
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request int-ca55-%u IRQ\n", i);
 	}
 
 	/* Unmask and clear all IP/CA55 error interrupts */
-- 
2.43.0


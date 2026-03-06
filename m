Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519E225417;
	Fri,  6 Mar 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799224; cv=none; b=EoQ5s9X/hnTYf/fSk5agE9sOe2GcNcnzeDzwdj4kVxHttQh8RUETf150bNQba8LdwPIgC7kE8gTKlrr1uyZ3WOuW8SfAA/gCMosQzpC+gAw8JP4lVmWEunJWnjkU08T0NTX34g98t0ga03e1PgOsrYcatgt0IhTfzNrrdtNu9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799224; c=relaxed/simple;
	bh=iw+E3/j8x5Vhs1vzyIvjpZbYjczzSMklcBlspOG5m9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+G2YaHkDx6s363FZmWGjbZyfYtNAX2jiIV1v6wblFq7WH2gaR6V8AMqxWNM9sA2RmuIQOjdaQa0gWRncgM9JYh6NelsKdCgAU6oJhaNDWQxxw7F+xPmjCz3ukkXLjQkNELhyGpmfmZF4c1EAssJfbv9exL3hcIF2A6EYSchA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC0EC4CEF7;
	Fri,  6 Mar 2026 12:13:42 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] irqchip/gic-v3: Print a warning for out-of-range interrupt numbers
Date: Fri,  6 Mar 2026 13:13:32 +0100
Message-ID: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gic_irq_domain_translate() does not check if an interrupt number lies
within the valid range of the specified interrupt type.  Add these
checks, and print a warning if the interrupt number is out of range.

This can help flagging incorrectly described Extended SPI and PPI
interrupts in DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This would have prevented the issue fixed by "[PATCH] arm64: dts:
renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].

v2:
  - Fix off-by-one error in PPI range check.

[1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be/
---
 drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab22faf..9e97505d4b767043 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		switch (fwspec->param[0]) {
 		case 0:			/* SPI */
+			if (fwspec->param[1] > 987)
+				pr_warn_once("SPI %u out of range (use ESPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 32;
 			break;
 		case 1:			/* PPI */
+			if (fwspec->param[1] > 15)
+				pr_warn_once("PPI %u out of range (use EPPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 16;
 			break;
 		case 2:			/* ESPI */
+			if (fwspec->param[1] > 1023)
+				pr_warn_once("ESPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
 			break;
 		case 3:			/* EPPI */
+			if (fwspec->param[1] > 63)
+				pr_warn_once("EPPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
 			break;
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
-- 
2.43.0


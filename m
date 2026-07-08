Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267273F7A8C;
	Wed,  8 Jul 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503606; cv=none; b=f90CJZrAIecEKNVZZPwqhlaqqmUIeLc8T1+PKhSqAGVJEHfaIZhQkQyhODLjhCdTjQgAReKHk2sgtvejDY6XisplO0hppnvb2fH3VnpqDo3T93n+PXdZOyBlu1+KrXLGL/vP+qriFKMka+yM3rsBdXlm9hwfS7MBulkNmUsycpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503606; c=relaxed/simple;
	bh=Dgi4zJSRBR4tTAMxRAVsOIdCbQmmsNIvCebfKJQrVxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ucdWbHsLgDA+ZNq4ocng8ZEpfUBTemI1LIZLO4oUOI9dwFakQUDcbfbdKQa8aeknI7VRSsqe/P/4aN22IAG8a9X/190MeL9mh7+II0Jfl1q4+zgZot8OThpjyy96h2+K13YOlTB3q3C7EiFtqSUTn3MJaowm9zPI7brg3uIIXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O1MiNJa5; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="O1MiNJa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BN
	3JMg0HYmw0vU84AVFHk2ryR5gBgwYoUDQjnI9SpYE=; b=O1MiNJa5Vkhf+7DN5N
	ntbVM1H9ZnbMZQik5IEUtV27GspaiJiCDuBUD2NpKj3qw5d+zHcYpdGxlOMtTXg/
	cD+g7+vN7UKEmh2ixF37RY7OhDYjAwL7h4z90l8mXHIV/8bH7nshL0R5V9lCG/WR
	3BvTi32Yk9z33uvAIAeLeBeMU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnN5K1Gk5qaNc6Ig--.55155S2;
	Wed, 08 Jul 2026 17:39:02 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v4] irqchip/renesas-irqc: fix generic interrupt chip leak on remove
Date: Wed,  8 Jul 2026 17:38:49 +0800
Message-Id: <20260708093849.501946-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <874ii9svk6.ffs@fw13>
References: <874ii9svk6.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnN5K1Gk5qaNc6Ig--.55155S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xJFWDKryxZF1rJF4kXrb_yoW8ZFWfpF
	W8W345Zw4UGryUZw17CF48ZFyYq3W3t3yak34rG34av3W5Gw1DWF9FvFWqvr12kay8Ka1Y
	vFs8Gay8Wa4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAhLUUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwhbhrGpOGrZ34wAA3F

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove, the generic chips are not automatically freed when the interrupt
domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic interrupt chip
suspend, resume, or shutdown callbacks after the driver has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by setting IRQ_DOMAIN_FLAG_DESTROY_GC on the
interrupt domain; this lets the interrupt domain core automatically
release all generic chips when irq_domain_remove() is called, removing
the need for manual cleanup calls in error paths and remove callback.

Fixes: 99c221df33fbfa1b ("irqchip/renesas-irqc: Move over to nested generic chip")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index a20a6471b0e4..4b8b86c89b6a 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -194,6 +194,9 @@ static int irqc_probe(struct platform_device *pdev)
 	p->gc->chip_types[0].chip.irq_set_wake	= irqc_irq_set_wake;
 	p->gc->chip_types[0].chip.flags	= IRQCHIP_MASK_ON_SUSPEND;
 
+	/* Automatically free generic chips when interrupt domain is destroyed */
+	p->irq_domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
+
 	irq_domain_set_pm_device(p->irq_domain, dev);
 
 	/* request interrupts one by one */

base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.25.1


Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F6CA4E;
	Wed,  8 Jul 2026 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476613; cv=none; b=kHPwhZTbAca9XxL1zDRcsNYchxBOkIFAPe3coud/1MCeKB3VlYn5hqHhjz+LG24pwVk7DBkTc8sv8G61BcWbH/9rBz6ZNd/RWOnGVS0clwlw7/S6QV3Oy0qKWx9vm3xfCxG7zKvgW6HPKSP8JUSqaurdeekzK7jStyx0Doou8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476613; c=relaxed/simple;
	bh=J+SZUfqic6/ltANCTK9VK8yT70fLsWGOY2qGxrOvwIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=as6jf5NFVj2WQafAFfGNqouzHKczCoejoxYFGWbdr9zMTSB52gYuV1RDr0UMs3Zd9/+Auakw2oyPv2wOtzrNN4mtAz/J4id7p+cNNuq6cmRom99/hZiXrt5qSmrFHlPxh/3G47wrHJnFVOyx/uhmDncgZi3aUZxtmDuAXsMbvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dk0gwcII; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dk0gwcII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=T0
	IoP/9Oalyij3Arr8NbBDMufKM9vtzr6NDd31RAFlM=; b=Dk0gwcII9eTjo/7EXa
	GoKh8ARPdIFJnbP7XFjH+5lqlp49XT/3XnNuUqCty0lPPiIXr7yKTG54L9IkRT/C
	fhXw47+PNVcPJm94eGWDy/uyRl4VPSAme1DynoXpCiFTqAr+LYmWWGPgMW2GRwO6
	rntLlF9TJT88gC4xc9apzjXC8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAHFldOsU1qLYw_Hg--.62619S2;
	Wed, 08 Jul 2026 10:09:19 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-irqchip@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v3 RESEND] irqchip/renesas-irqc: fix generic IRQ chip leak on remove
Date: Wed,  8 Jul 2026 10:09:02 +0800
Message-Id: <20260708020902.429126-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMuHMdVGM6YZ0xm2RzBRK+nf=G1-sB8DOjzLO7=OetZS_WcHXA@mail.gmail.com>
References: <CAMuHMdVGM6YZ0xm2RzBRK+nf=G1-sB8DOjzLO7=OetZS_WcHXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHFldOsU1qLYw_Hg--.62619S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xJFWDKry3tFWDZw17GFg_yoW8ZFy5pF
	4xu3s09r4UGF1UXF18Cr1kZFyag3y7t3y7ta4SgwnIv345Jw1kWFyqqFWjvFyjkay8Ga1a
	vF4kXay8uFyUAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYdgAUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6g9tOGpNsU-ftwAA3B

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove, the generic chips are not automatically freed when the IRQ
domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the driver has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
both irqc_remove() and the probe error path.

Fixes: 99c221df33fbfa1b ("irqchip/renesas-irqc: Move over to nested generic chip")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index a20a6471b0e4..a340d27dd8d7 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -211,6 +211,7 @@ static int irqc_probe(struct platform_device *pdev)
 	return 0;
 
 err_remove_domain:
+	irq_domain_remove_generic_chips(p->irq_domain);
 	irq_domain_remove(p->irq_domain);
 err_runtime_pm_disable:
 	pm_runtime_put(dev);
@@ -222,6 +223,7 @@ static void irqc_remove(struct platform_device *pdev)
 {
 	struct irqc_priv *p = platform_get_drvdata(pdev);
 
+	irq_domain_remove_generic_chips(p->irq_domain);
 	irq_domain_remove(p->irq_domain);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);

base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.25.1


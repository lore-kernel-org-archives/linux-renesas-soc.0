Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD88D3F5BE3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146333; cv=none; b=mCGYQCDExgvHJQ1VgR2xS8uTo0czdhKGVbvSXoYrUaEUBRzhpkXl3XgelmpuebtwbwZEDS7VBnBL5KpUSUxAHV4684ZLGkC40wpDHVsSLazFCQJyWDEoBEdBJjeBFpt11RrwG3yJx5FIovMMEufFXA52sPKfDJ+y7ApgkX3+mEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146333; c=relaxed/simple;
	bh=pw9oD6T8ziDz5AocQMGcjo0IE2svVURl/d7HMaclxQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVQ1mkC4j5YQjfRhwB90MYcLd1UpiXvPu+L+EWx+57jyzwc2A+Z6K1FSHnMpp1UQHdo6vwuXy+UBBb+GVNuTZUZF8R7E34vnS8IKNiq6aZfBzCa4Zf+e5a/okzBs4c56R0a24TcdbI3Q+DqE6YhJzwWviqAUc+plSq4VO+onKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrLdeVx5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrLdeVx5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1568636f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785146330; x=1785751130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWJlDdWHxmS1QqPm+cNMQ7ctsiEfAw9CC6zmRyAodTQ=;
        b=DrLdeVx5dL+qr9TOy6BffyKxdqTAxlxPzpCVdg7NAJFv3MdNh5Pagr9YZ1NzFTqnix
         cv+ZdOvf26XckfZ7/51+TkfRya9t+XAYdh7anwBgTZJMYnJOWktPLMZPcQDxZertbc9U
         N3oiOP7MfA6kHad/EQ4rNh68wfHwZe9Cxmr16RFnBW5NupD+2AuZCx+mZDKeRZJTv7NQ
         W3Saj7/E1ugItFbrTnUJAv/cUaiAo2RHCB5qPp8ETz6lpD6J0a83U/PCKJ31qfbyoSui
         kInM9FElS+5IjYkf2JuVgFX5VZ5afnuQVsHrzuc43XNHuBw01zBYRoUxLaSqpjciOaja
         8EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146330; x=1785751130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWJlDdWHxmS1QqPm+cNMQ7ctsiEfAw9CC6zmRyAodTQ=;
        b=AMxbcrovnZ6M1Os0NEf7n4DyP8lj8K6W//P123v7dEYayOEpKGhVUVNUotrRVU2wLR
         +0TjQbumAE2WGp/sRhZz5D/KxSHON/ltIHj83zV5fzvTDS1B/v2WzwXde/RBykda0Acj
         OA+1wMHKVtCCuumwbZV+OqhFQe5RfL0vvmq+ycspitLKmg4amvtMQvTMkVTL/DS6l48y
         T+rd6Cd927UBo2azr2pIbDDZcvwzu8dgkg9wQGnHvDPc+rByW1RylxKYg9xrhlYTJPHu
         CcVfzvlnF3wC74+wXjLrxyYbwRxpWvOpKzgI2i7LKxSu/tKm6ELqAh1n6bIkIrK2VyEb
         5v5g==
X-Gm-Message-State: AOJu0YzAIfWonEXquSUATmSZq3tgnQPaoyX/mmvXw+8LGo54bNKZ/Qgt
	8gsfq8OaKgHye3wQGoZvV31mqnZ+tjRITqdq6n60j+9xjzEjOcJJ5Sht
X-Gm-Gg: AR+sD10GHi3pZOPd4mjkiizL53bvXQXBLtksbcQ6yDjRvWrGtqSHQKxksoGr9U+6XmM
	7ivZYlykXgMYKrm2TQGekvb0SRsFf5hF8Ny276rfkbNxPxku6luUgreEHD2NngSVvhfqbNEzzzd
	gLHC/0MpmOhyh8tsX0lcCpp5UZXQGRBsCdNiahCXyY44Z7ZYFhJQ3mhG9dw4hlTyfh7SHxathi2
	IIbk/Bk8SoxKDH6gq1lqJoVLv3KCNdE0wwyBhu7SueJ0f8yKYJ9J+x7yOehrxx1ug+gmFxikNIW
	4OM9Clf78ml786OEznni+ZrFTpbWTwUW70cYjs8wM26XV19/OJbKRZ5gHUbdHUlCCoTcxYo2lt8
	ClqoLqHD2lqAoSqOBRu+VCSiKSazptnJi1CwC+Veo5R7zFeyxO6R/IfV+oukh5BGK8oM6F4uvKY
	kr2EFud2V5JXzL3gS8OWJ+xoF2ARVd5XleToX7S2NF8yv8Lx11ScITHLV3gywlUEFqHnQTQ4dsc
	Q4IT9pzRmHnoVif
X-Received: by 2002:a05:600c:1c05:b0:495:607e:5ed6 with SMTP id 5b1f17b1804b1-496b6a31f1dmr94038395e9.31.1785146329650;
        Mon, 27 Jul 2026 02:58:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm238346295e9.1.2026.07.27.02.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:58:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] PCI: rzg3s: Fix IRQ domain initialization error handling
Date: Mon, 27 Jul 2026 10:58:43 +0100
Message-ID: <20260727095843.116950-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rzg3s_pcie_init_irqdomain() installs chained handlers for the INTx
parent interrupts before creating the INTx irqdomain and initializing
MSI support.

If any subsequent step fails, such as obtaining an INTx IRQ,
creating the irqdomain, or initializing MSI, the error path returns
without removing any chained handlers that were already installed.
This leaves stale handler and data pointers attached to the parent
interrupts.

Fix the error path by unwinding the chained handler registration before
returning. Also clear the chained handlers during
rzg3s_pcie_teardown_irqdomain() so that teardown fully mirrors the
initialization sequence.

Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Restricted the code to max 80 columns.
- Moved calling irq_domain_remove() under err_cleanup_intx label.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 49 +++++++++++++++++-------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index f51b5d7c1998..70f1faf7e422 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1006,22 +1006,35 @@ static const struct irq_domain_ops rzg3s_pcie_intx_domain_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
+static void rzg3s_pcie_clear_intx_handlers(struct rzg3s_pcie_host *host,
+					   int count)
+{
+	while (--count >= 0) {
+		irq_set_chained_handler_and_data(host->intx_irqs[count], NULL,
+						 NULL);
+	}
+}
+
 static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
 {
 	struct device *dev = host->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	int i, ret;
 
-	for (int i = 0; i < PCI_NUM_INTX; i++) {
+	for (i = 0; i < PCI_NUM_INTX; i++) {
 		char irq_name[5] = {0};
 		int irq;
 
 		scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + i);
 
 		irq = platform_get_irq_byname(pdev, irq_name);
-		if (irq < 0)
-			return dev_err_probe(dev, irq,
-					     "Failed to parse and map INT%c IRQ\n",
-					     'A' + i);
+		if (irq < 0) {
+			ret = irq;
+			dev_err_probe(dev, ret,
+				      "Failed to parse and map INT%c IRQ\n",
+				      'A' + i);
+			goto err_cleanup_intx;
+		}
 
 		host->intx_irqs[i] = irq;
 		irq_set_chained_handler_and_data(irq,
@@ -1033,21 +1046,29 @@ static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
 						     PCI_NUM_INTX,
 						     &rzg3s_pcie_intx_domain_ops,
 						     host);
-	if (!host->intx_domain)
-		return dev_err_probe(dev, -EINVAL,
-				     "Failed to add irq domain for INTx IRQs\n");
+	if (!host->intx_domain) {
+		ret = -EINVAL;
+		dev_err_probe(dev, ret,
+			      "Failed to add irq domain for INTx IRQs\n");
+		goto err_cleanup_intx;
+	}
 	irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		int ret = rzg3s_pcie_init_msi(host);
+		ret = rzg3s_pcie_init_msi(host);
 
-		if (ret) {
-			irq_domain_remove(host->intx_domain);
-			return ret;
-		}
+		if (ret)
+			goto err_cleanup_intx;
 	}
 
 	return 0;
+
+err_cleanup_intx:
+	if (host->intx_domain)
+		irq_domain_remove(host->intx_domain);
+	rzg3s_pcie_clear_intx_handlers(host, i);
+
+	return ret;
 }
 
 static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
@@ -1055,6 +1076,8 @@ static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		rzg3s_pcie_teardown_msi(host);
 
+	rzg3s_pcie_clear_intx_handlers(host, PCI_NUM_INTX);
+
 	irq_domain_remove(host->intx_domain);
 }
 
-- 
2.54.0


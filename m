Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B19F390200
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478503; cv=none; b=dYnIkiyLFYf8W/+LuFOGLgUcPsT41xVOSNkMi0BRnz6PMoSzP80Gq3sDGNbNo/1ABx9W6EWJ1rrukUJyk/myXf+mMOY5gwJKVo6yNtFMG+W/Cc+vUvWA6XATc2CVAih9PtQ9ZsG4POXlIMdIjY+oSXKa7ioqKUgS8S+8MI12pDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478503; c=relaxed/simple;
	bh=hrmzmVrvGWTP1LsYT+VaNgqVj1es0y60dQVMTGpF/os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhDc1uW0f7pIOZ+NHAuB4ZpUtgQoUfS72gs/XeetaFKyJSL7mKeJF/HQcW47uFOZOsT4qUO2b5/1EPzJ4sf2fQEoW0UM6/8zR7b0IJmw4+Rpf0E8gFIEse5Gst2+LQKuS/laGu8Tnm3T2kopwB1Fm76nlTyKmMYYlPgdSZnSybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btYJmYUX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btYJmYUX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso210706a91.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786478502; x=1787083302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lduyi+JxRXbKGNM1YQ1o6cUDvymR9U7AMupOhybXW/k=;
        b=btYJmYUXlpREXv9W0k6m90altQpe8tT5hxMwqseejOyH/T1BTDK5sLWh/2VjerfhSx
         Ca9LPABZeG3nXa46/HA6DYYP+R2nKv3LQl+drsIokbwyQckIoABGoY9BteBaEDFWu6nI
         DOiJDTfimXqaSJnHlqKl1wMD92PbvEH0P4itAAm6jJys8lIDajDl5LcjozvC4fhzxte9
         sXg2YIsRn4Hb/8DlEk8mzk/3MzpUvfGJg6lLWKvCgGrynzHPhIvWhfdDfX+7ey319Dgx
         pehP4/R6QC0EmTQN7lgZQPWj7fBmv+BQPY41IXfIdBxrb66sqLQPqjf3pssd1kjqeQIY
         LhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786478502; x=1787083302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lduyi+JxRXbKGNM1YQ1o6cUDvymR9U7AMupOhybXW/k=;
        b=OM1OyIPiUpKBHuXlwDYsMSoUw/IkZMjC1Wxt8GfGZtj5X/ZgfzzhRcG9RvYlvdfoWR
         dSEGxjSS/v+0iI78Hzf0o2RZRJAf8UJf0v5CAHkqAbYx8X52SwNTpLqZjF43n4AaOv/c
         1HsFtUzSZ+5X4AKIVUTGewyqQV1ZXvmFXw9eYzLQBFlT0KTQFQv60rWU7UTKCgy90NU5
         eJoCBZCzaH577l0ilICZZyFewjPGzBh2U4TTwUxoVlsnBTyYofYJFWo0z2OBzWJ3kPZs
         Wtn4Ufc29KyLINl+FQiQuipZjiF6ApBI5oIWwrdZIb4JdJ2WAdHnUDoo8rpIzq6G3NWA
         EH8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp1BGq7RObCUNmQEUXDAyj0wPQPfH86GBJG/6VTJbKbG0AyyY+iFDcZOYFiqlK76qcygrR7gxQPg8z6qrNxXZxFIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVMrSQwyzEB5nkKSlHDU4fV/b6G7iaYU12BIkH3166ZtAKFX6
	ykSX+VEK5JFngU+3Fzo+4aDJD8lk43ntd3wXP4p/h/BraqNA7kcQ1NPH
X-Gm-Gg: AR+sD13usrIu7n7d5MdneO66C4Nnrpm7v3D0hF2iw+vGQW0wy5/Aq5dGpk7COAJi5Pj
	7U6iv+Xelalo//ygCnwf83/gOw/KyKDe2JIka6idjQ5hyMThr8mRt0PESZGzh7JHf7KfGAaluY0
	+balhppiOIO5i0fv3rln+cwCltJqb8GFOhlLQP+ly7cGwNeDlAtZFRkTeo5cqZSaKJOt24clV3h
	sWPtrtWi2NYPAmk6gxALyzFPhaHyIrmSc8WTAfbjOGUjH/iKWZa7kN2R2TSOY22t4eGIgjKuGn5
	o8473wOqgLxy1ysoGUGu3CWIsA8Ma+KiEpFvRCw9/o7JYzCNzgHDaZALbuaS1ag5/wkPV5Aauv3
	1T6DYXKjjMp0nxptgoWUzBX2G7P8sYXLnVokw4zSWtRI85WZg52Bp+4K12gyteiT2k4Edq4C6yF
	dEajjZ2lKlSgDFexd1Djx1zHbnL56WVN3eg+dZY3MsTT4mILiz10XSHxO6vcTe2vrJ93A8IFH6b
	Uzt95ROxDFt8ein8y0u7SoYjzz06cSjJMRmcaEXAyzxvJ8sU+OCavR9G+Ipx+6iAMkXg9T5/coL
	iUZ20l6m5A==
X-Received: by 2002:a17:90b:4c89:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-392ec396095mr5951201a91.3.1786478501719;
        Tue, 11 Aug 2026 13:01:41 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:ceae:5da9:e5f2:ea74:b6c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6791351sm2216447eec.23.2026.08.11.13.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 13:01:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] PCI: rzg3s: Fix IRQ domain initialization error handling
Date: Tue, 11 Aug 2026 21:00:13 +0100
Message-ID: <20260811200013.185956-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811200013.185956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260811200013.185956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a helper to tear down the INTx IRQ setup, including removing the IRQ
domain and clearing the chained handlers. Use it to unwind partially
completed initialization and from the normal IRQ domain teardown path.

Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Added rzg3s_pcie_teardown_intx() helper to remove the irqdomain
  and clear chained handlers.
- Updated commit message.

v1->v2:
- Restricted the code to max 80 columns.
- Moved calling irq_domain_remove() under err_cleanup_intx label.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 50 +++++++++++++++++-------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index f51b5d7c1998..3f7393c49a08 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1006,22 +1006,38 @@ static const struct irq_domain_ops rzg3s_pcie_intx_domain_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
+static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host,
+				     int count)
+{
+	while (--count >= 0) {
+		irq_set_chained_handler_and_data(host->intx_irqs[count], NULL,
+						 NULL);
+	}
+
+	if (host->intx_domain)
+		irq_domain_remove(host->intx_domain);
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
+			goto teardown_intx;
+		}
 
 		host->intx_irqs[i] = irq;
 		irq_set_chained_handler_and_data(irq,
@@ -1033,21 +1049,27 @@ static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
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
+		goto teardown_intx;
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
+			goto teardown_intx;
 	}
 
 	return 0;
+
+teardown_intx:
+	rzg3s_pcie_teardown_intx(host, i);
+
+	return ret;
 }
 
 static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
@@ -1055,7 +1077,7 @@ static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		rzg3s_pcie_teardown_msi(host);
 
-	irq_domain_remove(host->intx_domain);
+	rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
 }
 
 static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553983;
	b=Xg83X5ivcCjm2N1gMaB4Z4TK3TafcOKQYXhFacjwuvmfUpF2xyNzwWcmIycK98SUQiyu
	 0iAWFME49t8J4SAtmYP0CETd1+VC48fJ2gJ0q8NzKT3AtoUxgdmSubumADGp75qRFWgtj
	 wrSRJ4r0J9x3BKE7vNgSeFVuUw3yQFhhDBcOu11kUD6XXj126wadTr2PXoKB+EodxkzO4
	 UHTgd26435/cvFYBMh1n/0mgeFSTSKZcMOWKUDLzyChLq4HPnh3gEPXO17CvaE7l+m2wW
	 sh87nAs6+lvsmlP49HN+eGbr4eBKFVt1V4BZJsAd+Y8vMgB7grwzvoPh3kF6IuzpQug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553983;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=OBCtFqUMq8lyKwq6C0SlRO4azCv4v9nWsThotF1xxZM=;
	b=YYoSAtIRkl1UvqerQUO8aZUzsrKnIdV/jzKmJPuxFDC8lJE+um3TWkMDE3QI2tQ/5IlL
	 +V65/CoACFTdtYNW8I/ot4VvUwYLP69cAaHxaq41w4PjQ3+zqNhZRetDXgwE1WF+5elC1
	 lddvYSQL0V4OZLex/oafrceVVIW40XXMMHOHKeii8JmhcFjv3ufBSQudXDS7H/6tuja2j
	 LcJlg0r4n3aG4l8HXUyY2G9Ru2WXrhlZDjUWuhwwBpf0VAtyGMv6tel5OjDtw8nmPePzq
	 yT4Dm7u3EblnfFwgYcZIRLtZ10UUTjT/QcTO0BWIr2PcdAh5hwc4vciEnDlhUzCnhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CE606A327
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8CE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5L059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 07/19] cache: andes_llcache: clean up cache inv/wback functions
Date: Fri, 13 Nov 2026 15:11:31 +0800
Message-ID: <20261113071143.1446167-8-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
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
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CR5L059129

Replace open-coded cache line alignment with ALIGN_DOWN/ALIGN helpers,
initialize line_size at declaration site, and use !size instead of
start == end for the early-out check. Drop redundant blank lines.

Also declare pa in andes_cpu_cache_operation() as phys_addr_t, the type
virt_to_phys() returns.

No functional change intended.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 61730e218afa..3c271e1e49bf 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -65,7 +65,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
 	int mhartid = smp_processor_id();
-	unsigned long pa;
+	phys_addr_t pa;
 
 	while (end > start) {
 		csr_write(CSR_UCCTLBEGINADDR, start);
@@ -101,21 +101,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
 
 	local_irq_save(flags);
-
 	andes_cpu_dcache_inval_range(start, end);
-
 	local_irq_restore(flags);
 }
 
@@ -123,15 +119,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	local_irq_save(flags);
 	andes_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
-- 
2.34.1


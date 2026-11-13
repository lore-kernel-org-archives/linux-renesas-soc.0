Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553973;
	b=FXBbTCdRhZoySlMTgzkfyokTiDgU/nhvtiBkMV86SvUvDpFpjYEBnamHMbfR9cAjnXh9
	 GIVVQFvpYaWZvSEI4/qHN+TwCsVXA+g5th3IJRmVQuLqi+Bs/GW7pdVJfARX27SmRO5Dp
	 6BeVqrcaEDxDjWeeNAWOy1y/PiY+pXHWm9OMQjPGIOxshjhcKPO18jV4v8sSV6rJy6ljr
	 2xkvEVa3GwGz4Oa/snflHuQ0s6bc3tE5qx41s/jY5VMvfUzywSgUzkngTQK59+SBVpU0u
	 95P0u8DOtVthVzHnGQnS2MzfgOCWZepgVSAwgOg4gi6yYA5BeXwIcatb2PyxOiUf/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553973;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=NVJ0WiIfFef9O4cBLjqcI5WEkkFGixq4fGLXcWcG6E4=;
	b=a/NxKLNP7qkjXOlN5BG2ZjQ8pf2jyGyvLW8/Pcs7qfMkAagnIjScAmSUvFqHqR7bzxqb
	 a/x2doovvQtjYwR5SOkjWSM81NGw3Wc6NWDVYXpvyYAZyx741z249jj/JXHA+q0G6Q9VF
	 yrNhXkDao+Ppn3gpu+oUoalnW+BHr4PdrFbUxMv1N34XDgA9IgSPbEoH6gu0LBsCGmSni
	 v9YyWGAWFHxAtH7V3K48JrOFiLhd2EchYyVZ9b3u/8LvGIq/6/C4djnI7wofR7Uv32jKv
	 V/wxxgWFV4IihlfYF5vUpEjj/aKe0z4N2KU7brVxQdYhYQhtIzHJgkIcQzP/1vT7xSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A36606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CSCw059145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 05/19] cache: ax45mp_cache: standardize macro naming for LLC and L1D registers
Date: Fri, 13 Nov 2026 15:11:29 +0800
Message-ID: <20261113071143.1446167-6-minachou@andestech.com>
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
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CSCw059145

Rename macros to follow a consistent naming convention:
ANDES_{LLC|L1D}_{REG_}CCTL_{operation}_{target}
- LLC or L1D: which cache level
- REG_: present for register offset macros
- CCTL: cache control operation
- target: C0 for core 0 base, BY_CORE(n) for per-core variants

This is a mechanical rename with no functional change:
- ANDES_LLC_REG_C0_* -> ANDES_LLC_REG_CCTL_*_C0
- ANDES_LLC_REG_CN_* -> ANDES_LLC_REG_CCTL_*_BY_CORE(n)
- ANDES_CCTL_L1D_*   -> ANDES_L1D_CCTL_*
- ANDES_CCTL_LLC_*   -> ANDES_LLC_CCTL_*
- Use GENMASK(3, 0) instead of 0xf for ANDES_LLC_CCTL_STATUS_MASK_C0

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/ax45mp_cache.c | 55 ++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index b3d6f6a11cfc..61730e218afa 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -16,34 +16,33 @@
 
 /* LLC registers */
 #define ANDES_LLC_REG_CTL_OFFSET		0x8
+#define ANDES_LLC_REG_CCTL_CMD_OFFSET_C0	0x40
+#define ANDES_LLC_REG_CCTL_ACC_OFFSET_C0	0x48
+#define ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0	0x80
 
-#define ANDES_LLC_REG_C0_CMD_OFFSET		0x40
-#define ANDES_LLC_REG_C0_ACC_OFFSET		0x48
-#define ANDES_LLC_REG_STATUS_OFFSET		0x80
-
-/* D-cache operation */
-#define ANDES_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
-#define ANDES_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
+/* L1 D-cache operation */
+#define ANDES_L1D_CCTL_VA_INVAL			0x0 /* Invalidate an L1 cache entry */
+#define ANDES_L1D_CCTL_VA_WB			0x1 /* Write-back an L1 cache entry */
 
 /* LLC CCTL status */
-#define ANDES_CCTL_LLC_STATUS_IDLE		0
+#define ANDES_LLC_CCTL_STATUS_IDLE		0x0
 
 /* LLC CCTL status cores mask */
-#define ANDES_CCTL_LLC_STATUS_C0_MASK		0xf
+#define ANDES_LLC_CCTL_STATUS_MASK_C0		GENMASK(3, 0)
 
 /* LLC operation */
-#define ANDES_CCTL_LLC_PA_INVAL			0x8 /* Invalidate an LLC entry */
-#define ANDES_CCTL_LLC_PA_WB			0x9 /* Write-back an LLC entry */
+#define ANDES_LLC_CCTL_PA_INVAL			0x8 /* Invalidate an LLC entry */
+#define ANDES_LLC_CCTL_PA_WB			0x9 /* Write-back an LLC entry */
 
-#define ANDES_LLC_REG_PER_CORE_OFFSET		0x10
-#define ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET	4
+#define ANDES_LLC_REG_CCTL_CORE_OFFSET		0x10
+#define ANDES_LLC_CCTL_STATUS_MASK_CORE_OFFSET	0x4
 
-#define ANDES_LLC_REG_CN_CMD_OFFSET(n)	\
-	(ANDES_LLC_REG_C0_CMD_OFFSET + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
-#define ANDES_LLC_REG_CN_ACC_OFFSET(n)	\
-	(ANDES_LLC_REG_C0_ACC_OFFSET + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
-#define ANDES_CCTL_LLC_STATUS_CN_MASK(n)	\
-	(ANDES_CCTL_LLC_STATUS_C0_MASK << ((n) * ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET))
+#define ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(n)	\
+	(ANDES_LLC_REG_CCTL_CMD_OFFSET_C0 + ((n) * ANDES_LLC_REG_CCTL_CORE_OFFSET))
+#define ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(n)	\
+	(ANDES_LLC_REG_CCTL_ACC_OFFSET_C0 + ((n) * ANDES_LLC_REG_CCTL_CORE_OFFSET))
+#define ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(n)	\
+	(ANDES_LLC_CCTL_STATUS_MASK_C0 << ((n) * ANDES_LLC_CCTL_STATUS_MASK_CORE_OFFSET))
 
 #define ANDES_CACHE_LINE_SIZE			64
 
@@ -57,7 +56,7 @@ static struct andes_priv andes_priv;
 /* LLC operations */
 static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 {
-	return readl(andes_priv.llc_base + ANDES_LLC_REG_STATUS_OFFSET);
+	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
 
 static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
@@ -73,11 +72,11 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_LLC_REG_CN_ACC_OFFSET(mhartid));
-		writel(llc_op, base + ANDES_LLC_REG_CN_CMD_OFFSET(mhartid));
+		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
 		while ((andes_cpu_llc_get_cctl_status() &
-			ANDES_CCTL_LLC_STATUS_CN_MASK(mhartid)) !=
-			ANDES_CCTL_LLC_STATUS_IDLE)
+			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
+			ANDES_LLC_CCTL_STATUS_IDLE)
 			;
 
 		start += line_size;
@@ -87,15 +86,15 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 /* Write-back L1 and LLC entry */
 static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
 {
-	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_WB,
-				  ANDES_CCTL_LLC_PA_WB);
+	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_WB,
+				  ANDES_LLC_CCTL_PA_WB);
 }
 
 /* Invalidate the L1 and LLC entry */
 static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
 {
-	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_INVAL,
-				  ANDES_CCTL_LLC_PA_INVAL);
+	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_INVAL,
+				  ANDES_LLC_CCTL_PA_INVAL);
 }
 
 static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
-- 
2.34.1


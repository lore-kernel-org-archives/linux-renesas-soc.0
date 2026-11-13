Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554013;
	b=nt36P/9MYkfa/LkV/SyZQAf8F0gi4tBRoV6Nai/nkGJjOR09gLTbprKgnHnlmUkuTZDQ
	 g3cIIl4i8ZjjSEu/hNu/k0rcxvI0wvIwIsaffHs1hIuiw9SZPbTNMRQGCb3r9clqWdE4t
	 IBKhipF7PHwPELMM8tNXO4yS/8yazVezoj0jxfYWmu0RZ71tbuKMgbZppxEus3zlQUnNf
	 RRqzKCk0QjY/dn3Iq02B3zqUvAa5R+EVFma3hi4/keBx50+HB5PHiNA3e77H8AnuJ9Zsb
	 FvCgAeYdAg++famJP9UFyfHrvH/JlYESft64PAUPFZXzxE64BL2KRMxAB9+qYEY1whQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554013;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=LUqF/I1QRJINbOzXKJaSp3rR1YzOHCwYnM62PJl+3oQ=;
	b=3XxwKGRw5B6kE+AU0FrmFg4ucu3UWkUjoQ/Hfv/9IRe7GvZFb9m0RUQ/yIoJmy4fEeKp
	 pXptoqvO+/6hs0NBtZoguoGkqX2AoIcor9DofRUHc7WMmEWvhynEzj3xmltvZ+LeIIk6V
	 cXo1PUn2sd31OuciSLOhBHGliz3WtZyO9qjwI+r3IokOrGRO3uyTT501s85OTaLAcr5es
	 4RwQVW2EVEkZ6mPCaYmG1vYtjnkzLvhr2SfYf/A1VIOz5YX20v5WCceidFXaSykcFCYLK
	 +DZQxwLaOwMS7WRy2BadE+PR9b40mEdmNU40Pyq44AW2VJwFF4U77uDfxANBdLjLULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6A60A383C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B6A60A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CTA2059147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
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
Subject: [PATCH v2 09/19] cache: andes_llcache: write the full physical address for CCTL
Date: Fri, 13 Nov 2026 15:11:33 +0800
Message-ID: <20261113071143.1446167-10-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CTA2059147

The CCTL access line registers are 64 bits wide and hold the physical
address for PA-type CCTL operations, but the driver writes them with
writel(). On RV64, a physical address above 4 GiB loses its upper 32
bits, and the LLC operates on the wrong line.

Write the register with writeq(), using the lo-hi helper on RV32, so
that the whole physical address is always written.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 0aea1389f291..bf49dbcb080b 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -8,6 +8,7 @@
 #include <linux/cacheflush.h>
 #include <linux/cacheinfo.h>
 #include <linux/dma-direction.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/soc/andes/csr.h>
@@ -72,7 +73,8 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		/* The access line register is 64 bits; written lo-hi on RV32 */
+		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
 		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
 		while ((andes_cpu_llc_get_cctl_status() &
 			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
-- 
2.34.1


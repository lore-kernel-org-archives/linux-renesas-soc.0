Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554015;
	b=OwroiqLvfGDk0LB0m6z1eAKOgx3gNtIivQqa4WxkWLiWN0CMa7n8eowgKFo3j1LqboR6
	 hhMCt3cpsK40gG1DSzv5pgZwjka13N0ODxTtJP7GkBSTq7dZrIEe29od4I2ExJ7RyfXOB
	 xGMA/kfzQJ0KcDWuwzv7TuOSUC66HBT616EJjCVb0x+Kc3d+aL/nADwMcNrkKc1Vb4ad3
	 chGECQOTxEJfBkozFp3nCYwkBaVcEgsxKeUc3N8vDPhUUsXtaCTh8zoxh2tuKqPVYFr/Q
	 xb22VAb4gZhn+2PIxPcu4hnQkhq7lTIJS0sId4CcSVlncZskouE7xWGMPgBxNUxk2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554015;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=ITK++NC16JX4olq7PrhKzbIXfbalItLkFwYZjbNjD5o=;
	b=yvXFoBnnFbw7ASvPcg4E7/1DOeBrCnfYFDQO8+eSxL+Y42FL0pKkZEKo2W0Phav7UrUq
	 lbbzU7rX3pSk6R+pAxyQOsmZEzJC9EAQ7PoifgQurX6qo5ZiV/PzJ9D/5qEICv0DkJ4Yl
	 gWCxkXP931KpVrI2x1ApZZigRNDpl1RlAZgyRIXA/Z56VhKyx9nXAeQyEZa4EkDv7aMWP
	 PJRDZW4HXm/VraQ4FFVf23FQXbiYGjOSeP/5NnZ4vHTlpYXr0Uns+8H5bV/AxIuwAq5a9
	 EMXGfw5JLAA7kpp3eEfR1zvUc18S+/B/v0BFRVQYWyGXdBH5e7ePR7k3ltEVgWz2MLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F7160A6F4A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F7160A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CTvT059148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 10/19] cache: andes_llcache: register cache ops only when the errata needs them
Date: Fri, 13 Nov 2026 15:11:34 +0800
Message-ID: <20261113071143.1446167-11-minachou@andestech.com>
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
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CTvT059148

The driver registers its CCTL-based cache ops whenever
riscv_cbom_block_size is non-zero. On Andes cores with Zicbom, it holds
the Zicbom block size, so the CCTL ops would override the standard
Zicbom CMO.

Only register them when riscv_cbom_block_size is 1, the value the Andes
errata sets when the core needs CCTL-based cache maintenance.

Do this check before looking up the LLC node, so the driver does
nothing on platforms that do not need it. Once the errata has asked for
the CCTL ops, the LLC node is required to provide them, so report a
missing node with an error instead of failing silently.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index bf49dbcb080b..80c55616ab10 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -176,25 +176,25 @@ static int __init andes_cache_init(void)
 	struct resource res;
 	int ret;
 
+	/*
+	 * The Andes errata sets riscv_cbom_block_size to 1 only when the
+	 * core needs CCTL-based cache maintenance. Otherwise this driver is
+	 * not needed, so return without probing it any further.
+	 */
+	if (riscv_cbom_block_size != 1)
+		return 0;
+
 	struct device_node *np __free(device_node) =
 		of_find_matching_node(NULL, andes_cache_ids);
-	if (!of_device_is_available(np))
+	if (!of_device_is_available(np)) {
+		pr_err("No Andes LLC node found, cache ops not registered\n");
 		return -ENODEV;
+	}
 
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret)
 		return ret;
 
-	/*
-	 * If IOCP is present on the Andes core riscv_cbom_block_size
-	 * will be 0 for sure, so we can definitely rely on it. If
-	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
-	 * more so we just return success here and only if its being set we
-	 * continue further in the probe path.
-	 */
-	if (!riscv_cbom_block_size)
-		return 0;
-
 	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
 	if (!andes_priv.llc_base)
 		return -ENOMEM;
-- 
2.34.1


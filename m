Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553968;
	b=yRzBJZpnlGqA6S3FRfPb0L7X9axS+0yTbFckG63kL+YJWxSV5js80pru7cGhdD6YYvsG
	 yCFOYaA78qXxHqYJ0aUeKYlUfzErwllHAPP59FHU007w2zOVKZjMSPQnfdjiBe2sTaR2Z
	 mJ9dwLnEveEydHqbDED9MWUQzbHb0+AljbEdGyEqAC4sK4ubbAIVbmR3Qe7AKnAvmVAHN
	 dx4xdqWdf9KDe+K8gGMrZI51eLrUTACGeuPcrZxud2Xa2ogwSCe7yKHnVZjpdadjIFl1g
	 Gcj1eZQyQmhIBo0vEUToqoNcT0wKlbR+tTLvWtSvEIB3n+sFeh7nIeRaNxfqpSKwU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553968;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=uCvzhltHGCP75seaxyc/D51Hbaxi+3a6YdWuEY8UY7M=;
	b=HkM61RPBXFJHSjWBVNCsCpjCYcBi/923YloLzRFa8Dib5kpiuepWsTpViY9f8X0ZrhjL
	 Zm99ofzRAlar3BPUahNzayjSL0hF5SMepgdrao1yVjUro4hap4/g7Zc8gFQKz/xxZ7lWf
	 D+1M2MIJ3zky6hyjkpfzBC19efv3jhQW7DXpuUcrPfpFKDr3+izeoyWa1qzqE6ea6UNHf
	 IFtesL6X4E4z++aO0C5Uv/qEoDgEKYHkdWTo9eQrFV5230Z68to1Lio/cgKYGw8OTkw/7
	 2eH22rCpckEcdvkTZNF53n/66NWjAimKxmWI82d76AVuFMYUHhaC0FrMETQzJvR7Ypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754D606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7754D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5I059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:27 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:27 +0800
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
Subject: [PATCH v2 01/19] cache: ax45mp_cache: use __initconst for ax45mp_cmo_ops
Date: Fri, 13 Nov 2026 15:11:25 +0800
Message-ID: <20261113071143.1446167-2-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5I059129

ax45mp_cmo_ops is const, but is placed in .init.data with __initdata.
Const init data belongs in .init.rodata, so annotate it with
__initconst instead.

riscv_noncoherent_register_cache_ops() copies the ops into
noncoherent_cache_ops, so the struct is still not used after init.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/ax45mp_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index 934c5087ec2b..df40dea7b0d9 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -165,7 +165,7 @@ static int ax45mp_get_l2_line_size(struct device_node *np)
 	return 0;
 }
 
-static const struct riscv_nonstd_cache_ops ax45mp_cmo_ops __initdata = {
+static const struct riscv_nonstd_cache_ops ax45mp_cmo_ops __initconst = {
 	.wback = &ax45mp_dma_cache_wback,
 	.inv = &ax45mp_dma_cache_inv,
 	.wback_inv = &ax45mp_dma_cache_wback_inv,
-- 
2.34.1


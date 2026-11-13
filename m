Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554003;
	b=BYCczkPaV92ggYEAQb2twQDTnpmFyGU4Sum6JgU6FrSHjMS51qwVJRHmDc+1LWHlRDc3
	 9GtaJBIFT3+pC1EZ+KQ4Cf0FsQFBh+HCuIwaM9FelRJoFKIxPkZeJWMHl/XLptxKWJbvY
	 7UcjHAqveW2k4IiQoWF/ukYNJVNyx2L/4nT02kQyUu50SaAg32RbNkzXMjqEa8SQ0ObEi
	 QVty2DHz75Fzw3twpeficfHo0nlqOYxcIYHb2agpj9l7Ij9sCDM2sxEk+bEFo2efCu3bO
	 WtZiZr+50fL20F3RpfusNnDNUuB0urM3bekXkNAcY8etk4Xu4Mrg80TWCXlDdHilWmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554003;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=HFVjm0PhKZINqZZ02/+tDqCstCaYaVxdyQMiKOAJ0mc=;
	b=NGwwPD0tCsLJZa+PMKktkcpXFsNwprhlMamhwxqGBUDsc3KJ9stT/qnpediXM7mP2kEJ
	 ZfXbtdP8f6f4O/b+hk9oKjoejuvGpB2RQ8CKgBpn7mmyGa51fnAYyX9nGKcxUmnXG8ieg
	 kPSVTc2wp12mQEloZg4Y8nNQDUxZsZsaY/CvxGBYuazhgTxHcSurLKxFbyvOYMzmouTa9
	 mv31CTG6/H+ztTkJADiqDFsm7+UGWZppYK0GfvXbnwT/b4NLNnuNaIYtWdIXO8vfvwrdf
	 V+k89eaA+MvSEyeZPQwgD89NPsZXk4P/EUElrCI8r607PRt/Q7tMxsSJW2+Sh04op9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96169606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96169606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5Q059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
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
Subject: [PATCH v2 14/19] cache: andes_llcache: add generic andestech,llcache compatible
Date: Fri, 13 Nov 2026 15:11:38 +0800
Message-ID: <20261113071143.1446167-15-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5Q059129

Add andestech,llcache as a generic fallback compatible string.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 9f8fa8964302..17df8b8af9d4 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -168,6 +168,7 @@ static const struct riscv_nonstd_cache_ops andes_cmo_ops __initconst = {
 
 static const struct of_device_id andes_cache_ids[] = {
 	{ .compatible = "andestech,ax45mp-cache" },
+	{ .compatible = "andestech,llcache" },
 	{ /* sentinel */ }
 };
 
-- 
2.34.1


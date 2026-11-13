Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553993;
	b=V5dqZtwi4czOaQ5G09BwKdhZDUrVKRoQ+1s4ArBjYcNCmN89V/xBicApEg6gd9985av8
	 Hmv6u0iV8WCQDWc8+E6ySRAysvHARNRJ45mOSUrLpbSAwSuAIG+6LzmicqWPVO6LGMHwB
	 d2mbZFr1e28hUtuOhaqzibu04jIRRJ4hVbrIXqUquqCpJlixPZDhIsITsjcmXZG6cJCj0
	 Zlx6IXY8xr92uEJ2WNWm+D6b1uc56GIafcnXyHYkoGK2VPHg8sAvoY/Lbis6gAraYoBzD
	 91h+kTTXXDkQzVEc6/8RqUvKtvHPC4CTPl9qI1e+RZJIPctikYeLbZJLbdotTMb9X3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553993;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=z6gjw1oSZ6klxEuE0p7NNzRy6LyzpuNwDFB9p0DiYE8=;
	b=mt9RxyTN0fBvOyfAlxq5C9320R3vkOwTz62wIuCwFQv7WF5Jc7aBJdgvIN7uBTxiuKdH
	 0uSqiLs6b+299qmpDiRP3fY/5fAiLzMrv8oMPLNLUSKXTBKhoyiWZOeqKf3AZ16QZCve0
	 m45sNmzyP3mGGxjGAb66E6NXkhcBmoZFmBuEQmztt0O6O5sWp+G0zrWKupYKt+dk1eo7+
	 ybaLy6aczpJNynCCikWwcUOePhQaw5HOm6+jB+0CzAW9cidRYj9y3T0HQj5ynzh18YOtI
	 JGenAaQZdz9jUy2vGYSgH0nUcoY3RwFOhhjm5cQ2kH0nRvTZGlfhSu2MZi226fPZRow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AD606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5M059129
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
Subject: [PATCH v2 08/19] cache: andes_llcache: use u32 and fix the cache-line-size error message
Date: Fri, 13 Nov 2026 15:11:32 +0800
Message-ID: <20261113071143.1446167-9-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5M059129

andes_cpu_llc_get_cctl_status() returns uint32_t, while the rest of the
driver uses u32. Use u32 there as well.

When the cache-line-size property cannot be read, the error message
says the driver defaults to 64 bytes, but the driver returns the error
and does not register its cache ops. Drop the misleading part of the
message.

No functional change intended.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 3c271e1e49bf..0aea1389f291 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -54,7 +54,7 @@ struct andes_priv {
 static struct andes_priv andes_priv;
 
 /* LLC operations */
-static inline uint32_t andes_cpu_llc_get_cctl_status(void)
+static inline u32 andes_cpu_llc_get_cctl_status(void)
 {
 	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
@@ -145,7 +145,7 @@ static int andes_get_llc_line_size(struct device_node *np)
 
 	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
 	if (ret) {
-		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		pr_err("Failed to get cache-line-size\n");
 		return ret;
 	}
 
-- 
2.34.1


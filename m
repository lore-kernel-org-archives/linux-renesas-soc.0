Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554011;
	b=hqz7+VSABhTK1eG30Fo+rWkmzmnneVFZtoKz0gLQWrb2mH8wl/ZmWCAB0fsp3taHRdfZ
	 P0O3QORBxoxJWrzy1uJornVl0puoYFc0XdIkFwaeqiYvlfNPVvEfu/N0+USKqHQ+M6BTy
	 6ynYJrLWtgHCTs6ejKs7SceTlJ4ihCK38Nr/MhQGoSm+DeE6wNJHTzu2qyc+oNB749Z5m
	 3dcBYhmg7H9V2g+opWkYN3Gt0KBcR3mdpXAXlzpF9kerwfT/mRIMxkAg+QQAbcwGRDfwv
	 PYWOJk6HD1doLORWIAaIyt2cFFy55AR0rLWUAovLUBJGTaNCGhcfNNQdSOM0lyAz61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554011;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=LCmUZ1eqynL9n+v4/KmGLsmePSOuVz8Hzsud3ogkqgo=;
	b=tiAE2uWvQvDNlMuiNZJ+xT5om5+p728CtCmYl1W574Bm+nRSnFQAwn4G47vVufHGmOzz
	 z4AZXtzL1YqAxIOeth+IcGpBAiOpDs1Z+f467KEVgh+/sbD36RqrFjEVVdSgzuIN1VM8D
	 lVqYVMHkXOo4O+fY9VBja3mKdgGeXoB7EpSr1PpgaTlvqK0rvshjKgZTPHEmg6s2Mukun
	 0R2xrAIpVl0s7re5BvRxNLeRYr267wBh7Pzzc9WXQq8yU6cC3AYz+B8lEGGyLGGk4qJ7z
	 tBgg4JKRzk4mEeD5gd9q3eZdpqNGpC0jP5hMIHWdCjGC0lx2eZv1myV5+YPi9rNGsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB79606A32A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB79606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CTlr059149
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
Subject: [PATCH v2 15/19] MAINTAINERS: Add maintainer for Andes cache driver
Date: Fri, 13 Nov 2026 15:11:39 +0800
Message-ID: <20261113071143.1446167-16-minachou@andestech.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CTlr059149

Add an entry for the Andes cache driver and its binding.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..afccbfecff79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2054,6 +2054,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
 F:	drivers/watchdog/atcwdt200_wdt.c
 
+ANDES CACHE DRIVER
+M:	Mina Hui-Min Chou <minachou@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/cache/andestech,llcache.yaml
+F:	drivers/cache/andes_llcache.c
+F:	include/linux/soc/andes/csr.h
+
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Arve Hjønnevåg <arve@android.com>
-- 
2.34.1


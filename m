Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534695;
	b=gC0X5Y3P461h6rw6GE/7GazeVk18SGfOHJ7gzqIu0li6v72CCvXB7VJ4fIwT9HK2s8vG
	 1IZNamfczKt6XAaiF37QimDW5/Nj4DGiK0+BctXqtxQiQEubDpXvpl0UlrbWQz/wpx923
	 v85hJftn8uZVO7X6h9O7sz3r6TpFFtHQwjv1CjPJKx47pwEX0/yNlbqnRCoumGQO9KnlI
	 PjfU6w29WMcwAtnVHAGiTvZhdcohRwsCkkSqu45x4pNoft+/ePetz8VGjDO5f0rtC5Q3K
	 4vlM9tH5q1fHIoA2bBFI/OKW42IY+yDO4idCKzrl6QLYRnSCSa7GZV8mSD8NJ0NdL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
	b=S1vdBVc+teLynCdcjc1Vs4oz8NBCi79cpeN+UagJhk3Jv4ufkwmLjskiL8frnB5BHnko
	 fLTVwzVRo3h1/rTwpp2X1OIQh92iZ6RQvq+xJZdK86XIJFwYaxy0RqaIHyASHCOphv3U5
	 3mM44Rit2mqQMX1RidyMRZu09XoKayKl2VqQXd7Hg+wlDH+8p2j9PHKu641o+5XCcaU7x
	 OTwCvtW0ArU0xEPB8MQ0mfxc8GNL3iG1bz3EsIvJyTPKnm7ACJdR15K8AR3A+XEoS3p5P
	 HUOkRf+LNq7VsYBIL37KiQtMYJNHT9yhTiUGZ/iShiv3oCXvJ+QUHrQdHC4LIKEwN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deUMFlsp;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE929606A31E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE929606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deUMFlsp
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8479f46ecd8so1888488a34.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534694; x=1796139494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
        b=deUMFlsp+pdwjun4GHWKzF0sS3xgDr7ShhARb9srSDmtj+cvwu5jnvhPb3liiFtNfB
         qzbKd01Eaj4Z8WUIUYTFNaE4x/3WA8YjyxxHwoy7pLVcQqLFAFwmNlIhoSHhOsOjLAV6
         xnXQVaVEGEAZsPXMNjdBNVG6zGYHPNtTBtIUNPA4NWAbCsce+47/lPHkRcmclXtCrx+R
         KkKwTEPolcal86hgNwozGfFquLFse5ANwsZyJo2ZIcjPYQE6mhTXmkQndUs83HufDfWN
         nA0ppBbpW+2l+bqJRPQQXGklRXyAd34kUYIHmY9KUr9AgwzrFUevg2ZXDyQ0yX4BAg4v
         O0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534694; x=1796139494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
        b=Ec2zp0uQ5TnJ3+zrxRW2WhiWN+FwqhsMLP/uVP8/cbxNZSCXB/9I9nUvWEghrNDXmr
         +SY7QcjR+V5y4cm8qYhs9wwvzrWY9EudP1At3UrmllpifsSbevoDkx9+n3cwA4AQCM0B
         ITv9CYMxFY0g65fVtL2APfRFlv3gpNtZ35PFPs2w+BLStx9kW4ikFEYQdd9FKDDCDdeL
         iAN4R/al//+qqy2lo4C14gGaxSWX++shTft2cTJFu/XlJPCz2DbSTaiax+XAbKs1Ur0s
         1HyW5L/Bel9EoezCOPS+RykmD1yylk9J924jZ6v+k/EUaw3rdLtXg/XlERK0PhtOXMcv
         bE9w==
X-Forwarded-Encrypted: i=1; AL+hErF/JkwAg87eYDA26mIeO7ne3jeYJ77ZfZPp1qD6Dz+gxLOUJ8xPXx2TR9dSygv4J1+posyLx/UO6UIpMjxcUyeclw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TnNubD3KQN7X2z0zUurvHQjfZdM+/Z3sRnq9E2mOLwnsOfjQ7
	iJXlYiEc3JHU3PhDO0uKzXC14tmcHDdtp/VJ3b09ev6xhEIl3c/WLxl2
X-Gm-Gg: AZFdTZcJQd6Ag2M4qFp1o+eXNqZGCkLJPX7InqdMKPA+w3Z4pYK2WQeIVrP/EAQYQo9
	2cdS/LOeBfbYiL0IhSQPkupiLJZkWnQB0u7qnlZ/UR1/V5b4lWYdC3/Z8M2TEiLGvgQkNBf0+FG
	iZX02BwLsNOAWLqWi4TD8ASOXqbbJv3n6phnEF7pIayArGNP/svjKNJk0qygOLlYJIh9gBKKMMX
	SDddhIMfKJ1WAd9F7ViLKzaujKDd+Qj7xrukKnBCsxblVNT23bAe1gWphqZ3WAPDc8s5WmdE7rE
	BpDbpdJtUCddNQ47hgRx+p9zTTJzTx/3MOqbmG5xgw0ki3IPVESW1B4fwP/HL6gUJPyRoBnEu3d
	o8oBd+kAjA9HpaKZAPl2PtaQEUacj/Sc0+GYgjrWD7/mauHlnsgtDtBphzvARdjGxDk1MXDuQUM
	viY+Tnc8QOaliTv4k31kNKqKf8st9Fz67xEM2GP231wTdw4uzcQufd7zaNWfqfW9ix+BLpc6QCk
	guAyScT2Sc9TbGaMny5FSp+A2h9iQo0nVhfldmKd0sGv51knkKBQejBaaeK5+ZVj8GvI04FMgj8
	KfuJMNPStjgm6epbo74/ITqEfuM46D7PqSvrtf0OSoMTqrKrXHwu3w98lT9kEVC/TwuPg7yD66I
	jDPcyiG9J4B4tV5v0Fbd+ADroYOYl4xkSLLqqeARgkDSrUrnaGSx+Ra5XX/7IYrLuE65SccPD38
	WTwLHAaG2Xzeti
X-Received: by 2002:a05:6830:3151:b0:862:ca2e:919f with SMTP id 46e09a7af769-863158f0a19mr21098554a34.18.1795534693844;
        Tue, 24 Nov 2026 07:38:13 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863607d0f48sm1501065a34.7.2026.11.24.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:38:13 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] pmdomain: renesas: rcar-sysc: Fix CPG/MSTP node reference leak
Date: Tue, 24 Nov 2026 15:38:08 +0000
Message-ID: <20261124153811.338437-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rcar_sysc_pd_init() checks whether the device tree has a
"renesas,cpg-mstp-clocks" node by storing the result of
of_find_compatible_node() in the bool has_cpg_mstp. The returned node
has its reference count raised, and the reference is lost when the
pointer is converted to a bool. rcar_sysc_pd_init() runs once as an
early initcall, so this leaks a single reference at boot.

Keep the node in a local variable and put it after the check.

Fixes: 1c8c77f52d10 ("soc: renesas: rcar-sysc: Enable Clock Domain for I/O devices")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no R-Car
board to test it on.

 drivers/pmdomain/renesas/rcar-sysc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 3c8a44c6d772..20acc9dece6b 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -353,7 +353,7 @@ static int __init rcar_sysc_pd_init(void)
 	const struct rcar_sysc_info *info;
 	const struct of_device_id *match;
 	struct rcar_pm_domains *domains;
-	struct device_node *np;
+	struct device_node *np, *cpg_np;
 	void __iomem *base;
 	unsigned int i;
 	int error;
@@ -370,8 +370,9 @@ static int __init rcar_sysc_pd_init(void)
 			goto out_put;
 	}
 
-	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
-					       "renesas,cpg-mstp-clocks");
+	cpg_np = of_find_compatible_node(NULL, NULL, "renesas,cpg-mstp-clocks");
+	has_cpg_mstp = cpg_np;
+	of_node_put(cpg_np);
 
 	base = of_iomap(np, 0);
 	if (!base) {

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1


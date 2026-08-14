Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570F46EF6A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714905; cv=none; b=H9LSTF9yIG/nbQsgyxSXoGkCxh+w/96BBlKPVkM8YqfKu4RL4nRhCfHAnrjVxmSt8H3QmKKwUp73Xbx+SIS5InRhZPcQzBUcchFHqVF3Ebr/3Nezj7sbOJ7n3G/8rBLzcxTKrqvIYwMHFNTBlfI6QJKg6qEeG9v/ViYi/I/fSQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714905; c=relaxed/simple;
	bh=gFgCDtaDhkHUy5zlzen5RjHhMrQ/5qm6YfwQtHm+KaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpRep08+y6WIIq5TGnRHzagkgaL9dwqkjCoaa5HDQnHXdqTaoNEANos8cesUVVWkZnQ+JdxRkwiEUz79/UQjCloE36bVxzxuh5qpKRdjIBkmUvfF/YbmEIVlSFNYG3o4tiBXW4U0jB/RxSE/snkDfu+T/YSmj2I5EkeoLKETr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5f7i46n; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5f7i46n"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso13045475ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714903; x=1787319703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW/kAhpxk6iwgmshFSjwEkP45x3FFpydZgKHFvSyQTQ=;
        b=r5f7i46ngDcdZiNETABSXzFfZwTfRROE5Nv2iIOw3tOMZ+6x4A4N5Xf9DUdqFIAxkY
         b9ONMZcrSfkZmI1eb4w04SAYaKFiluv99bJ+3LSD3tyMZf0At/LtXNww1wxv+jybLywE
         cSamRgB01lrVWWm60MOq6+5PY0Thds/+fYrZx2A8osAPKkkqCACQtTl97VPEYrwE0YX/
         fdCgDC9KCSdIUa9OmS2Kbh/d+lx2SuBjdxWVRILpfGmDpuvlZLGGCxyO3JM8v1HgWlyG
         GH68BK25zHGXnUY1pyNt9SBmhNwFWY4i9oKl/JCTRr4Q4xTFzPx/sqfvVoWTeQZj4QF7
         jizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714903; x=1787319703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW/kAhpxk6iwgmshFSjwEkP45x3FFpydZgKHFvSyQTQ=;
        b=qoYqnf54cGIIAQoQujMVQYJgoXjO13OgPqjcctD2As1lWJgw4fJRCwNUidND7Lj04Y
         EkqawwK5pYC3wFEc1Tx3zhhFA8/r2Jf45B65gldQElm7L4jK88RSt6lI8UX2xq09MSCu
         Vy3+n6gn1fp+WdUCULaklMiM3wfO25+gQ+QTLiaFziaosBjxnYU7wOIRf8YeU0ilriEc
         qAnBOS1G4cS+KkD+RXnKRtKnylakidrqEDiXMzMJTz+f5or1tF5i/umglr0kJJbWVvlf
         avwk3IcpGscV8TBIVn1oY8oh3t83pUFXavrQSmG9FtVKnhgGWARKOkVxoYs+Uk3xkRbu
         pubg==
X-Forwarded-Encrypted: i=1; AHgh+RotBrmp1YVoLkJTM2WJUU32qv4bUwctlJ524oH5t5ADEicjIqRicsC9eXDdjAUjoxb799OA1Oll4RVpYGSmgenl5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdELLuUZ3TEMQ2QoTpX7b/ueCqQ+hfG0JHx8Vg6oZnBkdgOzQ
	QX8yeaFcoRlD6W+nfpltXS2eHMw3zkyq9ITMmllgLqLX6OoJFjh1+vzb
X-Gm-Gg: AR+sD10YCo0z17+z+SU7dxkGt8A5Ow8lJFzZl0dEuOag7qMR0JQ4jBWNFf0dY8ITx92
	/c67vQArVfZ26LAhuBQ8P7AsH3Jlbi5ucMKdEpltaE2W7l92HmK4yWNC6+Y0xVdrL5Tr0bDlD+u
	Iu1whbx1EwuYyyJE7NZ+M5U3WrpUxLpWegazX25jKzq94KIz3YXICbXbeuoxYosA/HUO3DVDwHs
	Fxd8jkZ+aJ5wb3hUjtDOK3d/tBZlCId+1PmQS2cLqYBAgwFUcekqL1vy7jtiL+X9SCaXlrGaeSJ
	7H0I2v4Xfgd7ThohXMXx2CiNRK1hQgC866kpzIl/v4bGUzvrTvPKjYSiCqeW39KP/+A5p1WPVI3
	84kfz+kzJbRytfUBRJX3vncf6d24yfuRxN/mawwcedHJ2dUtd2AMO8Srd+CwnhG9k0MtF4izgtI
	j255AaKXgyKolp1cyPTXfzjFkss5+Xu9fUR8qboHewwBlkNRulLVr75UiHvoQeclimMkgUZmwYA
	DlzqDwi
X-Received: by 2002:a17:903:37c7:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d3b08053b6mr72682355ad.4.1786714903174;
        Fri, 14 Aug 2026 06:41:43 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm10269255ad.28.2026.08.14.06.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:41:42 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] counter: rz-mtu3-cnt: Balance runtime PM on enable failure
Date: Fri, 14 Aug 2026 21:41:38 +0800
Message-ID: <20260814134138.1388045-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rz_mtu3_count_enable_write() used pm_runtime_get_sync() without checking
its return value before initializing a counter.  A failed runtime resume
was therefore ignored and the callback continued with the device
unavailable.

Use pm_runtime_resume_and_get() and return a failed resume to the Counter
core.  Keep the matching put when shared-channel initialization fails after
a successful resume, and leave the cached enable state unchanged.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 0be8907359df ("counter: Add Renesas RZ/G2L MTU3a counter driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/counter/rz-mtu3-cnt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
index 7bfb6979193ce..a8ba8ebed236d 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -504,9 +504,14 @@ static int rz_mtu3_count_enable_write(struct counter_device *counter,
 		goto exit;
 
 	if (enable) {
-		pm_runtime_get_sync(counter->parent);
+		ret = pm_runtime_resume_and_get(counter->parent);
+		if (ret < 0)
+			goto exit;
+
 		ret = rz_mtu3_initialize_counter(counter, count->id);
-		if (ret == 0)
+		if (ret)
+			pm_runtime_put(counter->parent);
+		else
 			priv->count_is_enabled[count->id] = true;
 	} else {
 		rz_mtu3_terminate_counter(counter, count->id);
-- 
2.51.0


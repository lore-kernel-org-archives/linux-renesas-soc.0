Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695577;
	b=u7++i7Ngpv9374mMuK3NeazaP4W582ngSwujMzYLAxWtA0LVJIa0nUXBIFXaNqynZ7O3
	 1biVUAGBEJqNT5ToHkcDB+X+GCm+HcQWOijn2Ejc6cf17EHluLCN8QfoNntJ5tHMDEnor
	 GSNaEZIvr+MwG8uNOIzZr1zFqc9h+2twORTceoRDELjBb09MJMQSyqkJwtd4nXH0utSrX
	 zlcyb/myZwVNftH03wzaK0abmfhU795+Xc8X0+Tn3QCWXiBDEPH+Xwt43JWar34xVs+RY
	 Wa3wReV0+/+lWoTjFtKEbqtkeKGCUjCLMAUNZzmz/jH6CjZPLTIh7Jhe3AchUd3IYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
	b=KbKDjR9nVi8flHXIUbE3KGFxLLSzuNB8RnHVv8b9rO/OO7kxyXpcaZD4dWj8FGyNF79Z
	 37mvtHrmimH100mnjUcQkjiK2109XbK3s2oXYpsRj7SYPNxG3OQolsIs3Y9K9bVe0LvRZ
	 YPtf4Mntp3/mPfwLDnAJTfb21f/ZbA7foM3LRUneXOZHrwsN+Oa/VDdr5WksXF7U3PjaB
	 FYFFKXMFWA47nFBywDCwCLpZ9CMQ73BEL0y0MeWq7u9KAYkIxZsHMi5axHe+qJpHQkDsr
	 UEMxLHu7H6Y9vCfhx5yRZGTUni+Ad8l1INkrqCvW2BTdKdXMTIBD5tNIAmK8jIpt1zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0q7FXbU;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFED606A942
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFED606A942
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0q7FXbU
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so26825245ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695576; x=1794300376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
        b=C0q7FXbUsSI2Az6wam+S8YWpYCHEZ+T45mTSSqsdmlvzcrXLJU6rdETKsjUpXKskbA
         AuapcF/9Wj7l+xVO3Z4qiuprrZ4GCLuVb05G62SI7dO+I8B4BHB/USOxOVu28lpLs/Q0
         SOb0dt47xENz23XHCFcvOZoHNwpnQ12gHFoDEx7ALPFs98YSzhieYTxtTAzawvK3flP3
         FFC2Ptn2wALJHQ9Glq746c3C2o5ML+VkVgdCfbYf9ivAklIOovNmVMB6F3ixLNouidda
         L+7onOkNSriFJUbUUOgC3njZJjCz6ofAS1knQilha6Wj6QIZJzQgt+TrMxWO9WNvRh08
         alpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695576; x=1794300376;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
        b=OJrBkDdtlQhMk2hLE40Uy23Wfg+sigRzvNsiiH5+JhA8vHF58ZQeEgJC4iAkWZsOh2
         3SQFbMnsUlM+Ehblqck52JETg5ECuxlmk3XlyeUYZySbmnO+qeyw2K8AJRkQJSkwNh5q
         d6ZUyDsQ4c7mXDbV0S4Xif6xyrd7BpIxtqa+fhevaUK4/ejNkSoAG5e8hQUPa1cgx94U
         C8dWGXmC+NEQcz5gqv1YZYfWWF4AgxDGNcE6GnT39k456NvDetK0dMrfy97P6AXoYdHh
         cGmhmNaah8REYzslpQ1FNzHJIE0NgIRcriE1BMpfwxPBbZBmLS5xM7j6tpqLRR7a69gw
         TRLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXISvnjQtMJUDIoIv1N+uzWfM9twLHebX6m/GYGMsq2mu7v6TfJUc+9IoXBaQUifAwWViUIc0jel1v5G8T1gZGEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+F22+kWJtz486rp6+3GY1Hay2yMz/3Hq8YddLw2tfI8D+iUUgQ
	X6zQUl2mXvPHp1QXzV6U4TEMdxY9FOg9+Y5rGQavkiazbuL9K/ffNM1D
X-Gm-Gg: AYBFou1wWcmhiObiwWgIoTnfP2J+o1ezhoxlmyJ7NXVPyrMRBH3w9nGINRRB6f1QN2M
	6JBUWZLL224gCQT4J747ixOjtW9DQ+C5igf24ah7t9ks75ZOttTaWHjCrGdosJiHDeqgOw6OBnQ
	nveyAIlW7R89Mdcei4Np9ZArFjsgInYNQducbzrmVcj96bZZBEfN+I3dc9vumS+m7s906ZdRT5Q
	621wd/6ZRfYd3zMAZz7AHKkskcE0Mag73WDTQCoKqDLUNFwGayKLbVvkxYGEyiLsq9fBVpMD4bh
	Ph9Asp7fPuyBXzFa0j05Jgj05DTdd2A6ze3AH8fihOwrkMw5XxaP+tMF/8YSEVhuc4xkM5Qhjo5
	b3SiBsduEL60ry1eDmPZ/LZKJD9YQMOZqYhyom8MQhVf+y/QuBcsjrZm/BHTDi7nmLgQsxpQiRi
	zzxT22trzQordo/jKN53H2ycOEBxO9dSD7feSSQaKTvJuD8GchluPngvPMFauDmWDqMTgH2gENs
	z7e9iaxR4/FEUL1Q30ZqONtZj0lKVQ0QvipBcm3oPR9Xmy52gH3CatPCaHgtpYkhFVba4RjUey6
	7N8ee2vmdLK1dVbSmNPhzgD7L86wpKy58BQKCHTRWjo6hbtH
X-Received: by 2002:a17:902:f686:b0:2e9:87e8:71c8 with SMTP id d9443c01a7336-2eb36395e36mr125228405ad.4.1793695576032;
        Tue, 03 Nov 2026 00:46:16 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f635sm39075315ad.17.2026.11.03.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:15 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no sensors are probed
Date: Tue,  3 Nov 2026 16:46:04 +0800
Message-Id: <20261103084604.700540-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

rcar_thermal_probe() returns success even when zero sensors were probed
(the per-sensor loop simply falls through with i == 0), leaving
common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
call list_first_entry(&common->head, ...) unconditionally, and
list_first_entry() on an empty list does not return NULL: it returns
container_of() of the list head, i.e. a wild pointer into
struct rcar_thermal_common, which is dereferenced at
priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
A malformed DT node with no MEM resource triggers this at every
suspend/resume cycle.

As suggested by Niklas Söderlund, fix this at the root instead of
tolerating an empty list in the PM callbacks: fail probe with -ENODEV
when no sensor was probed, since a successfully bound driver with zero
sensors is meaningless. The error path through rcar_thermal_remove()
already tolerates the empty list (it iterates with
rcar_thermal_for_each_priv()).

This issue was found by static analysis; we do not have R-Car hardware,
so this is compile-tested only.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail.com
v2: completely rework the fix per Niklas Söderlund's review: fail probe
with -ENODEV when no sensors are probed instead of guarding
suspend/resume.

 drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 9a9038671..6a1e977d8 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			enr_bits |= 3 << (i * 8);
 	}
 
+	if (!i) {
+		dev_err(dev, "no thermal sensor probed\n");
+		ret = -ENODEV;
+		goto error_unregister;
+	}
+
 	if (common->base && enr_bits)
 		rcar_thermal_common_write(common, ENR, enr_bits);
 
-- 
2.30.2

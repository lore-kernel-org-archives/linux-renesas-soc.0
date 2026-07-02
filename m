Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668F39D3DA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977918; cv=none; b=oXwGX7dkct7wzsRGhwBcvKdfoHXVTtT9T3cNNExdLomofB3mMxJuMyjPN/jLKpgjgDAnp6zwLGcyyF0Mc1MjMNOx+R/61oIrjJo4ugE6AVkCq6naAloGXXmNDNa84myX1kLa70YCtXCdfX2aW7vX2V879m2W59PiKh0pQlzeC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977918; c=relaxed/simple;
	bh=DdLjUC1ksuo+PVzG3yADpMg7xDZKtpZfVtK9cx+fcI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Em/pYFr+CkeHuo5xd/Njni8dUqX6/7vwP4zh2jZrlCBe4rw4tspto5L4CfOkxZ/1iIlaUZeuNIeoG7PdjvPNCR0vhsug/6tA+GqNsIrtHHIsMBSjYahh0inwAkpSG5H5GMqbdHYYaH1PccqUKtyuHRnp3eQb89tVcpBiJd4pjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV018Qxe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV018Qxe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4745492ed3aso908890f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977915; x=1783582715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=BV018QxeEXIfBas2KL/xdTtJqXoWWriDanZZ4iJX997qalMvcQiqzP1vRBTbmzJ6M1
         A2AoDO+ze0OX5y0Jix4VuVGnpsUXakv6MgT/GQ5BOobpuzHBTV39ovrniCk8U+8xBJ3y
         D8XMiaDUCMJdsiXEmZSQQaKUmdbCjAWmKdwgRzTwiPZ0TMh92IzRLwnsqQvTRFTZYPdt
         BghKH7W7WvCpIMt2xZ7stfr67IV7TcnJCmwizWGumZQ7lxZnjLTymyeW7Gj+rd0BVTli
         HZb1F1UCjPZbOt30UldGwXrO2MLa0e6/yLHjj0I8YjgHI76eHAHK/LulyX8s0gyL7/oZ
         CFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977915; x=1783582715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=MYvM8zYwpw2E4qSo/FyOIp9T39f4MAaOe0TSgfqDZC0g1uCC2XfH1tAtf0wz21A+/T
         c93ckXQJrpKlDIUYRGrPnLqfbjQyNcUTq8s+bk3TTZUJsJdauT4AgbxP4SCvpvQBF3dV
         Z2pY1HpxoNpOORgrv1nRrpsFMZJ4Ogl8s77E4tUcPNo9m9Saq74icZPsNlBi6WlsXBHt
         5XuCdzCtUG9zWYgP3M9urC5tLbHcykc0aBi7fBllgjkFBUDxuU6BsQ4H5S0+5cUgwY+A
         PBFJhU91pOCJCv00v44BRUM+lcZd5YjVSImYj2kcdsxiOLs2XvMkdTeUseJUYO8mrouR
         x0hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtthMYq0r0grujfEa75IZQOZFDwXQayK2nF151nrceR1rDsCdjXHDs5py0JvRyb0H95p5vi0c8WMAY9zU0mcFO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CJBevsalYs/J+lDzoe1mrK4rzVtavAITTQfIRaxTq5cSBIrI
	vIdLR9apFTPYP/N5Qs9QD2UC6rc8XTqkHalYJDxP+Q66z+zW1FpdRoTo
X-Gm-Gg: AfdE7cmKsJsHJsmKrVys8Mra2UGUsBBXE86rpn5SYTNljr4WdSVzmU0gpk9dZoRbmtF
	v/xoiQPmBynyS4RDKgLPtrFd2IIr90R6JWbjYoXPd5arVqW9uA8ZFfqixcbzmmg5aOicPouDmlw
	tHqCnzZq5NMCTvCndjEwYgqJ0AezACWSk+8oSiwKvyOvk+/B1mWpVOU/DiWBL3/T4zQnU4psvOT
	wx746JmjutApHbJV81TOQnCBIIQpXt3htjaabIGmNZs3A6hn3mw/5HXIFSOAW44S6Y4CTV3M7/E
	no8CewCM5zesgESKpD9IVQZ21sLKO4wt4+C81qErFWw5TaBnMGS/yqsd+DzIjWRmmwHuKgFqgc6
	oQHu9NAD4ADVO7MchBvBjKJoDD/azcwWg0t3mUK5X4Upsb2lPWfvv6YPfZjeaoO8i2NRvFHRgcB
	Fmwf7KxC5D2/kib6iQ0OYBqkDT+rgXD88Od6w95Q==
X-Received: by 2002:a05:6000:607:b0:461:9950:da50 with SMTP id ffacd0b85a97d-477574b0300mr7823320f8f.11.1782977914687;
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:8d97:896e:a65c:20e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd0b1sm6331170f8f.35.2026.07.02.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fan Wu <fanwu01@zju.edu.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Thu,  2 Jul 2026 08:38:29 +0100
Message-ID: <20260702073832.175047-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before hardware_exit() and
reset_control_assert() in usbhs_remove(), so the PHY is powered off
while priv->phy is still valid, rather than after hardware_exit()
has already cleared it.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved reset_control_assert() to avoid synchronous abort
   during unbind.
 * Updated commit description
---
 drivers/usb/renesas_usbhs/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..51d3035f82be 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,9 +813,6 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
-	usbhs_platform_call(priv, hardware_exit, pdev);
-	reset_control_assert(priv->rsts);
-
 	/*
 	 * Explicitly free the IRQ to ensure the interrupt handler is
 	 * disabled and synchronized before freeing resources.
@@ -832,6 +829,9 @@ static void usbhs_remove(struct platform_device *pdev)
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
+	usbhs_platform_call(priv, hardware_exit, pdev);
+	reset_control_assert(priv->rsts);
+
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0


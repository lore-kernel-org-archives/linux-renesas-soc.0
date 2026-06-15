Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E640B6F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545159; cv=none; b=hSujKxazK09uz00lY4HygNrsWkmMxWwbRBV273ym+4L7fN8aY+UH3cB9XY1ZHlH0MSCPo1mKJwwdG1DpvwAKBYYvSHrbDlYCmusMru5ROJvpKsPUCBdadtTv3PcHdHzJc+t9dNw1h0yL6uaHwwe17Zi/Qum4C0Ce3NlbMSMjT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545159; c=relaxed/simple;
	bh=b1KQtTshbtili0wyZAgkxDnKPTtj3bS+cOTRQEQ2T4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIx/owMDJaswFQuPP6WVSY65Spg4yGFmtk4cxKT/HmTSnrXYLC07l39Rj24LtocJeFz5gcu7CYgPhnA3Zi/Ui/FF2cMGL8dMklWwa1j96Vza4hqEoa6b3KgjCxHRKVPcEbp/Zylg/kHRNu7R9gprv1O7tBRrLbnlLCNno4Yu7Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJCtHaUq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJCtHaUq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso32597165e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545155; x=1782149955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=XJCtHaUqk1fhdWGM5IIT4iTKEjCQf48ZN6kmr9rx3MYMduetlH43oZTHVx84icba2Y
         66jGICMBt14tjCHl1l2UcDEWAWDIAPsmxL6HdKkhJmdt8ww7lvGgOEYauhWOvoD+piYz
         1c4HOGnLHcjexP4vZjH43e2yN8PlIEkziFQ8FiBOPoPknCyUPhT+dMLYGXnW3ov6QJ9E
         lCre6zuy5zX12Eal4xp9/HURT/qhQWXtnffcmZ9xZnMeZ+uYqVe7nYJrF/1mcgKmgoJS
         WmVVLXIVGCB8ZNZK4kexVO7wapNE2e6Y1JWymnue7pcQ1mHCv9Dmeti3iM6DaQUzA3OH
         hdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545155; x=1782149955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=OKiPvr6vLxwkoUc48iw6NPnjc4K2VQxr5iIlaXnEgJ2k2sYESaoIS0ZcflxDjW/3dn
         iLoc9rTLXYD9tsLpQMFgqRYjsyw/2oVJ91pZ+xeV+shL3tsfHc+FnCCMmFjAiTLXPe+c
         aGhWfk6RVu09tt0c9spgo3fI96WGUQ/Pw9fJ+GqU1Ot81Wd2ys/7+QrxAxF4mtOWSiCd
         FiYTAw5o16xO9feQRgpVLBf1W9TX68cCEf9wKUVcFVVfelMTpvEAqC0vjCISUADq+f/Y
         hRNlvTwhMvusoujUbPiDz1ktlL46mL8//1iSgdF36tH3sdFQCxrvNuUorJMf4spXtx6L
         WOFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YrBcJRubsaeb/90ywOlIkhQ1iLNA60CuLGbKtD7yDQQUoteAK6wUG4k2BVrfypqFdieFHlqS2o5v0GBJWN+neeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PtoN1vvttkdjQW8lNmhtlgMj30H97Hw1XuRvetP6wA/RRude
	FCbh4ADWqBn8bJg8Dw+nUDwrPnaE5/rFXvZTOJu+3zZiRXpWlpOI1TSk
X-Gm-Gg: Acq92OEZU2crqRUS1s/f5PVjbZ2HoO0fbEf5bN6PhECpOySYUdy0BwXiK1SupUl7X/r
	UVyxaIpMw7YD8byf3P4+u8rO2Pa8s4ttJfd0uvIevcXU/0EeYxGW/BX0RTWGt8pbSHZKysdWiZY
	N4JLM59sMyCJl8vemFDdeqzNC7tThOG07YgCaoOmnLHdahHCz3+v32kfye4nAmX7ZTSJg7n34UQ
	xcCy8OKHiEkKQDIXtgtkHkCGphw8ssciuRBjpzliHME9Ggu2n6QyJRQyeBiOK4S6DFqDeraFao6
	EI5jlnoU7wCpsDCaxXgme44fGd/TywWsMrrD3+WcSrvtwW/Y9Gs7XIu+rsxeA6Un/yW2MYHmQxP
	msbue5xMAIbIpTH8RupCBnZtbnVdtjcgeGQXt6UOnbWfeUXM6pe07LLIP5wo1bpM8vXV792XqRE
	chsLYyUCkd4bA3XeV9wm8WY0a99b8Q1X8KhGQiOw7o2XBQA6c=
X-Received: by 2002:a05:600c:6542:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4922006283cmr105801505e9.14.1781545155201;
        Mon, 15 Jun 2026 10:39:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:eeb:53f9:7d71:64c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm39399894f8f.24.2026.06.15.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:39:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Mon, 15 Jun 2026 18:39:10 +0100
Message-ID: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before usbhs_*_hardware_exit(), so
that usbhs_*_hardware_exit() sets priv->phy to NULL only after
usbhsc_power_ctrl() has executed, which controls the PHY power.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..614b724a0e52 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,6 +813,10 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
+	/* power off */
+	if (!usbhs_get_dparam(priv, runtime_pwctrl))
+		usbhsc_power_ctrl(priv, 0);
+
 	usbhs_platform_call(priv, hardware_exit, pdev);
 	reset_control_assert(priv->rsts);
 
@@ -828,10 +832,6 @@ static void usbhs_remove(struct platform_device *pdev)
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
 
-	/* power off */
-	if (!usbhs_get_dparam(priv, runtime_pwctrl))
-		usbhsc_power_ctrl(priv, 0);
-
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0


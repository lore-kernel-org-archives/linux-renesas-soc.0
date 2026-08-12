Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4C44780B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544389; cv=none; b=X9X1xvUMlTl/9WWwCulQN/MdjSdBafTk8GktKExAV8GUyWNinJ3mtD8VGxyZpNJT95gauvk/DNBoZLii0fvPB5ibm9a9AarscheLRafEeL710c14vY3SM6P/RgfS1VqKTk/0vtZ/hPEjx+mYQW9n19M+0AM41x6h8/vUKaoQMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544389; c=relaxed/simple;
	bh=NNe0/S3Qi7wOvRi7yyfHWT8Qg6AAq1Uw5h0CWz03mkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZXGYAxCKficlCJXFs05vdfLgxk9VLMHJbSV0EJ7+mAY+wy73Mm0RdDPdMTQaxb97kXpbKTByfwENgpMIRwNiQHHfFHv4un8574VowY/fURzSjQxos1R3cVixseJnl2/v115Y07KwiFpk+4bxfeQYeTTW+kZmCe1PDuKpiyGfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmMEWlHY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmMEWlHY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8579865e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544386; x=1787149186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueRMDAshmsiLCd99EQXclNGtFxpMPyYFwwI4epZmfa8=;
        b=FmMEWlHY5X0HU2Fz3tiWSsHfAwUuqspAAUoDBBGoHCdaTuxU8G793DgkSg/B44E7UU
         Nm3mTL3fsdk1z/RXqI4QipjlJ8R2KqIDuJf7jvOsuGV5pdCzrB2l03pMu2gZDhnSabwL
         EZu5tBkDa1RhlaMjv5y4b/6LXUOSOrEI9UPhcf59AnDj9xZ8FTUNkW2nXWSbSpO7R0IV
         +cY3dRGJ8zNcgV7FMjGex5dRzQ0K0/UOQaEJIGJM5OqfBbrnl+wnMldSM/BehDLFKvei
         YN5nN2p3C5grOp0Z/rvCbMXPs37Qlo60Cig697jCLQZQJXYvf4tEQX+EyIGiFVwrUkRY
         Kbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544386; x=1787149186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueRMDAshmsiLCd99EQXclNGtFxpMPyYFwwI4epZmfa8=;
        b=eb7qQKezUocwzjgbRZewUdIFQsX2XKx/PisyQxXYL89O5Jr187X4EcMNLGUyD22gd7
         ZHEg0eNt4rNQa2rL8Do4o1HsSOdG+bxaf8lcUMQFN7LaMHhhpp9B/asIM2wAM2GrdOFC
         QnqAXX6fPOVwJVxaVfRK3x0OlTLNtbAWIlzYpBs0dPBWCSKdjICbjx+wgJeeDLYdt6dw
         KUhaAVhp1EZnZpK6YOvoHxy8uIx6YA6NIZejA9ihtONDfoy/zHBaH3TTKuwCIc4tN1id
         /IUYNrXHqTRLSEXIV6FQpsGyCUhWKsT71Vb+8ZTlQlqb4Hvp9ut440qU1/C+WRyfN+s/
         mwsQ==
X-Forwarded-Encrypted: i=1; AHgh+RotiZEpaLczrP2HUA/HtLgbeiwxkhz9mdU8Px5AIQK7fmMSEUciEA1XMrbcTMlCGvqNa7wDp40sxnKyICB3+Mp1Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoKHMTyyvmFXxE1cGiM+3DirqpAtZCFqxiu5heyi5TGLVviKc
	qktbZKgW4iKdrQiMuI/eBDR8uIGdS3FrSgVYd09Kww6Sd0Bi5hiRaOsc
X-Gm-Gg: AR+sD11wqUMCr8HaLmH5/ixVmYq2pJ0kADex9/s1tNOfpB8vHVTEJ1BjhCo+j64f+8H
	s3uXNXcl7WM0vdfsF7ZeQkqbCbNQGNw6wdt3UHfTV99u0i/iA1HNwC18ow4oq6OH7WiTMU+shFk
	ZQS2J5r5H+rUxJVelJvP5SVzAx3H/RMnUxM4YTPq8FMF6OYnEw27hIPXaCl2nTQH6Y8QUxgSW0b
	9hE7KCsCexIOrEeHDLrbrMKfGeYOnPfRsk88x/qeXQ2AyWrzNSRyKyeCt33tYKUgQEsTDQ9F/yl
	qa4lBS2WoRJSwweXaqci82etkMzztURphm32XRqPA6EPUZloEvpHY34LQx6F5Ys4/hGrz8pdg03
	4fZfNiI+qSVvC+E0SvO8WHhACHokNTiUu8dTZ3KiaTFKR0k4Xprc6gfhxpWbk9yrTbrvvK3Z28y
	2FLPSWAP25apSWhV2/KpCchBrrRUuK9JrUux5O59BEcbWFTpBh1puS13KnyAOGr5wKhrETzsTEa
	8WdIMnoCo0rN8Nnl4bRtbjg
X-Received: by 2002:a05:600c:3ba6:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4997c0e3812mr70103435e9.2.1786544385857;
        Wed, 12 Aug 2026 07:19:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 1/9] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Wed, 12 Aug 2026 15:19:19 +0100
Message-ID: <20260812141940.246223-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename the platform device name from "rzg2l-usb-vbus-regulator" to
"rzg2l-vbus-regulator" so that it fits within the platform device ID
table's name size restriction, allowing the driver to be converted to
use ID table based matching (struct platform_device_id) instead of
matching purely on driver name string. Update both the driver name in
the regulator driver and the matching platform_device_alloc() call in
reset-rzg2l-usbphy-ctrl.c to keep the two in sync.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v6:
 * New patch
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..22fcf0d10c85 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -58,7 +58,7 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
-		.name = "rzg2l-usb-vbus-regulator",
+		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f003b360629c..f90fdb7e6ea4 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -241,7 +241,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0


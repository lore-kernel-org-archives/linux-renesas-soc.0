Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290B4192FC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827489; cv=none; b=kX7K2K5id/cMZGLkMFZr61fPbAesZX8zlCscJMzlWbfAL0xTq54ftBGDs/WnBUAyon1O0GusYL8nhUfg81NCUX1TpQsgJBqU12Kr9UWm7df670hjGTmLBjsg/RzSNjwj3KrCiN+CIsFvXkafv6VvDmnj7XbNxts4rKUMUl+V+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827489; c=relaxed/simple;
	bh=N+KcMg3YdW3ZGEXV2ewZVcvhA1hOWZZyP9K83y3H7iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rfe6RrXUzR7+rYCagzH5wi+E0mnqigFe3XUOtODVVTUlGo/g4IhYeU//G+hU/7Xh2N4yc8+Y9Iyuh+VSYW779UlHANU3aF1ME2C0u5BBX4LvvHizdNDzYsmKtL6YoD/kICQcIZMrr4F7HaYcih/lmYZoonp9mARfFZsys2KbU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARi0YgVd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARi0YgVd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472a14c9965so2192849f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827486; x=1783432286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWvTJIR6MW/9Fk0B89sOeEZGZXWK7HW1VK3cCDHNi6Y=;
        b=ARi0YgVdWvXZVy5FnRbpjSXlkhj954J4nCIiPgGl5bHeQ3vqYc6eYRLP4WRMBdShZv
         G/2U8e5yQPN9zzjexD9Shvq51mOKQIKphXWvY9baELy7cPEAt1sWNp/cM7xQ2P6RO87h
         7/UM4V+qUvkzeqPRib3qaPNC8HkGioab7CpA4ftYfKpu93z08QBhIg8Jeg6wt0gCVsD7
         Iwte2xBbOl2IOa5bYr6ziLe0PzGZMDGZDywVIXQTLxBCT446VGTIAZ4Rr+5dXlmsSTCH
         SeDFrKH3It/OtF9AiP/RS6/aVbTkW7W3j8TaMoY+0hvuch+UsedIFVzfFh2qQnGrYoIk
         PXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827486; x=1783432286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWvTJIR6MW/9Fk0B89sOeEZGZXWK7HW1VK3cCDHNi6Y=;
        b=aZmAVnWVKRhSa5gzij4C4kcu2b5Im6659mueRJgqzBM0pyqfAE9XACi1Tj1yopNfwe
         9hI2XstRpievPKt1TMvpc2h4JXV1bDfI3YvnTV03R73T4bHZpPHD0crBkHAuKTcm80sb
         rqVwIxIpCERJIJ2MbfC4bHS8WpqdmijzURMRSJbz5sbutrA1v8ibVM6PmGQMXssIiOta
         bhUnZPTpiQU6LnEneZoldAWRa1SCYQdsqdvzpb0EG4avdPl1SFAVqJ+FNje96XMBzd3E
         nUJAyPuwPahs2EdoybGL8FoXjUf7pPKiFD9I8UVBlDRhqD7lfY0dv/dOmlAAGg4D13lj
         uwZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+L34kUGKE8HZ/AB8ktcJug9f25UVOu4k22yHM6ROLHeNLoo2KHzHWL5hcp9o5LdtOspmpfo3oM7OZ5Mjjo0m6VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzypQCi70DtZcJb1WFhZGhYF2ge0dyD1fl/p1nzSdDO96PB7/nm
	Au9z5UHP3eouUKRbsiArFehiN0aRWOK58pJNLlQcWbT3NG+hwn8l9yAb
X-Gm-Gg: AfdE7clzmfpdixG1yNoSqbczkUr5qTcqxGWuSPq5yoZSpFvZfSER0Uj2vbyaYisRWPW
	SZRS7adzOrgwucRoOEhqShJjOX80Yue6t//mRbm3dL+S9LWIOPF6+s3h/9MLF/71i06oQn++I9Q
	wrgu9IG6xlLkN2bdFMRY0ZZKHWxcv42BWbfAaueEHbfwY5etLWiaha8dmkQbun7vSj7CjlJMEbU
	IHTaf11/yh4jMGIQnh6nsWIJJDeHk/nMQQsIP2GU/KICaMaPZ/Yd1SxHeQ5ccCkAv66T3C92KGj
	uEB76qZHMtJTHcCtjNxymYDSSzQtbe/Puac10X1S0ZboHHs8hRz0nb3I1AFK5k6G2z2JY7R2DSr
	ehcMl1j6vdMP31ndhZXkd1boDvlEmCWXmPbfGulK7rleRYBSNCGx1rDzxJjSHsgyk5XpgiT5KaC
	/Q6JG3jm7KA1pX5X6d1aOYqrhMJ27lQQaNJvMg3+6yxtMK+CpO
X-Received: by 2002:a05:6000:2304:b0:46d:8695:f49d with SMTP id ffacd0b85a97d-47552789722mr5212640f8f.34.1782827485983;
        Tue, 30 Jun 2026 06:51:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f6d:4f26:2d9c:ab4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm7216964f8f.19.2026.06.30.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:51:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] can: rcar_canfd: Fix interrupt registration order
Date: Tue, 30 Jun 2026 14:51:16 +0100
Message-ID: <20260630135119.104774-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
References: <20260630135119.104774-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

In rcar_canfd_probe(), global interrupts are requested via
devm_request_irq() before rcar_canfd_global_init() enables the clocks
and before the per-channel structures in gpriv->ch[] are allocated.

If the interrupt is shared and fires immediately, the handler
rcar_canfd_global_err_interrupt() will invoke
rcar_canfd_handle_global_err(), leading to a NULL pointer
dereference.

Move the rcar_canfd_global_init() and per-channel probe calls ahead
of the devm_request_irq() calls so that clocks are enabled and
gpriv->ch[] is fully populated before any global interrupt can be
delivered. The IRQ failure paths now jump to fail_channel instead of
fail_dev, since channels are allocated earlier and must be torn down
on this path too.

Fixes: dd3bd23eb438 ("can: rcar_canfd: Add Renesas R-Car CAN FD driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index e88554388553..4ee108abffb8 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2216,6 +2216,17 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	gpriv->base = addr;
 	gpriv->fcbase = addr + gpriv->info->regs->coffset;
 
+	err = rcar_canfd_global_init(gpriv);
+	if (err)
+		goto fail_dev;
+
+	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
+		err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
+					       transceivers[ch]);
+		if (err)
+			goto fail_channel;
+	}
+
 	/* Request IRQ that's common for both channels */
 	if (info->shared_global_irqs) {
 		err = devm_request_irq(dev, ch_irq,
@@ -2224,7 +2235,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(dev, "devm_request_irq %d failed: %pe\n",
 				ch_irq, ERR_PTR(err));
-			goto fail_dev;
+			goto fail_channel;
 		}
 
 		err = devm_request_irq(dev, g_irq, rcar_canfd_global_interrupt,
@@ -2232,7 +2243,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(dev, "devm_request_irq %d failed: %pe\n",
 				g_irq, ERR_PTR(err));
-			goto fail_dev;
+			goto fail_channel;
 		}
 	} else {
 		err = devm_request_irq(dev, g_recc_irq,
@@ -2242,7 +2253,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(dev, "devm_request_irq %d failed: %pe\n",
 				g_recc_irq, ERR_PTR(err));
-			goto fail_dev;
+			goto fail_channel;
 		}
 
 		err = devm_request_irq(dev, g_err_irq,
@@ -2251,19 +2262,8 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(dev, "devm_request_irq %d failed: %pe\n",
 				g_err_irq, ERR_PTR(err));
-			goto fail_dev;
-		}
-	}
-
-	err = rcar_canfd_global_init(gpriv);
-	if (err)
-		goto fail_dev;
-
-	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
-		err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
-					       transceivers[ch]);
-		if (err)
 			goto fail_channel;
+		}
 	}
 
 	platform_set_drvdata(pdev, gpriv);
-- 
2.43.0


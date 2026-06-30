Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96443ED5C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827488; cv=none; b=dvNrkACZJAIuGwoGh35mi5EzBcq006UijnpmDGBJEUkqhhFqkjF7r7E+/5zqmSNAk9ysP5pEdgPzddaJkPSeoZYPtePVY1V6IkB69IdIHxPoPrv6a3pwIJOKCx9UOBoCpCPJ9mk7YGWKFtCq09CNGZYDO4gLjnrHN21gpCd6gIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827488; c=relaxed/simple;
	bh=l0XTIMkKqN1zTE6zpDaySzAYwNEEjSWW841rF1IHlzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaVy35BGKnAi47oA1erJfmJmOmkcYgNrwgWhc1lG6UtakxKydgyo8030GxdGrCZANqyrceKvA9pwPUvDYLW0CvfSyfa1knLagdnrgBC2mbNfvKyeEN/XRj0SK0D/XC1EuxAnnkz7pl5ZUImk5vALvdw3YMk1czZPhxlRx5DsWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHp358nL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHp358nL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47248615e4dso2868042f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827485; x=1783432285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmtMFmdutnbR/Vf/MchNEdAZUmVTy7ZFFM6Crcn12+g=;
        b=nHp358nLX8xU9/n2gs/I9pZR0TS8AVR1Vlo2+bUmmgMjHCLe5G3Scr8nR+lDIf3K8H
         xMebfEiSJF727vSrUSlBEwNEBiAUvBn3m/zoJGeHlmx/bRObiwZf5G+gGuhSSOyw1mNr
         UTFgypV3diKgFSvwmMQvk26Td3iSdQ8crTQwJF2CCWL/KusQpgJEUPDtTlKC+zsEIMll
         rmd9WfYpzpFC7UQQ6iM8m24Jr2ndSmgUeEVlXLTYmvlvQf4RXetEPrKyLzQ6ZnmkyWn+
         4sHrD1b6UnyTVM3FZ6AO+51Xay/lW74cg7Hswf52X2Gbh0Yz9KZuBEEJ4MvWcDUtuOGo
         herw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827485; x=1783432285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmtMFmdutnbR/Vf/MchNEdAZUmVTy7ZFFM6Crcn12+g=;
        b=P1pII5C0eOC0UopYHYqiGyUwhDuotD2Pf4+q4zwKdMH6dbNOfpOUj1k2i2UkcNEKR8
         hB1yWunbawa/Mn1KNPvCfuFGqIYXsaQKN/qh8npExMn3hGodcTrV4KRbt+a5B5hTCLbJ
         6iMnFSMO47xlX8HVzd3uVBNBTI9TmGihAi5+QRxcpnh2Z6wn0ecGON8/Zv9V8ao1WmST
         WLZMZV8XbPiHyfjhr9oVnUnB9BP6xzILQVdeSaXZnWPSWcVxmE/dccwM+y7jeHBtVPgO
         hZZ+JTqg/VRfFLkdK2wROq9AxIIybXdU5/3Ns+pXR00JvKNAMZ0hhXRE7msPDQVlc90u
         F0Rw==
X-Forwarded-Encrypted: i=1; AHgh+RobpYorih0n+RXcA+HZflweo+X/uvAhV0XYnHyMJP0HI8o/37TbeAuZ5CfS2LtizFd94B7rshN0MAtUhsyp7UL3Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHuPtgyH7nrZ188cbYegiPS1OMtUWWWY035fvBuhW0T8ylekT
	762zX/Fm/WwZh3JV2l0a7wzMKovUigQDFwQBYtlzJ1vtogk9W3fC6XqO
X-Gm-Gg: AfdE7ckRgnNF0fS09CWrfcqlv+jTG3+Smvs23QcH7mDTov+38I0Dmf57TK31NmlLwrv
	5Q+m8VOlogZ7iHUWJW++6AJRWElaDNkIVKBZvZ00XL6KQWR1si5BD2vv8F/aEKb0qrr/86hk0Rq
	GEzb9Sr/FBMGNvx2MRXEdeyPg4QzFiJsyY+pDIOThnk/Xxocdbl9dj0OXOsk+SdrwYr9NypJKWf
	0f9NpuiKuAcp3U7j89zR9OCF7q/HgroEfI/kkoSyFeUgcLaDB3mzptnmUnwtYw7AwILRxE3xIZW
	lam6abDErT4vdWssMl9zX48xXIDFnvYzJKTbSBzC/V2Aw8GNAPawoarf1aATPFQIVKzlHWl24pJ
	urNm6APJdaSbkKswmdkPFTBVufhpwqLuVgpp6nW94gxnr9WYTZg7XbYYT58gvP2A8Cv0YJvE03C
	E7yTRnUf1dM7MklX400kChCkVXUhCqcODlvxd/wQ==
X-Received: by 2002:a05:6000:e4f:b0:475:69ce:ac4a with SMTP id ffacd0b85a97d-47659ee671amr755903f8f.33.1782827485050;
        Tue, 30 Jun 2026 06:51:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:3f6d:4f26:2d9c:ab4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm7216964f8f.19.2026.06.30.06.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:51:23 -0700 (PDT)
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
Subject: [PATCH 2/3] can: rcar_canfd: Fix double-cleanup and unclocked register access on init failure
Date: Tue, 30 Jun 2026 14:51:15 +0100
Message-ID: <20260630135119.104774-3-biju.das.jz@bp.renesas.com>
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

In rcar_canfd_probe(), if rcar_canfd_global_init() encounters an
error, it disables the clocks and asserts the resets before
returning. However, the probe function then jumps to the fail_mode
label and unconditionally calls rcar_canfd_global_deinit().

The deinit function calls rcar_canfd_disable_global_interrupts(),
which writes to the hardware registers. Since the peripheral clock
has already been disabled by the failed init, this leads to a
synchronous external abort.

Make the rcar_canfd_global_init() failure path jump directly to
fail_dev, skipping the redundant global_deinit() call, since
global_init() has already unwound its own clock/reset state on
error.

Fixes: fa5f4ec8fff8 ("can: rcar_canfd: Extract rcar_canfd_global_{,de}init()")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 57f1710caa89..e88554388553 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2257,7 +2257,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 
 	err = rcar_canfd_global_init(gpriv);
 	if (err)
-		goto fail_mode;
+		goto fail_dev;
 
 	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
 		err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
@@ -2275,7 +2275,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 fail_channel:
 	for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels)
 		rcar_canfd_channel_remove(gpriv, ch);
-fail_mode:
+
 	rcar_canfd_global_deinit(gpriv, false);
 fail_dev:
 	return err;
-- 
2.43.0


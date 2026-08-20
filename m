Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0448167D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246241; cv=none; b=N3M00AhnTf0DK4d7RKjq4BWNAtQt1MqVCSoLEhq001dMwe8KfvCq6iLqzYEZfabFgY2OwjEnGZu9Ff7b/l/NrO0XqJWAI7F+vuOczDP0FqeRGWCDDwpHy9c/oH/yXbsXUCImBXtizAdctsBqkzK3cTMFabCfWLizRbiOH/5iewM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246241; c=relaxed/simple;
	bh=Wn0Fttu7yxYczERMUEb7S+VTosmJt8StZV399ITfmHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuk6nynOT0wyKiqTpO4PqoJvZWlgSR/D6AtJyBAeLE+gtODXsRb3NfHwC/4+2/iSUzejRzLeiEnv5kCNqXdF3YtMmAI3ouOaxPc2A9Pv5SPEmEy/pyOyEzxKz9ecBDJG2ojT//qLcGolg038FpXM+o9YdpGiTUyIIRTg2pHnwsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfFNlQRW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfFNlQRW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso621765e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246231; x=1787851031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjNS5+CwaZyA0qQvtDzfd31asexWeBhEBr6vcNzwuKc=;
        b=BfFNlQRWtjdeb2P1US20VesJYyButzm3I9AYq+se1wIBEA1hIE4XxRDrWBwTNaEYm4
         noUUtk7wmqAwY+uUvz5OLs+JngWKq1Vz0+5eGzEaODlqvraq0GYN4NXLFQcMFAV2i292
         +ZTTYw8iJTxDVla+NbpRPNUTcGYPtoENVgKHfbk/Y2i6/JUV2+CIUrpTZNwmh6nSYQmo
         7Nd7/dfxAh8+aXYOoCA18MYIeeJ0rVDWwbu4sZrLIYzesTk2F5P9kNwyelRKjejnNLT9
         N1z8iITsFvMVdrO4RVIHPmPKeFCXPJ8kKaYL1OLX8RbAcvRBMYzOnXLrzNVkZQmcv5Db
         KXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246231; x=1787851031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjNS5+CwaZyA0qQvtDzfd31asexWeBhEBr6vcNzwuKc=;
        b=AALyM+gYnfGM7tcSnBlY/cdP+PQH5Kj0ZguSmdZR7i26XrycTM6FE8S0FselDUw1kY
         jT/7Hr6q43gXoltV932InmmFYINw2sZkopSeDkpRFlfX+F5P0CyKyt2lndbr+ndEUpp+
         RlMTIEaBz9y9gzf24PPZx1p6fiVPqC4u+l2qrvM4sTw9MBvebCuVvA5OSCEPO/poE4cU
         AYYbi04GzMGUoVxZ3a0XwbFI2nGPTWq2j4q0FHQpdyQhPBUHX3i3R2HRu3uWSFMntMRl
         Qkj4n7OH9stzupJy8siQ5tv7j8SPirm27G/K7xjps0Vh9psQxeQOhUCPPvrGZZj3RI9T
         x7HA==
X-Forwarded-Encrypted: i=1; AHgh+Roa7eFORnqsiPn5QYj8bWZnUQh41FR0txC3IqcIigbu/TYy6zRklM/Ihr4WGOUQTtTe9FnwdZxblfjj3hPo68ehxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4x+mWHg9HgHHwJ9ky5CSGzzSGkSzkIY4aJ/N+y0EptL0x1FX
	fwQTcA2lGrvZpPoEOI7PdKmCjem6kgWr+pvyMY+La9zjrRCbDOGe6wYD
X-Gm-Gg: AR+sD11wStK8Q2XDtk3Gli731qryjW7BN4Kv/6vNj6jN/RoYSGqsBTc1U1YuEy2OLr6
	dP794Hxh9HZrdmz6r4yMcf02vhWYCXYopqOGEJULSyiglhMa9+R/jHPoI/edcOQeL20US5CMeNl
	7uf7pB64Udd+GEqi6dYg3N4RAjLLIpDAfp05AQ2ZRxzhoenIxiYvu687rdSPIfNlnS+Arwt6s5+
	lPOrqUxB5AGsN8wqJSrJbwGjSk/NajCz4UNcxy8CMAPKYP7f/K5d+Nsdx/B5X4PuG0yrMgZWE/C
	k9c78J+V1lZeDfths2k1MjczKDzfikJ5kW3WGlgvDblY0Gg3Jq1PrrgLnBjG9eYzLpCurX1ZmLq
	8XYpb/ccgsLwz7yhmx7RuFTBOvwcUeL23VjKFOq6BXmueKICjbUqjgP2BdVVNlH1Ghc6R9ilqh5
	StxjxaZ0sxQ7dyRIHnGuozIBfbKelST+wdxPcNdxKHpt3qVTWj0FKJEOuCwvz8RfyqUH1R
X-Received: by 2002:a05:600c:3509:b0:499:8f9f:e9ee with SMTP id 5b1f17b1804b1-499b8337d36mr6144805e9.7.1787246230948;
        Thu, 20 Aug 2026 10:17:10 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v24 10/15] mmc: renesas_sdhi: Add write32_hook for CTL_SD_CARD_CLK_CTL register writes
Date: Thu, 20 Aug 2026 18:16:40 +0100
Message-ID: <20260820171657.62815-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a write32_hook, analogous to the existing write16_hook, so that
sd_ctrl_write32() can wait for the SD bus to become idle before
certain 32-bit register writes.

renesas_sdhi_write32_hook() checks whether the target register is
CTL_SD_CARD_CLK_CTL and, if so, waits for TMIO_STAT_SCLKDIVEN via
renesas_sdhi_wait_idle() before the write proceeds. Other registers
are unaffected. As with write16_hook, the write is skipped if the
hook returns a non-zero error.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v23->v24:
 * No change.
v23:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 drivers/mmc/host/tmio_mmc.h          | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 99f57f22a7b2..065e175f3b45 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -969,6 +969,14 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
 	return 0;
 }
 
+static int renesas_sdhi_write32_hook(struct tmio_mmc_host *host, int addr)
+{
+	if (addr == CTL_SD_CARD_CLK_CTL)
+		return renesas_sdhi_wait_idle(host, TMIO_STAT_SCLKDIVEN);
+
+	return 0;
+}
+
 static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 				       unsigned int direction, int blk_size)
 {
@@ -1203,6 +1211,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	}
 
 	host->write16_hook = renesas_sdhi_write16_hook;
+	host->write32_hook = renesas_sdhi_write32_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
 	host->set_clock = renesas_sdhi_set_clock;
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index b9de03325c58..8d6d65a51be7 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -190,6 +190,7 @@ struct tmio_mmc_host {
 	int (*multi_io_quirk)(struct mmc_card *card,
 			      unsigned int direction, int blk_size);
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
+	int (*write32_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host, bool preserve);
 	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
@@ -284,6 +285,12 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 
 static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
 {
+	/* If there is a hook and it returns non-zero then there
+	 * is an error and the write should be skipped
+	 */
+	if (host->write32_hook && host->write32_hook(host, addr))
+		return;
+
 	iowrite32(val, host->ctl + (addr << host->bus_shift));
 }
 
-- 
2.43.0


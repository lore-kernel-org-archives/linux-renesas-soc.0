Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191894;
	b=k0DhsyJ8l6M14L9GOYPyI50sr9GrEhrcUu8DPkWam0FIkUAPL3wEVitOUGwzSZbjLwP5
	 ZqH3VqNCqghdBI/G5q8gJ8UX1zzTN7Gc/2IeOrhwDEM9Gjjk+s1LE70mCWORhiEjIwbV0
	 yG0bHTcd17vBIvrlXD+fZqgHT1JWy4G1Jg3+p/CX5uJo/4BYlEeXNms7pYPr5bgQbmSlg
	 nMMuYmFMR24spIX9fRxNBSDjSerBFOD6wF444U3wnh3zVs0q4m9nrR0Zo5r5Zx8Lz0aUO
	 92NstbGpr3gMQO2uQ82FLF1oBIqBsWzztjNitXHHenUk7w+q5GjTuQgthpmkt+M3HsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
	b=XzVIt9JfTRXOQKXgf4UxsdwP+XPcDxFFfYxup/uzck+urxBCYaqVeE5z8yaF4uyhpqeW
	 4wELOBkfSqsEJ/wVsQE01/olz/xXuZdm9a9ore52qE6c4pg0aljn/qmW/PbshkucFGk2c
	 VX/74ZrzadnI9gCf7oxKdSblyq21JIbbzroxFOKZq+OfQX9LTWrOgvCrsG2k/AvjOcBrf
	 ObVNHV9ngQ5kNzKvWeaN8krJ3K3ijOUrZyf+PywrIYvB37L1kgXI02geCykA5aJEV+Jub
	 pKBUE5TStncNgieJovnCF9jq1u4YHJ8nNZEC2dw2bzmUwApX+TP3m3Vc3XNGjBcp7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DC60A5BD0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54DC60A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so697021f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191892; x=1793796692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=Cxv0F5G+jXvHhAayNWRctdZCvgaTHYI7gEQ0bpvPR4tVX0JbRzaa/stQxFjqLVyDZq
         dVq5zYYk67wQJOV4Vm42Ajt0Oq9zH8SAIWqL/DyH8Xz3CsmoYtjnCD4YrUoSiyn3oyQW
         PO/q+P33m3PonZ3LotTCOCRocp1tZWNUdlBUaOYh4vz4pZNr+MYsEkVQ94T6Td7lNSGQ
         Oqg2yXtCOuq6RDfPKelMuVsoEANnthgRjaHoJchsgr/+6fjmTsZhRx03y3qvbUagednU
         tPjRfup1kbyNE7opiQpLOzpFkiQmuILdP2b3BP4dg0FXxoK1f/v4vmzxf4gRnY1HNoaQ
         U8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191892; x=1793796692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=LvDlA9r2W+6/McuNmMJ0hPBKegtSd9qna7+4FGS+2Ow/XoCr5gEFoExAxUew0lMv1d
         oMUryXtp920Ero9e0IFB/rVOJAW5r31RnLBFkuKK8J1rDccCZr2HrH5PUy9hLQXUzQxj
         +unFO7PgCf2u7qZ/AUR+zNzgKRFLgoJLwj4Kf/pAvNx2MDl4eC0Uatw08WNYflw1ha/5
         Fdo22oyOG+RAIYOcEIR4jr46B/WM+RFzQ+3seTGw8nniX7YamtbBk9vZzSxYWsvdovMP
         LRKNB+LFfWRiboSrdq0TlQkPWylWw5nqRiQynkhuJrD+gIjCqMKgjIuyx1X+HoMkQonc
         ZPpw==
X-Forwarded-Encrypted: i=1; AKwUvBxFrgJ2Ie5L3xABXsLQIHrvArOi6Hvcqrm3sxK7TsYH1BEFQthETxWp/azTwsH7Qq2+MGCldweVODKficmaO2tVvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfOCEzlW5N85UoyRbUgDaakw2haFPwlYi+2bXQ+15Sv2LEvvGm
	fRGuhxU0phvtM8P1JXDFHk3lCzQ/H9NUC3k8syLysQwwmqLhQhC+2cW8/Vu/jg==
X-Gm-Gg: AYBFou0zsoI6+AGyZ4rUytpOo9ygsr64O4rkGIJ6vdIoZ3RLF5C+Kp3yhg8GF4z8B8R
	F5P8fOuonKIDqoPVWq/Nz1eOhHM/pWbTKK3HnmoDkn9jUxZAPM3W00lyhPYy1K/+QQfjeykhZvI
	cIQYx7I1O+QAcIzbtnrBvZIq777uSlWkqBgB46zcjkw3xo/RrgUA7cPQI3PJ7/GDgQ72bTMgpSa
	dQhqLalLZNm/tpT/ka3HjZ122UPOKlJvQLUF74IvBuupR2CDPB2Ldjau5HaEAVSmwaXPb+oykui
	WM/QD0bUqPBa5eiHoo3P9JAJJ1qd9codxBwFQONw+ZgHtyjMSqCAIwIRNuVzZOUNVnGV3NdzHcR
	9K/WqYjpQVS2LwAi67/izkzyoQt1DvAelAp2mOcsMMXLZGG4u9UBswQqE0c9khzXVe98dCraxoP
	dMeXgNIvN6hUFw/1gevVFa8pQH3kYT0enskFARDS1g7loI6uchvGUazgHlocK34XYEBdSxWm7vQ
	GHUUEd43iBQdon8/RbIg3IUjhwwYooKhxPrgq8EfBmlEqivIqUMJkExSR83mcGMM9C9mCkb2Mk7
	kKHWyFzsZtAUsRumET7F7UWuQp6BVoZEAs0Xbg8Vewb5QdteUurHWA9GPzhzfGuC3e8=
X-Received: by 2002:a05:6000:3102:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e5d5d802fmr5596555f8f.37.1793191892168;
        Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:31 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:27 +0000
Subject: [PATCH v25 10/11] mmc: renesas_sdhi: Add write32_hook for
 CTL_SD_CARD_CLK_CTL register writes
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-rzg3l_sdhi-v25-10-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3693;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ltWOzQvnXnaIZzBe/fnpRtSR9lOqq9Os7KYKzujgEKw=;
 b=/gBzy0L2P6XiAi0r9ZxYLEERTAZkDff5ULocuimlZsTKkG2n7ba8hs/euuypHKf0FdLK17Omi
 3yeK/f6kiHYCk4b98wHwfG7nArdFyebiNldvD+asBE2Fp3NDdeoVdUB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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
v24->v25:
 * Updated comit description.
 * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
   TMIO_MMC_HAS_IDLE_WAIT is not defined.
v23->v24:
 * No change.
v23:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 drivers/mmc/host/tmio_mmc.h          | 7 +++++++
 drivers/mmc/host/tmio_mmc_core.c     | 4 +++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e897328d5b70..cb41f38ec80e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -965,6 +965,14 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
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
@@ -1199,6 +1207,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	}
 
 	host->write16_hook = renesas_sdhi_write16_hook;
+	host->write32_hook = renesas_sdhi_write32_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
 	host->set_clock = renesas_sdhi_set_clock;
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 3ab8c0d8a2bd..e29a2fe06ef6 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -189,6 +189,7 @@ struct tmio_mmc_host {
 	int (*multi_io_quirk)(struct mmc_card *card,
 			      unsigned int direction, int blk_size);
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
+	int (*write32_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host, bool preserve);
 	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
@@ -283,6 +284,12 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 
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
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 4116c4d29c63..4fe98b437121 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1169,8 +1169,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (mmc->f_min == 0)
 		return -EINVAL;
 
-	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT))
+	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT)) {
 		_host->write16_hook = NULL;
+		_host->write32_hook = NULL;
+	}
 
 	if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeout_cycles)
 		_host->get_timeout_cycles = tmio_mmc_get_timeout_cycles;

-- 
2.43.0


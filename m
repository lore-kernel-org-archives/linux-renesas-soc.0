Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537883;
	b=MpmtoYl5U4UfnECajx5GlzDF6diSeGOcxDYTttmQdgB+RCMpFHcixE//x6boBhEt63Cg
	 lFZVWfJ+QQniih+FN0hT8Qmja/W+VPYyV6XaqPnb4Fmuzgzl0N2s1x2TLBc4sScLyW0OT
	 QJQD5gNhXKWPowcekCtxZ4kG1maT4f3Bw81vFm8oMhgyHyQjkp0SLlLOJ9QvjVGYP83+T
	 YxdFimWqUxWR6aoS1djRrTTMNVWB3kGClcaZLJQ/9V2EtIYhlXnHttHKFjvTFVRYpHwXl
	 8c1B6JskJOlK5zGXKrq+3X1Ow1nKoDpyzDSa2QeGNd8IQ/Xl+/ly3ODKvrzVSyIF0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
	b=M6XOBOFOdI/yIDxZTcK5LSs5Hnb0X23grs4DnK1/HJdGbj5F00ntYfZDujmtE5wgcIQc
	 4bJBzaARbb/THAi8705sRcD7Db3t9WYcQfJoSxxHfR0hfDHGqMxryXXkjZeUvb2PGuFtJ
	 aymr8muhA0ePHpsYn+ox0/7xLjMvIpqL4UKQ0t55yvkT7Sg/KKDdRQJw4L4wvHBclfnSc
	 4FFvYJLxYHYiOFhNmSPGyeY3Y9DoItGXRdU9+zJ5tLhXH8jXqrm2V3LeLRwe4Cp3sT0M9
	 NP1t8s3RChu197AyF90uB4jp0/MzxItHwDwvd8dbhYSiTJeeUfiNd4Ox0N/iA4x5xwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvxPLgQw;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08658606A327
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08658606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvxPLgQw
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so4104494a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537881; x=1796142681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
        b=XvxPLgQw+Hr6BptL+nZXEjfpUUmPl0SWRZAM+FEY270TDBYwbiqVsmfRXFWQGp2Fot
         sqcc1ywRiYO4zCeZQoAAKQXCJwN6OkKBz6YNbQySt7BZNt46MxlNfS/E9YGgsB1Fv8lg
         /xJ0DLjzinQahc2ruQzHDlpxtPSDIekxKtg7/3jOkkr0KDILxrFzTeMDOezHMZ4qA6LY
         JbD1Z+9ptIiNKJAEy0A+m2rRM2rp4L9Yy34H2v21MDbrB7QgWCoJIDj+jmfMlcuSTVwB
         jjP66WA0OOldGwC9eVtkK0+fodFUa8cVpMw2M4bSDSZb1uTXW9bY/biijl/Es1VjhnvC
         vLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537881; x=1796142681;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
        b=y6uUWfs/LBMowiX4peg5aBpMp7ehzrUWAxDhGbN6W/MDpG81kucR8MXvtw4+hFQGR0
         LPdJIKaKIgTSq2LBe8g+GVVoena7gHxQQM0iUzsapGmjcyWDuHw7vN+KpwFNmASQ+vmk
         zk6u1v69qLMFYCeIuzX1fOL64Mnx3kigRcbp7sSYphqD7FggSgNIBnW9RqXjPNvV9nBB
         C0tRXyPV7temeLAvjQBO43/t8qMKTMuB4i2yjY2qLvVrVpnqVbpOwIuZetVz4+YDA0BL
         jf4hcVLYTYsi/izpzzIYdRckRIwjwAZLNyXVujx+RJTadVgOfx/wQlNZbg2WcO/yt4kF
         MKlQ==
X-Forwarded-Encrypted: i=1; AL+hErEjQy5+M+x7gw8NUfwQyCfNvNON07bWv1ePexPKNr4mzfzLW1p5TouaEEN4cbqPABWH4ZRgJOXEAPNl7Qyp/9+2xQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WB9jnhjqIgBfRkHqverJAoc5z1BFfTqr4GsVq+AHm0+nqVLrg
	c/MEWpwNShI8OdqqhojM4K5ew4QItU9N03GPtQ/kx/rzQpaQjc48p8a+cXQiVg==
X-Gm-Gg: AZFdTZfKCpYlSZlqInIBeQOYtU/cJPlG6pTafnfhC0qixF95mH+C0uUS8Qkf9xofoDt
	8TSiLjuwCW8tDM44GPnf02218rzP3B3T571o4r1I+KmW56zu4wKEAcfV9cTQ/1KEzhgIv3IkHvD
	rpKzBJn30orilhYaG9oZQqiLA0Fcts2o9LL/NK2PjnoKoZv7oXmpC0boSbx5kTfh+qKIlfzz/pi
	PZQetWb91FDcOEWIz/cpJAKhySZcydpHj70D7PwPisQsK4RLwEUqwYsPJ1shaMWzJXP889IdHbB
	X1Fv6/zFL6ZUK3rGyghq+l/rmfGBvROa2/AJDNGo+VTEW31ZndM4elQnzTWsfz7Dnhlw+l3q/rS
	56A/ReKaMcVrgcTs1I55ch5B0jOS546y0LnP31PjrStzEqd6BOflVDTx6tgmoVFaoUhnH6SX+ZL
	pBVYgZ/asFQqzENRQO4RFxe16i68dNI3KDu/5rkHVTlBvjnrOUvjTRZYJNDki9DfAWvnxiLGMjE
	vY7/I8wCkpEwO+HbCohKE5NUqOPaqHVA1HZHFoXuzN2WY1lSJNY5GrPZn6lBHUlHYt0mogrFNG1
	hh8+O4XFOa6pGG5lRvWGom/OH3v5wtKgYeEJiB0O/hLFelyLYq61ihw7Cqbx9BHlK4U=
X-Received: by 2002:aa7:c0d8:0:b0:6b5:6b89:e3b0 with SMTP id 4fb4d7f45d1cf-6ba1fc3dcfamr9661275a12.19.1795537881297;
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/3] Add RZ/G3L HS400 support
Date: Tue, 24 Nov 2026 16:31:18 +0000
Message-Id: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIANa7BWsC/3XM0QqCMBTG8VeJXTfZ2abTrnqPiHDu2HaRyk5II
 b57UwiM6vL74PefGGEMSOywm1jEMVDouzT0fscaX3dX5MGlzaSQBQAoTs6HiyctBM9bUWIulZE
 VsASGiG14rLHTOW0f6N7H59oeYXnfmWKbGYEL3uQWnVMgtSiPdsgidkg1ZU1/Y0trlP+9TN6hh
 tbUplVK/PRq682HV8lbXeQVlJWzRfXl53l+AeqSIGwpAQAA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=2391;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=lQGEntqH4CiR1u9MFrLMu9kE6DSxkRjbYdv0Tpbk2l0=;
 b=vj0BH0pIONB915GtElwlKlW7sOZ/HzbofWz6k8QNZHuBjYEePyw4hDHLEGQUlf2MFh/w3a/O6
 IPE3tKir9gLA4h7fPRC/UH8pHJp6Io2v2CSUEpmlV7+Kjb0UsUnL2h9
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v4:
- Fixed ios.timing check in renesas_sdhi_set_clock() halves clock.
- Fixed premature SCLKEN enable in renesas_sdhi_hs400_complete().
- Fixed overclock in renesas_sdhi_clk_update() for HS400MODE2.
- Link to v3: https://lore.kernel.org/r/20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com

Changes in v3:
- Clear hs400_active/hs400_clk in renesas_sdhi_reset() after a HW reset.
- Disable SCLKEN before leaving HS400 in renesas_sdhi_set_clock() to
  avoid transiently enabling the clock with stale divider settings.
- Drop the ios.timing check, which bypassed the divider before HS400
  was enabled in hardware and halved the clock; hs400_clk now follows
  hs400_active and the clock is reprogrammed in hs400_complete().
- Link to v2: https://lore.kernel.org/r/20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com

Changes in v2:
- Added fixes tag for patch 1
- Using ios.timing to decide whether the HS400 divider restriction applies
  is wrong: mmc_hs400_to_hs200() lowers the clock while ios.timing is still
  HS400 and then walks through DDR52/HS/HS200 before prepare_hs400_tuning()
  clears the HS400 bits, so the divider could stay at 200 MHz or prohibited
  non-zero dividers could be programmed while HS400 is still enabled. So
  tracking HS400 hardware state for RZ/G3L clock programming using 2
  variables hs400_active and hs400_clk in struct renesas_sdhi.
- Link to v1: https://lore.kernel.org/r/20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com

---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |   5 +
 drivers/mmc/host/renesas_sdhi_core.c          | 129 +++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   5 +-
 include/linux/platform_data/tmio.h            |   4 +
 4 files changed, 127 insertions(+), 16 deletions(-)
---
base-commit: 522b5bdb42c730db0269a384bf5a2501ecb21e8d
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>


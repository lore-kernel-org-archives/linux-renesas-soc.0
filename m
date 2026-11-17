Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933291;
	b=mb0+K0X0ASdT1a2qDVI8WHKYuau3CtWgWCpXxSpgUh/7x0ZXwZCqKPJSVUgJY3J0KMMk
	 wJQTVLZ6RgpXvbjqkzrR6hVS2LZg8CuGtDEjgdJjADhPmYxGM15AykTS03qF6bK1OzZuf
	 DBpV5viRDt4qRH/Qjm9+wBZQXsWhfOoqKlFweUci1Oqvwwh0ZpuBoF1CH8hdKRLRAzX0j
	 8qD1nQ3EC7XasXuDbAqs2pvwCW4YSzZh+8+8vqVI948dm1sgoPNerdAJ4Q5eMJdqBCRVx
	 CG/xvrakaqZUWn3JMqMtPAWHf0rpo5MT1FUpg9OyCS0xkqir7FCivE6mASaWqBPSCoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
	b=HxGXaTP40dBurUAnUSMu9ZWQFiFVK7KDe4ZhyhAn+jN1/UABIoU6vMyWrAm4E2SZpvmG
	 Fvl5Wju61ZtxTqFDMt4VYamjmoGaELKKdljtZ8woQp3HBWMNw1QK/rC49Px1H7yeAGNZ0
	 4hUOofb117483BwqjMe/xyDG1bbjm8CyXQCJQmXxJB4FRM+i4dmkjbScuraQHwx0NbKGP
	 mSI5fEmt36MsLQ/nv3gyoDHc1bUQgVuQG1NEE9NDpre2XF1wLh8D+02N72iiGgvf7yYs6
	 IhyODRFurcssZqT7tuQG5bA7AEmaX70HTfHI9SeAZJgjIwOv8I4vobDGInLExI5782w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4q3T7wT;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81198606A32A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81198606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4q3T7wT
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5126590f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933289; x=1795538089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
        b=C4q3T7wToBWaEWAHAaUkEgc7IXBfUPR9NnEL98/CNVERz5kG9TGeFB4fZqLgIAD70n
         JMRkTC3c7PdNLL2uD9l1LY3pZ1E1rCpTpHmq9HDCylbBUNSVqnoTOlHrwUUzYMPS94rZ
         uyCvWY8DWOancmBiHuWEanvDTdxe/lKOGFOTewYj2LNJPh9mggqU4h6LfuJc30qv2bjJ
         yudF6uYvmMaXLRPDXnIgAV0qDlcimx8Chb+Co+hViyJxovQQM6v1ciJDL98tcOJ/abKB
         OcnapyrtMkAWiSkbcXTzjiQCPc1F4J75s8j/feT9hdhyfLtx66BnrIMsTBet3DkogyC3
         2z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933289; x=1795538089;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
        b=Uu+3e4ADrS1G1ldJAg++CC1ArodM2uzLdiT1Yd9t+QI5jk3AE7RfbvhAUhzElimf+G
         RU7IAnZw+owEyiQ5ndgA5kZO7sYbE06l5H0lHubqXQlmzZ/yawlCVzY7ZykEbDw2mFFL
         X00RiiYr2hN6hPnbH1b9G3gvZHwd4RjW1uL2I+CpAATRDAeSuU7qutVtrbuOk9mlk6xK
         a+Q59QVLrvjJWRbqJRtpoeD7WTi28D5LyHhERtx2oLZwMzaVyKMHb5bdaLcso5OiE5yM
         U/+JuItgGc3OpPSYnPw40PClxKfXgSZma1K/32aqw5ssTELHOrSs+yOSYd9eOmmXzSKy
         nhaw==
X-Forwarded-Encrypted: i=1; AL+hErGEE4mwahFQaKXb2zyOWke1DfpXbRMYC8Uy9iMOdNSrDlCyC/rzLkQ1bZD8uUUlBw2/3XCiSQg9iam2pvtv/o5SYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9t7aBxFc0ToU/7oBtfkyQ98D5efAnq9EA+i7OiClF1rGSRfFCZ
	1IUk7xpNZH0W0DdA7cWCacfq+ZtSOVG75FVg3xoeKEwnd2OPRrsMZ0UCIJLupQ==
X-Gm-Gg: AZFdTZd8CtO2ZHE23c6Jn40rffSE0goNh7ohs/BZS/r0vtBed1OEE5emmJ/ppTF1Yai
	lo6te3hyf5U61La7t65BtILi15UwaQeL5KOApq6lxvHpXy1ChOt74kQut0CLpC2m0wBXbPZxU00
	lnxu0rYHBM/3eBkYhQ3pfK50OUvrxAQMZW4lZh1CSYrbn/Xg/61VW/eVPmmXlfcf1n1CvED1OKM
	Ci5Ci25SbizWV9VsEZzjP+/rpQg8FkjO4kDdAG1RHs0/qs6B7w5olrQennw83J2QCR0MMQbqPXT
	r7pS7m8kNJPABMzgFBC59tpRSHCY8BywuxdYIQhNGPjI5i0UwS3kWstWWctiyFzAdkw7fVKYzTp
	QRIp2CbR9Rk/0FaCwKCTu5f50Hipuo5pNvl/lddIBy2aEV6LkuUiGfpI2h/1wTBQMDP1K26R1At
	VcrcQIwNlh1v1QG07UF3m0Bt9L7ghxAeyVRTpEap3mQtnHZeif1NV7AXwltx2fkoiZ70CP5Y/JA
	s4j91iWr/f3E7iw6XvO4uI15MCXkeC+MLROFqDYgQvCb3aP/8Nl7IQP+DI+6zQVqzf0YSF1X3wA
	skQm7J0jHrx/mSPTBj4+t15z54jQa4dR9reRrNHEgevPUMgAzagyRhptPO4X1wIK6rQU1e2FQ5v
	O6xfAFnnllvE=
X-Received: by 2002:a05:6000:24c6:b0:491:273c:9649 with SMTP id ffacd0b85a97d-49c70b051dcmr32305652f8f.15.1794933288673;
        Tue, 17 Nov 2026 08:34:48 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:48 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Add RZ/G3L HS400 support
Date: Tue, 17 Nov 2026 16:34:45 +0000
Message-Id: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIACWC/GoC/3XMywrCMBCF4VcpWZuSmfRmV76HiLTNxGRhWzISl
 NJ3Ny0Igrg8B/5vEUzBE4s2W0Sg6NlPYxr6kInBdeONpDdpC1RYAYCWbJy/Oi6UkqVVDZWoazy
 CSMEcyPrnjp0vaTvPjym8djvC9n6Y6puJIJUcyp6M0YCFak79nAcaiTvOh+kuNivi/x5Tb6gAW
 3e11Vr99Ou6vgGElEJJ6QAAAA==
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=2081;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=CBpGJ3J11Ge4CceUmYpikw5K8cAJ7APFU5cYhMUuhMo=;
 b=f1Ib0zXkvJbVhSIRi0rJXpTosKpULS2jRkUem/AewnONbvsTd9To1UD27al99sVL0I+cpOg/M
 8av6eBULDyADkZjoSUf7RzLMME6/kIjvommvFAoXxgYjxWu0Fa2VppO
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

 drivers/mmc/host/renesas_sdhi.h               |   5 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 111 +++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   5 +-
 include/linux/platform_data/tmio.h            |   4 +
 4 files changed, 113 insertions(+), 12 deletions(-)
---
base-commit: 522b5bdb42c730db0269a384bf5a2501ecb21e8d
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>


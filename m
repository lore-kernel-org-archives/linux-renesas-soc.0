Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830540;
	b=366z3NYqQicssEv92WSfAyYiOUTsnIKG6oIcxaWPpEFYSXy2EgQwyCQvLrwDc3cNxU3D
	 wq6gWB/7Qeh0238zSG+7Brj0Io5HPAP9dxtTqRSUprl0kPXnxHBuToCbXp0qvuAzpCFRc
	 uFoeObgz2x9ZzKOCoyPd72AqYcBb+tvvUqvD/+PraUBKb+QL0gobBE5v9n0F89lpDux0K
	 Fugt6VZwk/MV949/FHn29KDWSiog1sRqcjebJ76O2h1ITKkuhbmdpnVi75rIwVWplzUHs
	 qPCUAe36AQs4dhDQi1ltIok+nJ0FYj65RCBuayXlw78VYlV/bRMoFlqMBVOa3cfI1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
	b=fIj68AX3Kgs8scJAwv91qpZBkR1qXin3YPzXg9/hjDX1QXdXSn8Kv3WauYaju3nxkGXQ
	 PVwXk4BJMdn30w2N4zGWhI+r3DXdecz2sA15EtG1CI/0pK+zgKfyVNCorqVegiaz4h2lx
	 M+5Wz94mnTzyVHynhFMvIbpRfQHZlQGYAb1RS9BANmsNoslYTPnAFL2AYHcDcc5fdqMG9
	 F2o2f5xqYzb3PcyNe4qBsb/xcxsRAYJHpGZuryin9ul73fMeQ+WvQEZGJ1o7ncj/BggB4
	 UdZiapzVNsP+uATRFKXCYrYIJSQ7hEl70A0BmwPLb4B1W3ZBjwFuoJQRxCc8fjQK8og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9EMNyZ9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A6606A32C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3A6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9EMNyZ9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so41691535e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830538; x=1795435338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
        b=a9EMNyZ9zyoxMLEVaC+D8hdoEKr0x/Bp/ew18oUrnl+wmy70iLeyTKS+bnTHj8ItQq
         ttzIPbM6oxLcEcuuhswfwJx0SuLZRki/qmXEDgMnTLRCCFlXpUXApKvGDbH+LtOAgHJK
         FOR/f139RXVVJtCa23Oy9/sO+DyLehPyS8Caduh+lhF6qY+Sb6YKeCZ6JknUzkosm4TI
         uKlrouq5pg9u2j5htuo2XlhmhQiGFHSZsAWuaB0rJNNL9JWW5jon8okLd0FnXhSPdAJb
         dYDr94slFeS4mfHNBiL2ntcRP3VxQqsdNgfx4AtpeCxSfQ8eS52lc2++MNHpRDaRlYWt
         TfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830538; x=1795435338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
        b=ntftzK873lSPz8WL7udFfmijm/Mn/mGbCYUTNJy5EIBibkGGsmNLNpPR7PnyZe88iL
         xtn8aYfeTYQyRJaU9f8cr2Q14bUQMN+NAOkwX0gm/Tb0oNKXpbImGrGSn0042g0qTN9T
         qxqycBaAsa67EYhas/EXUHrxytaQbEVtK6gcZtq81+eNO0uar8EqoDCxpkDWimYx0X02
         +EmMy1G0+nRfYoKIMNEi3fQVjkWgKa256waw+Jy1GpuivbtHrn3ry+Zc5c0Wt9eAoQtH
         Z/xZBKk24eT9G+bTszwMzXymII/1cObczgLkJVvd0Bv5mLYh65nSr9cnaGQpymnFxIkb
         sgxA==
X-Forwarded-Encrypted: i=1; AL+hErGL80p9NsvCwT9uMAtOQSt/4zMmBzTlq2QMo0PJv85TiL59cH8InKmB1NiRiVCgsx+cuANMkrk2e/pl7UW35YjTqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9p+ckBhEmUiNe72EYaASWoWTVyfpP9H4vEkKpe5FrlPEkjbvSO
	XOeTkP2XtjiwqMDO2VFbPYE9dhMjBMXLtVKg0DIIxZoi+H1TGKlvnPoe
X-Gm-Gg: AYBFou3wXCMcWq9H1I1KV4sR/L/B54mMidESCiIZ+uJ0ZHeCvzpTqbtP2sxP4xbglM5
	jGWUWaVdsYADpfSRt5dCegP+0FPN8L+EhaW9V6qcx1nSOL915PD/e+D3/b2w+Vi5Nqch1mMEkfg
	HwMd26uzPglFMCY1b2lhZkSkA9Mtl6pch933DZQEXTMl9UazL+8roPtipZ+9zgJhnJVkEDsh1gH
	Wa0DjJ4ba4rjSYAG5GOZG7aPcr+LrSq0tOvuoPJaYZ7S0Wml/O0Jg0yJS3QMzG9sdFLOLkn/sXK
	Ajs/JWafpJmlPXTIN3GgHCQ2J9rPOLbf7xPWZd5xlBCNC14qciAn0W9f3KMoJSXrBfsrjVWRKnz
	xi3llO6CkoJuKa7O+X771uw6JqEQU+DEqy7O9Das2yKm6/Q7jAHBNrImrHdPX27tt0kv20vgFRs
	NWrWoIiOR23Ka2oScLM52O0g7xEhmj3jaVQtfG9Ie89H6IhvTBo0Ve/NA0MzzBJjl/saRvjfsxi
	W5tuAAo0Gau+7NTkPawhRoXaJSZYWcXP2DmizxqFad0cHpxfzxg8P3DrAfqSn7tFTqZkT3sTrWn
	kmugMmEXXIDOMDJ0tbh/v22gIQcT6E+DhBwipp3NzEdQ+3wG8Nq7M0o+ClLEn+SaS6M=
X-Received: by 2002:a05:600c:1daa:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb55a4ea8emr211649535e9.18.1794830537971;
        Mon, 16 Nov 2026 04:02:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:17 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3L HS400 support
Date: Mon, 16 Nov 2026 12:02:14 +0000
Message-Id: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAMbw+moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3eKUjMz4jGITAwNd0zQDi1RTI2NzI0tDJaCGgqLUtMwKsGHRsbW
 1AOrlteRcAAAA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=881;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NY1YQ/WkIlzl25YtvFcKwA/c51TX7pD2EXQVeDyJAt8=;
 b=zYP1Fw6njEwMwgmLH6MA5VIBOowST0gQVNGdraCi8m3mBze9FB1tYgRebNocFRiPvA3godzAf
 TPpeblDjaqiCzeNc/JEss5CpPYaEYHIxZ7bo/BoyiLyYHw/jI+JP6Ay
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |  3 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 70 ++++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  5 +-
 include/linux/platform_data/tmio.h            |  4 ++
 4 files changed, 74 insertions(+), 8 deletions(-)
---
base-commit: cbd778b5609cd176ace3442a154bb22d736d3a76
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>


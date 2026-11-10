Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794276332;
	b=nhCMxsn3/XB+Z6sXi9iVHLsTZkT+uSzEgi06CzV6rgh74wxCDQA2SJe5wPJxAwwCorDr
	 cVVcQ/FJNY19HeWgc5dWjdPRGwzL/S7rzhwYkxLzDP84/TFEfxZp0R40tU1d8flwhOQKU
	 jOE3+D+4FOYUGKLAy89VbQF3L+FMQzTGvuV2h1/Z1VbhiK10fKJXqdvMS4PWWf6ND5sZa
	 jmwROMP35BZXYuisz9JaTA5HwdLNiD5IehgUxdigmBqB81f/Qe2wEgDyoK7a9/xd5trg+
	 2ti1fkIV1p0jAqVOfo4B0db2fYGmDFuE8zncD6SM7sfg/Lar1hTK875xoe8711PszdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
	b=mXSxbDXRp1mKHhJ254bSOk028R/NnMdltPIK3Mb03S9d6iMQ0FcF3QDAc4L/0c5adhTZ
	 gFWXvW9pDGwO54I5wOAF0LpGxJbJQ92s35kq03Zi5lIfUNzjWUcdm+2ZO9PlMosla7SJl
	 D1ciRIf1wPKr2bnlrfL2F02AHa0cyhd3dKZro+u7+9rwSXeF7Pot+lYLOvGLC8J8UcPXz
	 v8MtLuTjOVB0ePajtFcEdtGaMUwcBBE+4J9NE+T3RKcGUCU3jTyOo7Q1dkqC2Sn09yhBf
	 dIGy7mEH4jk3448n5KdXozKSQ3AnTH7mxghuH1oIlshAV6e/Xwvc5b+15CFxKY5/wrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C0606A332
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5C0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so623853a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276330; cv=none;
        d=google.com; s=arc-20260327;
        b=OY7ExdTrp05FLA9/ye0EhEMnKyjlTUtrXIBlBTQFB2GGliJHb5KGy97zHedmLCHaSX
         UIwnk4HDxLGHgmv3bPI8jPkfPeJbpPq9tVnL95n82FXg11Xlmp24AiMP4VE+OabEC7XM
         /SCI9lQSf7b2zNzoqEUUQqNuCLj9W263MDR02F+ZKO76Uo/f/YQB+THbJOv3gX+XkCAw
         Q8N/D55+ZY1AXObh2Zp9P+dbIZpI7PI++IswvIvBcm4zX4ljnwiy1PhMFtxWZuMR42hT
         0eQscn1uDKSRhCtqad99JtkkLVafRdyQ6Z8DqvyxdDQIQ0oIF8UcAukN3woGXU1UiKxl
         LBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        fh=zlwrcYCfG8mmNNC1cbhhsciV0MEExiTEakLQRf2Ckxs=;
        b=FSES1PmftgWTeJ8VCh8srARm9TOUFCA2/WFrEldJQrlFY+DWf0pWx17HzalGHIONJ/
         KXWOTuPH4ifQ6MZ6PsxGchPCG+9Wfv2XqX9Sd9RQxZH0XVEFyWH2gBELrziy7dD7BgKR
         dEi8+oV0W19HAXsDoU5nc/CC6F7lZ6hX688mi7zwwMAbd5CRhlANswsq6bTz3Sdky4mj
         VH6M9Mgj1aqzPdiRaAm4pjpoe8d/rdNbOlevqadIEdrsXx3xgz31qTg7JUczrBG8SrGC
         DOFgRF4Nr0I92appsYzT7MnBLpcJRYWFyD3y/DT/Y4MbxFYQRTjaZntI+EMoU1NP6ke1
         6LKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276330; x=1794881130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=WeSmmqPj9oYt6CbGz2WJL1YHOSbW3KRP3BlaJT3/RZecDRCwFl9shRmqGLP+4GWoJR
         iUGkcG2vxUqZb0p2S2Wrq+uynYiIFP9Dzml0Q8pJmy2//UEsRR5NFRTDPabVXInnvo/v
         VZKGPU7xyXY6+d2xJu53l9S4ztCKhYEQE+AzDQ3/s7J7hpyjlCyGC1NtFsLRszg91uRo
         SN+gDbsxK+pDUOcGzhrN7GFM6fB3EbhzsWBaRx3p1rF7ebWMT61fsLe20jRQBsblZRBU
         uEdURgh/7Rp2GsTZV2YT9wKjy6WXLZ6SDM47f+KOZ2UIiLrHD0yIaZHrB8TdmGLOlbDk
         sc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276330; x=1794881130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=RH8yt7JwYQB2mbwy4UoL4QmI52pSSzEFjJVQ09gEaEMhIvSK7MQaG8AVVOfrH7XMQi
         Wy+iOfBf1sxynncy1VKsKbpCvGC4aYvSAdjlqxDJFhCSBEtGmM/+AcNmP/p0b8H/cB0x
         u4B+tb2MEMYF9lFySh+Uv52IdSn7a/REoV+lJqao6BR7xsOiEUv/Tn3v4J1F7muA0agj
         rI7NZxYFgAHdsw3dxYEBfhdQ9u7H/RskJHCNk5M5uMhAs5JmgqEWl1WV27lyUkW9JyOO
         3dKD+Y97x4A0MaUCgT0q8Ms62YPbAySYRPCv7eLx69rMHV9RYC3XrCdyvRnDWtTTcZhR
         NK9w==
X-Forwarded-Encrypted: i=1; AL+hErH+A6gDpqhLzhyueinwQ1Eg794sWFj7gKaGTxTTNvDeCeENAbO4REYOMLcpJgx9UBlM1bKwLkNe6HBkdPLuot1nyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yYM4yjtUUJ9OGBzHYU7uRs+8mImDCUiVYfyZkMHNUuH4RSsP5
	jTSE1jQU0K6pCM3/RCXuAL3QIQdUB3ixCcyfs7P4tgEpgOveYrJwAuewSeIz4NXRq1bri/5OzGN
	DUrDl1U7szxge61kCVPa4ufp87JqymQ==
X-Gm-Gg: AYBFou36mtYu6Y5TDwM4COANuNaYtaW50/F69Ge0REa/hSTqXuFRiBP/ijXdLXPHZic
	tWr5NardSXQy+u5wMqu0LCe51wgieHxCmLMrD//3uX92SgXEnp8VpWIGqTaQM7mVB7pU4tufGMS
	FwlvYBiBbyrUpMmwqjLiZTqiwsL5Jd8GiId6dSJdl+sukIL7q3BapW1NahsrtlaWglMK+NrHA5M
	TGmGzpixiCvFVFcZhn4jcizb9axeGDPpHf3LmtJbuFp920s2bouYp7mJGPmB5xR1raIRk4elDuQ
	P/MTQinibxtGKyEjAulXtEllElybalY8iI8rhfJbXZ6x3Ku1reL6tq7P9ymXiNk1OAteRux73tH
	IgSO7DTmfdskcPzHzxNVGogaojLE8AALMfnqiqqTA1eBattEorcB2MwjU7/b7MOZElxe4GaW0mb
	PH3M0xSnp99J0UXyax02+avsAuDZ0rflgor16+eb8hWJx+65es5tA1iAaFrfD1+qec
X-Received: by 2002:a17:907:c5ce:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c50495fe76emr88017366b.28.1794276330124; Mon, 09 Nov 2026
 18:05:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:05:28 -0800
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 18:05:28 -0800
X-Gm-Features: AclHuK_B1IgAnEVdazOZdTLnofngIFWRqke7PWcMcLBdIVd8SA8s9C2nwtymCu4
Message-ID: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Subject: [PATCH v4 0/2] media: rcar-isp: fix core IRQ and probe error handling
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the core IRQ lifetime before changing resource-error handling.
Patch 1 delays IRQ registration and releases it after I/O drain but
before RPPX1 destruction. Patch 2 distinguishes an absent optional core
from initialization failures and preserves deferred probing.

Apply in this order so resource-error cleanup cannot invoke the shared
IRQ handler after core->base is cleared.

Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
AI assistance: Codex prepared the split and descriptions; independent
Codex agents reviewed the code.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 30 insertions(+), 16 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

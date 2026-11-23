Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439450;
	b=KKXGYwf0zkXjeQl5hKJjT6YuQvtK5tU0neoeoNuqhbTKnD7OXvTrK+IAUbWfMxKNAS6r
	 pGbXFBlPU+8HuYGBjpvkHFnNGauyxtS3wcJ49i8IORNw2ZepJTlLCMag5iyiln4n8aAzs
	 mVXqr4u62xGpjTWDi3Xn1a+5kaPfhqCcIbV9AEOWNB0QrwOIdVyluMZnRnVCYr8G+n3P7
	 rrM6rp/6oHIo6nVi17OQODBKY3lSrppElWkm4SfYSz8x2W1fkGQJ/4/RyhFfV72pmdSqf
	 5ikg2374TTp3EDHIiVqgLvwzFWA14GkzNxJvqacMsXx6GfsJ40ybAC3BxPI0A1oxdIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
	b=Q/FCPIRbWfunnrcBcXzTAYrmGz6YIRwFPZkYlMMh9WP5zcxGrDb4MAErf3W7PMB8gAN4
	 MP+ueR+GIyNIEoWDoBmSEuRIInJP4HYAtZ88Bjt0/fWlVLzJRncWeyxiUk65EkG9ikEvR
	 fwg2uDifa3+56VNrW0yyNFqT7hYPFMF/s6uLO/czwYqIMVkksiUgql3/862PpSXBHNN4J
	 AuMKo6povtYgitPsyK9O69Zqm+JhdasMqlefd7iaDx+Ra+ALI6qhXCJiA325cKcFQyoAc
	 3dNxncWtG5Me2lshGevHRbjoNMzWEJ9uXmIgHq8y20MstW4AdyFWvHFHAW1DtU6OFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcLgKs28;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB91606A332
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB91606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcLgKs28
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so29986935e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439448; x=1796044248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
        b=YcLgKs28W5afIxirPBaPCeVHDxFRyu3qkerDQi9cA7HHnYD0QliVSlGxH6ErFMP41e
         v02LdtldfFAKcLjOYUBX8EFVnEFsuMffEQHetOWQDJINYjsAy+bXPSytWpxFHwz0pB7w
         8zWUr04mVIFGoHfO981eBjbpzsWa38dCougTeceWeMa0ZNOGc438G1NZdBP+QeSpoS6D
         Y2Hsjhe9bRBZIGPAV6G7PBIa4MarnOc5XHr3xec0GUNWwf0dqi41cDg7SIgBoPZ95Dsx
         FfsNSQ19q792OxHap2XomAG3ri4xG0zY8YzhtYthUGpTJunLT1fJNkXBewF8mj8fsmDq
         E1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439448; x=1796044248;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
        b=QQPpRawmFUAC+wCW6wwM4HxBeOlqED/SDEbnOmT1IhUtKyybGfX0fxoI/5V4A+f2Yq
         2nNV7d6fpcdN7W11JtCUuQnEqSahZxGbFgUdUMfbmGLXQPfRMxJGIV4Vhvpeau0CkqFi
         Z5Xa4Cl2iJPFuLExmDZPin/V8uz7NAxp+2sXS1YZXwBbN++dSVTPY4GRzS5tdVc3TgGy
         qL8p7Y+HhdASfqV8xzqshq+WYKRhfNXB+QnTd1L0VburUKy2AhVPtpjMLEHTPiYBGayu
         Hr7wGBWayRUFrhgU/K3NB3tDlj1mgnK5Q042YgS9CM2cOoH4+Z2n4tUkumzXdr3v4LBD
         g20w==
X-Forwarded-Encrypted: i=1; AL+hErH/TqaLs7k0LRrb8NQpTgKNvIwEAJ+nyKrV/ab0ET6XidEsOyLMhmIu7Y4gKAb2v2FVha4ECvlAq3tUe0rHV40c+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hc4fMNHXnH+y6JVmSAGD/ahg0q3o1M7iF1gWpaJzrbNNLKi32
	q+FKTuZCaIdgiIfTw5NLOogcP+6mawjvw6BHZVGcs9aQZYeE+1bztFoz
X-Gm-Gg: AZFdTZfTePs2DGAWKZY0dHLRZfgXi32byW9arphuGlqYD74pRh/VlIUkDZR+wyvZz6H
	8RsekXPBc7rH12MtJKMeYrxE0ynnaILdozonTS+/MyHmy/nbPLGOvhpr2MKLdB/ovIvPN6dEb25
	nvQZd+3Ig6ciPwFwnYbXuAG9GyFnu5Rx/cnlTv1f/QQzd16QE5mcDlJ+qcTjwORXIfu2z6xqnqU
	CVXvSXScfeakrs0oq2B3+H/6Bq60bTCSauQ6Hu491PXLBUcxR+EnmhoZQcRn3P5MEDD+pdv/GdP
	ssgcfFAgGjgG95ONbp1K71GFBPqGwd/8KiTdnv4FjwHwbrnxPRnLZM6bHr2HP4YnW2/tCVui79b
	CP31A8q6Osc0jDw+HzAtRWwdv4NMSt85hAAPbNrNtkA/1H1LJj6cRz3IF3SA69jbjNS7BwNIErQ
	uQCSk7rTmT7kql5AaAOckbABw4pIydbjZhzur73KO9NuJ9b7M/KevqrQ4Fdi8sF+iWeNP7YfMLt
	77duAQIblydjFYcQvJZUi0Er2iZrGcF4LHW0eQyRg4hOSX9+FPAxv7t4aOZON5/rl1Cim2A6aPu
	+FxfFIaZh9826odfViLVVnA08HfXryRRpD1qHs3qzOJEP8SDKPIEUUaWWpSI6FNLD/0yhp/t7YV
	zIojZRZr1aEX3Di+Wn8Xomc6phMvz7czFsXjBPLxUIyLJiLMoXDnUnCGe1+LxRi8Y8ZbBUQulD9
	k=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr219043165e9.11.1795439448419;
        Mon, 23 Nov 2026 05:10:48 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:48 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net v6 0/4] net: dsa: Fix various issues in rzn1-a5psw driver
Date: Mon, 23 Nov 2026 13:08:48 +0000
Message-ID: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series fixes several issues in the RZ/N1 Advanced 5-port Switch
driver, including the LK_LEARNCOUNT write mode encoding, VLANTransmitted
counter offset, MDIO clock divider calculation, and ensures the driver
data is set in the probe function.

Note these fixes were part of series [0] as suggested by the reviewers
sending this series to net instead of net-next and has been marked as v6.

[0] https://lore.kernel.org/all/20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v5->v6:
  - Added a5psw_set_learncount() helper function
  - Update commit message in patch #1
  - Added reviewed-by tag for patch #1, #3, and #4

Cheers,
Prabhakar

Lad Prabhakar (4):
  net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
  net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
  net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
  net: dsa: rzn1-a5psw: Set driver data in probe

 drivers/net/dsa/rzn1_a5psw.c | 26 +++++++++++++++-----------
 drivers/net/dsa/rzn1_a5psw.h |  2 +-
 2 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.56.1


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BEE318BA6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523999; cv=none; b=LLFHxz8pb1+55mZFo4c+4cyLa/704rJGmztfzu8ulME0yEWDtVMi7L95mA++mtgdHNYX7hSaVZwnJJO1T2fx0i/D2sze6ohxtyaCQ92IY6HIEbSYViNOAC5VGltHBjTDwHD6J/asz/4l6wOyNk7Ecp7hPcnhdUPsJlRDwdUAj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523999; c=relaxed/simple;
	bh=pjR1FeYWT3fCK07KymFSlvdN61443JK+C04q/CejLQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cuUpWl0kuGuY9G625zSYmT++QEpnKfEIj97nNx6abeeMdlaRk8Rw9qe5GuxGCf/Ne1lBTTMukxvro5onucnPY8VL7zCBLd3Kkg2q8HBZOHAl4N/xw7n0fNIltPqB4fy2IDmLNh7dLJrwasbNSR755eCICYvosbaUMpi3+ipLSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g441ur58; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g441ur58"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so8072045e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523996; x=1775128796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cM2Ed0+UHaZsndyPhA9BP7E7XUawbgfNpYu8w9suDg=;
        b=g441ur5810zFIj8p/ikB4/u9DQBIEXWGcwR0c546n+4wOqdhdX8dHbARNBS3gVkQx+
         KwU4yJemUQL57Gu/7Wux/arX7/4F8PCOaeeBItmkafzJUnrqaXl01WpxMB09N4aqjmSp
         B8ORP+zmTcB1EOISOhYCFmHeAEyctm8VxJ3i67nMXkwUkXEylLYEByeBG0MzynapI42W
         ROyl+IGbDgpSnhaIh9AZD3yRmUSv+4ZXAVTnT/+cVEVtVB4TEDWbfAgV4fUynvh6Ev8X
         0h2/XjcwnMsqHt2ttXPU0qo+I2DYs51ZZ9QXhWFQg1AfXBb/2jUxPMX+mhRrb9wL7KZJ
         jcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523996; x=1775128796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cM2Ed0+UHaZsndyPhA9BP7E7XUawbgfNpYu8w9suDg=;
        b=B3ghPBx8tukriSnB8M8+2cDnZiMd2pUggCH6TXUOpedjNkDDQpt86+2lAV0BvqGviX
         pe/NrRX7F8iWT8sH4/LuFxHGWRe8aI/xOjpspfh2cDEeLpW13bumZ2bfqfrGAabBr/xe
         0QJN5WKt9vLu2jB7BdkQ69kexIEM6dayktTTNZ0dywxy9Hn+8NxetcEVPmy7AwJHf82k
         VKoBVw7AzFRQCOdszqLcSGfhO1yS1piyqiN4bqSZqA9PAW291mJQw1yxMqOZndJF74+C
         nddQXeW0F44YfdkYOO1V5DnUwoARi0zA87kIdW32RWxwffXs8d/oI4lJSa6BdLT1+ESx
         /V5A==
X-Forwarded-Encrypted: i=1; AJvYcCXqFgeUF0HBt0YzyWYyiInFbB5nvvnYz34TiY3BJzXQOpuK9inuHJQ/pQQVyvfKQWqgyiIdROwBtt68xBY3Fzv+QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEt4h1qxU+sPJKiUi1PormFH9hxpUFNQ9YHgA33JUIvBizGKkb
	Ad73jhjpdDAed1bmCigSNFhiOSar+QGaoCAFJBioar7Srnsmjm3RcWxB
X-Gm-Gg: ATEYQzyv6k0PlGgO651yzuYGQF9jZzsfsd7AoamtWpQnK28yzitDUd4UgCBiiM0IqlV
	50oVo6rIMCAfqydOf2lTvvLF/j7ECCwv3vgjHnFHxcke+lC2XiNX9y9Sw9SLmPeJI1atyVhJsfA
	OHyrXUJQwjWaB5d63933+ffrRuaGVUb1x80jwAcvF4+MCHCSdxxp7aObNn7v1jFFCOJHYveCyw4
	CA8cBOi0vxyg8octLzhqkEVZACKcUHKEy4WhaEoRYB47qOw7N8HptRCkjcLTX0lg/nTXmBf+16K
	ius2CZjCcewndh59kc4g/5TSQtnP3y8+UkDoyT/PAZhkOy69aKQNx5aoiA+LDWCUzNHelQcXHvr
	X3eqmBisg7UmfvjVIBKl11CMw+cPvDS5lbJ0W0vniY21Z+8n71Q9d/836vVtXpy6fwoct7uGpsO
	GI/kx2C78iQpBu3Dp7qQfr1AblYoeAFb5A0E5SrLN2cFkllHy9
X-Received: by 2002:a05:600c:8219:b0:485:ae14:8187 with SMTP id 5b1f17b1804b1-48715fc3250mr98179175e9.2.1774523995840;
        Thu, 26 Mar 2026 04:19:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872092e105sm13428045e9.29.2026.03.26.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:19:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Enable Renesas RZ/G3L GBETH0
Date: Thu, 26 Mar 2026 11:19:48 +0000
Message-ID: <20260326111953.31024-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L
SMARC EVK. The eth1, pincontrol definitions and hotplug support will be
added later.

This patch series depend upon [1]

v2->v3:
 * Rebased to boot series [1].
 * Dropped ethernet-phy-ieee802.3-c22 from compatible.
 * Fixed the typo txdv-skew-psec->txen-skew-psec.
v1->v2:
 * Separated ethernet dts patches from series [2]
 * Added rmii_{tx,rx) clocks.

[1] https://lore.kernel.org/all/20260324114329.268249-12-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add GBETH nodes
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interface

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 241 ++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  34 +++
 2 files changed, 275 insertions(+)

-- 
2.43.0


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F73D4125
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154272; cv=none; b=Iz+A45Ked3jvjVZJSrVF8XbVGynbZQ7Z8b4PmBlxczgWtJQEw41HmgWJvPIjE9ps3K/JymNjBHXjskAy8daraQlvdSm4Uh/lrWI3W7ZFp9JGii8z5gH9G93tBBfolUT4LAb9W2mXYbmIvqsew4o8Iu+jfxAqPPs0siGjiAQNooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154272; c=relaxed/simple;
	bh=GwvIfQQOrtYqb2e9SFlGdBcFEhVLyfBCXNbe2vV18SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ml6FyJSns+vs8J+7sJLHaQmQ3u+rH2wRFlWVNjfEcykapitya2qLzoO0aYRScSrKFzBXG5lu4VOWEPwjDbRHLZS9t+bCNAARupBF1uz4E1Kyy1gsSmJQ00XiCXHe67O0CHDokSyt6ln2Nk38XOWLaWqx3FP+3eNbQXL0wZmmCx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2y4n89I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2y4n89I"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2374223f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784154267; x=1784759067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIFF0wVe3GbIM2L28J8/WMckrWts7TIeIoXTCBUHvQY=;
        b=Y2y4n89IKfNyrV8HuwlMG2VYaFma5biAdvdKkjY7GG6Do17u4oaPquxCwGdnoUbImf
         8zmWXMHAwH34wq/4sNJ+pZ1zhLScp8/AiMB+p45jUZ7vWjqXM1+q1oQXzIvKnT15cRfh
         u+h8ECA6X4Ha4SkEAgYoTdYXmuEPIJNdEwmmDibTxuLwtWiMjfFl6sZYgBwDjP17rm/l
         sQiWhTwJ3YiR7lMl0fNzxxQM3tvhoxz/jP3s8DGTUMygzf86tpRj7erVB19ldXM4y2Ij
         WIz7gOPeoVCMRPuyjo0e/+xYfScR7JOEPDC8JR8haF2U1x5Z3FJQ7jHvZG3hhT9ZDYNw
         w4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154267; x=1784759067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIFF0wVe3GbIM2L28J8/WMckrWts7TIeIoXTCBUHvQY=;
        b=Ca/BymafbGvuekMTv9wyg6IU8ytAOJtSvGruCLzCACCIVOZxPA3U1fljtav3tX2hMZ
         8K4dBlBhKFDgjYQ3GH8kKK3rahAx7g5pJhYa0R3jOoQF7JNssj5nf5HeF1j8XPIAdQEU
         YK7HamkRin7gBoUisdzXJRDM/Q48XTPUTZbs2pd5Yqq7zrMAxM87xaY2eQxC63aOWCKo
         JAqhZ7LcThviIyDB0aNLj8wVzldU3V4UKRwubV4PWe/njGdwDMkR3o+CSKuLjvfunLdV
         sIanG8BYGzlRsQg7NSHKTMzBfdOmPTVZ9DWg6oerA86msg84fbrHClWrkCP9ChZ2UdMU
         Zajg==
X-Gm-Message-State: AOJu0YwRJUazl/xJzWy3jCsZ70gHWslzAd7rNBMvIt/JsZXo/uNWW4HS
	KL4ZCqQmLU8TEsiP7R6Mdu1E1d3zJa4kEY+o1SDZjZFAZIIqJ5hQ5UTw
X-Gm-Gg: AfdE7clqY7vw9aZoCK/yTIDZ5st3rnrHSYvelvt5I50DQBuUx62gsjQOqT5ByQNxhIk
	xKCJkTFkEojQKwXmFe1sjUljq2jk2tV9dWsR2mi9ZzxxcO4YbSA6eL66arZ3+ue16GCXd46pl+A
	B8jDJoJkgy/9GEznPJnVqcB/XVMJ7EFm9QP0JP2Evpeb6UHgn55di/0DXuXqXVUyqjpbHhgmNfz
	VXly+XEO2wTMGRrpPXCdqP8UzUhnMjaOVpP914su7MW+pZ/hO9BTGs5yutaHnZ6FKAapbDmnR26
	QY+vydWZorTiCFsLsmREXPiMFdyx3NvIB+wyRp7JIuyVQ8qd/XNJK6rxcKhl+tprfnG14npAYPG
	B4BzZZjSnpTWhXkIty5Su8eODJNXT8rQ6f+9GUtrhAZV5emx+Mv9QoyIBuCs7K5q+s5auDvAhpY
	nvuZFTBCAcOxnMzLsKFHacUYCqPSPEwXXGyfz1vDkXKWV7h9KH7qvO+nq3IlLsJuXeRnz9IS5VQ
	QY6X7Et4Vxlzs63
X-Received: by 2002:a05:6000:4b01:b0:475:f100:35fa with SMTP id ffacd0b85a97d-47f2dd439ebmr22245618f8f.55.1784154266978;
        Wed, 15 Jul 2026 15:24:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e036sm22337783f8f.5.2026.07.15.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:24:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 7/7] memory: renesas-rpc-if: Use runtime PM autosuspend after transfers
Date: Wed, 15 Jul 2026 23:24:17 +0100
Message-ID: <20260715222417.2997712-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace pm_runtime_put() with pm_runtime_put_autosuspend() after manual
transfers and direct memory-mapped read/write operations.

Flash page programming may be performed as a sequence of closely spaced
transfer operations. Calling pm_runtime_put() after each operation allows
the runtime PM core to suspend the controller between successive
transfers, introducing unnecessary suspend/resume cycles and potentially
interrupting multi-step transfer sequences.

Use pm_runtime_put_autosuspend() instead so the controller remains
active while transfers continue, allowing it to suspend only after an
idle period.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index d98991266887..ec901a5a99aa 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -776,7 +776,7 @@ int rpcif_manual_xfer(struct device *dev)
 
 	ret = rpc->info->impl->manual_xfer(rpc);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -891,7 +891,7 @@ ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
 
 	read = rpc->info->impl->dirmap_read(rpc, offs, len, buf);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return read;
 }
@@ -948,7 +948,7 @@ ssize_t xspi_dirmap_write(struct device *dev, u64 offs, size_t len, const void *
 		regmap_update_bits(xspi->regmap, XSPI_BMCTL1,
 				   XSPI_BMCTL1_MWRPUSH, XSPI_BMCTL1_MWRPUSH);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return writebytes;
 }
-- 
2.54.0


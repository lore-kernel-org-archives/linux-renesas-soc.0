Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378B235E943
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148507; cv=none; b=m5f+VaO7NH42ri0TrZFgitvuQg5fmj2epNl+/m10JnWH71o8A+09smHtzhaUTJQEV1U6OknNvd3HW7YEAJhmOGzubJ9xS+1ezZ+9mzMMpMvB1thTgIl7COlX9gHT52Xktpj/Hz33eVE4THBdcBfjlx0MU8sZ8jiytxRE3xbJ3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148507; c=relaxed/simple;
	bh=BGj47h7YGQr8NjlIW/jQ7NFJvykn49npgWeaDdpOqCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOqw3nfa7INmxaQRcDVx79Nv6iNkVOsbpNjHTBVfsjw+OQqZ6z/6k6c5HZJ93PVf2oOYAA2WwCqQiS/3W+5xmP8J6gvSCwS5Ndk8bQEriEx3B7tOf/EPSMSMZ2iNw0Eww6jJOXipx1nRXPH+Lergi8F5LeqrbIP7vOeaPen5770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii0NNbOK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii0NNbOK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2610657f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148498; x=1785753298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7T+3vNzRFNnPkYd62tVbnoXfYNl0fby6njEWI8ot6g=;
        b=ii0NNbOKB863lu4Vyq/lHerSnaf68xOswb3rpMec05Lma7AZwUPTHdrrueihIHheAl
         oVS7ayQHl0yEXX2EsUk5lmxjAP7+ysCev8Ar7LhItpYnAfeZwPaUR6ymr3MPt6FgIXlS
         pKkThomLya55qF9WJDxpA0QfeB/w0WihLw5WbQhDoAZ2S9ADTRj/8L6A4hsYrw/WPSmm
         8vl63enjFKOaSGaUF9KOTd5nV74PIqKwMslywZWc93qJ7iIjBpuXWJPKb3R/4b+rl0+Q
         QFV5DkZY3tNIVfIMd1l+iMD+D9tY4GgCoJ0l3KadImxVK0Lhz8QW8IsC5GjigkA17o5l
         lPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148498; x=1785753298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7T+3vNzRFNnPkYd62tVbnoXfYNl0fby6njEWI8ot6g=;
        b=Yu7dQZICICM0+UvJDiqE7KMLQ3duZM+zrohLy/SkhTegQIVulQaCVAw/gzTthwtKVS
         SsKpwDFbxwyS8ipnooeM4epFlV5SGcX4vFmBPKN9Ry63ErXaGdo1OFZ9uhvhBK5m5vKU
         ZDa86FGcw+h6rNEsSMnTlureKa/lQYQjv1BK7YQd/6wmNzuep25CxUzITAtP/jOZrxc9
         BVU03LAiiBPLev6j9VPyfWXJALNvTx775U+LxKg/2NgUt8VHSIAKq1GBddJzxGvMSgf0
         kdPTcsYiVLf2o8+beQ6IIcgeC5kzl55jknBF5VrxAB3Kv0Y3+Fu7m7PW0j2b80wVVcg3
         5Ctg==
X-Forwarded-Encrypted: i=1; AHgh+RqgZ0Dxzw9R0tBBJjOEBba2/HEo++NvFNSHIXvuap/f/UTlY42KmiZq4Nqe9cz2DYAGsQSTR+7eQbX3jm6kMts1Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSAapWhSnDY7If+HjsSNiD2XvK0oP/rx5mrVHGMWc6zAHPajw
	3InpDQnipiMgggf7EPcFEPpLXDKoKt2zVEq24i0ihE0kRwF3cepeaXCi
X-Gm-Gg: AR+sD13JAkxSVPHn2X3h4hVTKVZXRQPXywxnOvWENDHKo/HnNRFnpg7s9jjeALh7edR
	VpKLBA2X6ZXdTPervBvV4Eiy0+A3RjmEhJXMsGnGUTtDhwky+b+SZ7avDVrKxmiRapy9EwTR3AC
	5MSUkEP+0ld/h3CLWIaDJAfVjQFxjhV82aSG4fCwRdJfaX0jfrMl7QH4qTiYS+iGBFhii7GPDl/
	gQNpTL5gOJPQcBSTJkWhWKjp4OjgmLdV0/6OyrH3Fikh/ym8hsaLdcfCzjwGWHpZBmavwVgNAIk
	X1bPAPBBeoosORmvCkvDIfhcqQUfwpe3FD+0WiTnTOV2LGxyrHdArgtZhA+oUZhB7oHIUV5pksu
	x5SFYkOIItgTRzP5ZV+fMSReeFDIcvtZO2RjAT9nWD8bPC32C9HCYZaUpc1A0FeAeiUPhlymJ+u
	i2+BxXQViFmz9uL1KQVbKvE44TCrJtB94CwGbRlyIeuf7vOUchZSosNORmgSrF9INUptU1dNsOr
	Z4iUS6kqWOHYeUy
X-Received: by 2002:a05:6000:2282:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47f9fe93092mr10277770f8f.29.1785148498023;
        Mon, 27 Jul 2026 03:34:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/6] memory: renesas-rpc-if: Use runtime PM autosuspend after transfers
Date: Mon, 27 Jul 2026 11:34:49 +0100
Message-ID: <20260727103449.3188105-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Note corresponding pm_runtime_set_autosuspend_delay()/pm_runtime_use_autosuspend()
calls are already present in SPI driver.
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


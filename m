Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303973F6C30
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148505; cv=none; b=JxKDkcBvA+HyJfSzxgEPr2+7E/4r788pGz1vZuHa7oToag2Bh0fKpciRWc3EchjkiexqRjGPLwTIZFYrMiQ03a44zQddCWfOpRJXDMk2YAp+X35cYUx58zxcnjFRG0YYZL9Mk6W2XEgtmp/gm6vvRKbDSqvcp4qFE+xjdAsMEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148505; c=relaxed/simple;
	bh=3R5AIvL+ZfTu4uuHLxnGEQus2mYWcwAuozqWqP7sW00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMcMBwQpGS5eDyQLuJxq9TwNSr9yDWKM21HRjrk+vGRtLnS8fNVnbG87hkXDGxPVpTTKYSGF4c4u511IWl4QgmIg8WuePYgGzYubC9eVnom3JiEvAkJAbGKHSv+ClKYQSDssch+5uW+sToHh2x8yXvnxhA1YhAUeZHd40tuGeAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhkGNS9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhkGNS9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17251445e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148494; x=1785753294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRER5FwP1JKPedFbvlxT/T9pBcmgydoAphG777g9sE4=;
        b=iPhkGNS9qfXwWhca4Zbt9q6N3zDg+iE8H4tQU0jVBPNMHuLz1xxNLEL3DtT5oX49C3
         uw0rT6sJrJez9LTzKtW0UNip9dfvevSEDXL8rmJE/jT2LssA1nZ7rxFwo5bv9Gbf6UXe
         b/G8rhhX2fv/ww5QWQ1OmDJa8b4epOc5Vj/ckPEXvO7V90zm1mdM+lyZEl8ODuiX0T3Z
         ZURXT/L+ws6FEdW/qEXfZ6QnhuTh/rehg1e5is9VSijI7eLl0OvQTU1Cyh7aytnKvf0s
         HShxBlcs9chGttMp9coBnVYE4wbSn+N3m9tlBXb275V26/7jppm+UcFj9mCZe/XoNC0Y
         qllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148494; x=1785753294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRER5FwP1JKPedFbvlxT/T9pBcmgydoAphG777g9sE4=;
        b=fcv6hetF6YBHnySiFrvpmpfTInmVuhNB4bKn9+JuuECGpW1wXCf24UpNz8OKmqHIZL
         TKR10EEg0P+PuRKTvOnhBoJ4MKz39U34GmbqP0lmMtsKX6TDTHM6jlpmP0DkVz/wzesV
         nlpsacYp2rLiaN7y1uWca1G/fc2NOpk2wJkGg+8DoVmKcc69fb82dKTk0RhW8ntzJxfZ
         9LGou2Y7inrq7aLUqOWm9S20ea36oX8cdq21a362DyS8jeTiFM101WAPXROM8HU1YDod
         9F9DZPXG31VUbjH2U9QJId3pd4w+5mXWbMUXj8x6VeMusBbXOhyk4/skwrG77LP/QBN7
         vJFg==
X-Forwarded-Encrypted: i=1; AHgh+Rre6DawVFpBuHjnSOKu1fJD/BbFru8LKvrlFWoRl6ckzCPOgd+/8zVyD1aULQUgLFnjOgKBkvw/tjJsSYWSKF8yyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0c63G0UeRnSaRIhSJ2oGaBd1dOgEYDtEzMLg/TZXRy3Rg0N+
	CVAqe+0dgMXe8OPe4+wG793MlZmtN3+VDCkSnZNOZVXSk/gE374OoGupC2YItgit
X-Gm-Gg: AR+sD13ZjkmiY/a8nPwPBzCuTTzWrv1yPwjLxQl9HKT6Jya1mwwmxIkdZbqwb2GCmGG
	iEouZKi5L8jnFRk4Nk38YUEnvF+2BOHqovNO23nFzf3YpALmLx4fCmfRDh5vEd53AhY3sqkr3WS
	NKbbG7xb1yTxxyAEREnW8VlgPN0r9LTC76nMf3nupRB7iSqKZdaJW/h/pROaRY3c9zhhdi8/gHS
	JvMpu6KCQeqLUMxgH6L6QvrCL9TtboWA2iRJa636ay0rF6pQ7XBOQThxrMAnYrljKq4iojd6CP8
	l3HBNl57k6pAqb/QSKIn0qOjBOU2JXB1XvXN1R92MZYVTXPwxeUxB+h4IxpZ/zQ3gviJPeJmPhR
	XBTwS7QVk6jlIWbMuvJByhYnrsLBOOC6/sd/vshwhh+urWu+DTAkyloNTnmsxAmt3ResursVgmA
	31LWlsLqdcW0fP9xCu4QqEeA6QDeHmOTSwR9JsRB6T6VcFgQO9xpJThD12OKJ57hNlh+/PyQsjY
	NluIn5kML8QhHKH
X-Received: by 2002:a05:600c:4452:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-496b56ed012mr86327905e9.14.1785148494370;
        Mon, 27 Jul 2026 03:34:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/6] memory: renesas-rpc-if: Optimize transfer overhead and implement runtime PM autosuspend
Date: Mon, 27 Jul 2026 11:34:43 +0100
Message-ID: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series optimizes the Renesas RPC-IF driver by significantly
reducing software overhead in both the direct memory-mapped (dirmap) and
manual transfer paths, maximizing transaction throughput, and introducing
runtime PM autosuspend to prevent aggressive power gating during
consecutive flash operations.

v1->v2:
- Dropped `spi: spi-rpc-if: Implement 200ms runtime PM autosuspend delay`
  patch as this has been merged via SPI subsystem.

---
Performance Results:

These changes were benchmarked using flash_speed on the RZ/T2H EVK with
xSPI0/1 interfaces operating in 1S-1S-1S mode for write operations:

xSPI0(MX25LW51245G):
                 Without        With Fixes
  Write Speed:  806 KiB/s       942 KiB/s
  Read Speed:   5333 KiB/s      5361 KiB/s

xSPI1(AT25SF128A):
  Write Speed:  467 KiB/s       501 KiB/s
  Read Speed:   17964 KiB/s     18285 KiB/s


Note:
- Patches have been rebased on top of next-20260726.

Cheers,
Prabhakar

Lad Prabhakar (6):
  memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
  memory: renesas-rpc-if: Move static bridge configurations out of
    dirmap hot paths
  memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write path
  memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read path
  memory: renesas-rpc-if: Consolidate command setup register programming
  memory: renesas-rpc-if: Use runtime PM autosuspend after transfers

 drivers/memory/renesas-rpc-if.c | 87 ++++++++++++++-------------------
 1 file changed, 36 insertions(+), 51 deletions(-)

-- 
2.54.0


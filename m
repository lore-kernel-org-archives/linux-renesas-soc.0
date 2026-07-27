Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C83BFE26
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148504; cv=none; b=VdtkQB4t5CF6kAX2beD5D+98W2wzt5crAw9On4ACS6ZUfhi+U6fOsOVYzGEz6GwKUhJEw41SRKiM5yG/kdY6n2HQD8VUAcD01VzkDlrqDzECLs8TLAB9/76EJSJLsj5GljSj5LCMt4alAz9GGL+icX6sZE784petfR9h3apNibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148504; c=relaxed/simple;
	bh=uwqN8ydh2yWuiSaCkv//cC0Jf+pSP4PQ94Q3elX3Tjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbK0iqOYvzchAQUB/F6dB648F0yWWHl3L5bhuCaEddRD7IopUnJcw6QUwyCphYnTm/Pq2VeIpTp4iyxJ5w2cHAEApg/KKCplphwP39hrDFj+3XHgVlklLySzZ/GWAkWNiKQy2ZKSJlGGSn/G2lItmxNlD6SA8OxX/ftZH737lpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuNbUY+J; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuNbUY+J"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2070381f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148496; x=1785753296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rx6OgR/abZgnW2Cg5Szzka1rX315tDSAtj7sx/+ljSs=;
        b=BuNbUY+JDlDoyDr2tF9Ygbe1NAgFtyRT/dMfMVASI2YpqifvI1H/YtH9jxDNEpmvwr
         eeqXxyogU2+BxbdRDebtdMO7XHKYaJ82qifKCcbi7NGqvKkYkWxXx5UjJLSuAc61/8mv
         YU8OGp1uDWpeGFy1Rjj9n5FbOqXHI7IpQKEiVV57f5IFC4aDXd7DylkeG3r6SrlUuY/c
         f+5CJdrrJxCylcEhifCLJECYq1f8lJESCBy/jVOyhNkUotm9zNr+3oJGrUAHP8RJ4oxU
         J19y03GwteVfiU6ZQ0XBThPiH0Sf2ziFBOBsf2WKPN80U6Ok8BSdHmqzCEQbzUN1G59S
         Ncjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148496; x=1785753296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rx6OgR/abZgnW2Cg5Szzka1rX315tDSAtj7sx/+ljSs=;
        b=qfXxxwFrdHrArVy/ez5Q6CEhWdrBoELznMzk9jZQDPU117zjq5G52cc7uiQ9w2sutD
         SETyEac0U9tcoWR7TUO978kUmG+7R6oG7F5q6dM32gzEcMYv7PDNVvTjJ2i5bXpnei8R
         eSfd6TQq8Keg1zfik2ktWU3pjCqa9iNJGf9/wFFyx1hQpwvNIAuv2V+HvksM2Ggakqyw
         ulhy4Kl6fWF010Vmqet3V3yiJjcHXKm4K5cjcQEOpL0xVI0pPge1L3WM0DnApI6EvLMU
         t1A11qE/BrMtv8wfsiFeXao1NueCLpYa8bT0luFi0dzTPKHdbcanT45MhdoKY1jRLyYj
         Xhvw==
X-Forwarded-Encrypted: i=1; AHgh+RpK0JqkqXuNIgvqax4oxXx6/xay2WCTdkde2WNjv4gRB8SKQEZ5B4m/ERmFlpgF9ip/GsUD1Wu/cRoH1sorcSOuhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnmwv4f57pieL3l3hrULAqRKG5WnSICZbkbIEmiN5+FaMZyJI
	wlknfFZJoVIHHBwQMc7vRIxRLZN763NkoJXgoI78zVOMOV0Z2EnAnmNN
X-Gm-Gg: AR+sD100La60XY6k0Mzk5fOpvfqOHzTBYS4eERYcHtsBldJgE5wFCVTq+rQv8Cq1AGP
	i9IK48oPriIaBBXiuFrBCIrfhxeNEX8nYXIzMO+Hobs/ngQU4LybTx8MWPxm5qjBmThj2f3tHeT
	g5SBkUPX2QPNEwB+1ONShTKsawvc/G09dzON8QsFzASm00CWpsQRAAff5LH5gOtPVY2B6dPp6O8
	n2qPJ32JL0oVznMt/c8TwTZ3ORoe5yVREMCtfFSXE8XpgwmnvQRJSz0ZB46ofLO/ei7xJVPpxoi
	Spj4Y1Vlr3z4OdjjSjf3d/FUTGBjLGD/qcYjCgHfvve23skJLuSObnU0s3ulrOQjgikAjyGwSiu
	33Ib/llWPu6dgerlPS6I+jP/xU8FzyqYbjkPi89aIkB9YdInp3HwwXmRxSbcE9rQak8Mtv2DAYS
	1RK3/kaZdQSOYP6LZbMvVxb+rrUnIuTlMIrEiM08oDe5sNHz07YPE23C0ERTGJBIB0IHVAUod8t
	Rpw/dIlo55EtQxu
X-Received: by 2002:a05:6000:288e:b0:47f:8abb:1fd2 with SMTP id ffacd0b85a97d-47f9cdaf515mr15514070f8f.3.1785148496248;
        Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/6] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write path
Date: Mon, 27 Jul 2026 11:34:46 +0100
Message-ID: <20260727103449.3188105-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Program the XSPI_CDTBUF0 TRTYPE, DATASIZE and ADDSIZE fields with a
single regmap_update_bits() call in the RPCIF_DATA_OUT transfer path.

The existing code updates these fields through three separate
read-modify-write operations even though all values are known before the
transfer request is issued. Combine the updates into a single register
access to reduce overhead and simplify the configuration sequence.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 50294e5d2bf5..e406afc42616 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -660,17 +660,12 @@ static int xspi_manual_xfer_impl(struct rpcif_priv *xspi)
 			u32 bytes_left = xspi->xferlen - pos;
 			u32 nbytes, data[2], *p = data;
 
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_TRTYPE, XSPI_CDTBUF_TRTYPE);
-
 			nbytes = bytes_left >= max ? max : bytes_left;
 
 			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_DATASIZE(0xf),
-					   XSPI_CDTBUF_DATASIZE(nbytes));
-
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_TRTYPE | XSPI_CDTBUF_DATASIZE(0xf) |
 					   XSPI_CDTBUF_ADDSIZE(0x7),
+					   XSPI_CDTBUF_TRTYPE | XSPI_CDTBUF_DATASIZE(nbytes) |
 					   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
 
 			memcpy(data, xspi->buffer + pos, nbytes);
-- 
2.54.0


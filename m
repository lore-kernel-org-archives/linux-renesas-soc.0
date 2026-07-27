Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3593DDAE1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148499; cv=none; b=PMRT93uCHBp9u9VRGhZbWGbERpDYZFxRph7+a8djIm6Pc9szoONjK+zh+WqribcaFbbcgRDIZ2FaG+Nq/Agktq6TdcSIDH5KWjo4S8fgg3/5sUmrmF80PaHCLVJ+voi9U16hLdyi2FtKzebA3fcXtK2wdkPvZriixh7ApEb/Kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148499; c=relaxed/simple;
	bh=d+ktqVndZJhCJrT8O2h4M5jsdq4wiPW+WKcCbzjTV00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hb27ZDALkSNjI4IQZ8fvfZOpOpM1tgwpPjJVN2a7YqAIHb2R2Mwtc/nA7wdPWiDAPpGIfZxX/3nMfLRzRPfPzg8f/NRAYasrETwe+T53/npFM8LUT/oCsvx9oQVgT4lUsz8Ed0LxDUojZb0Ji14SN5lTKdE5eyBzbTy6hpUdfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFy4i75F; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFy4i75F"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2070361f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148495; x=1785753295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WEq6Gzmt1f2hEZj2wO18jW2AXF+11Es6P4mjwJfz0Q=;
        b=ZFy4i75Fxk8GzZ0pR0P+RE3AqHbcmHIe4syfvgc3RW4Y1zUqRIWcSn4HbgHu3gzmMS
         +vmGyiHfLHcixBEOy/12A85Oro+kp2HU+6LAgKjMovaUzi/LCUktS+6LFgeKuYbP1/L3
         KtbKB7YEJ2xW6or+zd0tGNGLDPKYTB8BjuclVOl218JnP9Kwa+X+FpxngTcNjcPyIhUa
         ZNsWhZcVtneaklAWclkvMM71etFV/RDf4uHVru3XXxqfnKEU84swKdMP7vXCOviO+u8c
         bJHoaWgSHJPxwln4wnIm2Gr6QEZsHozf+imongDvv0K3bZoMQxYckQGPaHSaBmqucJ4g
         fzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148495; x=1785753295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WEq6Gzmt1f2hEZj2wO18jW2AXF+11Es6P4mjwJfz0Q=;
        b=Z0eN0fJp92RI2MBMIMz9lXhD6e8rRzf8MTokkm6R16OkT1+uuRI7Kz34Y+1f3/Sk8o
         xH66QcRfYQj4RPMiuTKoTsgS2rwTSoHODwkwTnuHgPsqRjgL5fLmy54/rriGMzgm4ZUK
         xfhqlZ1hu3C43tDxsM1cY8DOkw3An3rvml6gornD8XzLgbtyrboEdIGj+Qt+8Qh35qMJ
         eFW8IFexf+2MkpJSsqfeIW0yd7EATYu4SECud5vWsutzlVD1xkW2J0NFKeuomuwFQb/R
         KgpV1mqQBAM46WXyBAQ9T8obCmPHRqL8XLlH2gd3VgrE62JudwKYxShhDyjDzGziK+8i
         f2sQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvioF7RsCaUWXcxGm1g8N4aDv8JtpFkT+3qal9BThziTSTP5GBOLUo7ClpMd6R4zMXPPgZIrRieNXSmn5ActqAng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUn880zAKR54ZaOhvB1NVK+A9f0eepboBHTb7Lj82zQcmSifBJ
	vxJr590KSYXof1n878/yXb6K7e9hFVyobM7ToPWb1So1yw635V9thwF5
X-Gm-Gg: AR+sD11qrwTvReovkTYD39esvPUUDX1b7JyaI3nvQHuXAI9lbpLJpTAfTrGkZkVHKuV
	o0frEZzgJZqlK+bSO/4llsXNruMPAiGvn5pRygNpMbmgk4uMALJ/DZzFhamPmEyw89vLq2/c8El
	Ba9V/DfelFgy2zJY+SAs9m1dUJNy94Z/n3lTHTwjgGo/TCiVp/96Sb6o2ZlWtFflW6nrXS0M7nt
	qhcXmXf59zoolM3057GqNx+l85VAKMazQ7mFWNuW3cHm7wqjJDH9WG6KE3mK8NOqADGBYCQr9iY
	+y0pk1n1PEYBjQFM33tAUiYqvO2nLwYe62IyiJ6hhAWtu0N1L8SJPIs1WkUf+A2qmPn5QCjYFr3
	KNH3IEhQvEBmwXyqnJ9atIrti/6lH+AXdPs5Pb2Ai+ZmUe7DTwg4Fzq1WzzIvqbsZrBijg8+8dX
	gZtR8ZREbLa0gzzHYhBiX/1ujPA27sVw/7HBll6kvwLr3kEP5nfxXXSM5yk0zX7k+p9cyhPOvKv
	gziGX5HWIchIcPZ4pk9aayI6oM=
X-Received: by 2002:a5d:5f88:0:b0:47f:537b:d5d0 with SMTP id ffacd0b85a97d-47f9fec9816mr9416059f8f.28.1785148495056;
        Mon, 27 Jul 2026 03:34:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.54
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
Date: Mon, 27 Jul 2026 11:34:44 +0100
Message-ID: <20260727103449.3188105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add XSPI_CDD1BUF0 to the xSPI regmap volatile register table.

XSPI_CDD1BUF0 is a data buffer register used during manual transfers and,
like XSPI_CDD0BUF0, its contents are transient and should not be cached
by regmap. Mark it as volatile so reads always access the hardware
register.

Fixes: 687cac9559d8 ("memory: renesas-rpc-if: Add RZ/G3E xSPI support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 3755956ae906..104c28532c20 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -34,6 +34,7 @@ static const struct regmap_access_table rpcif_volatile_table = {
 
 static const struct regmap_range xspi_volatile_ranges[] = {
 	regmap_reg_range(XSPI_CDD0BUF0, XSPI_CDD0BUF0),
+	regmap_reg_range(XSPI_CDD1BUF0, XSPI_CDD1BUF0),
 };
 
 static const struct regmap_access_table xspi_volatile_table = {
-- 
2.54.0


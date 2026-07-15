Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892433C10BB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154266; cv=none; b=YpAlBKATfEI9WtJKX2qWorR9kHDu4m6iCbo5FPtrrnsKBbnLtCGYJRk7rOI0HIIKiwoONer+12djDmqWhMmMNdEzJzgOaGVUHvfnH4V/gr8xTfzuZt7rHHiN5pmZV2LSCwIDAZLU7ZloLnH5NnnL8UQ5LxiHFSZ+R01wW7oxlfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154266; c=relaxed/simple;
	bh=d+ktqVndZJhCJrT8O2h4M5jsdq4wiPW+WKcCbzjTV00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcQ/dTxA98vBkfA8HFHATYRtkFqQakXqcmyTu8VhSVyQC2fszRFLA1cpv0m+W73edLIN5FMaXNJvsr2z6JVvdmFsZLZ5PmVPIRpvvqluj2NuWZFtTwTbVzAaQ4n7N2+P6OZ+H7C9zrl2Ge+l/XZpIsdqXDJVZ7Tgoz5hqCkYvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0Wc1nws; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0Wc1nws"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso5571037f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784154263; x=1784759063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WEq6Gzmt1f2hEZj2wO18jW2AXF+11Es6P4mjwJfz0Q=;
        b=o0Wc1nwsyCrvK2SlkyiiD2Kzdg0ZHfdeFVVn6Sjwr5mcMxh2/wjrn/GLYcpU5qvt86
         GbepI8Dm1KMelKdQ8RQRE/FZJ9VM8xTgIFuf549AyDjSI9nvaVbwAuTVRUuUn0MZtpMK
         elZo2He8ex0QKDqxaDyPMWgF8bjhIzTSWspwofDMw1GGLOEpGlHUx4jBLB58UX6oN3LT
         RZakbWtXwGl4QhzBpJbKaavbNAt3xY0HA8k7pNu90VFDVNIWrPMeD16Scw9Bhawiiqvi
         pERr4AHkigkD3aO2VEcX6H1dJtEEimkkTu9v1ho2qu1B282pxrLO1hVlb2zdz+FyqgBY
         FdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154263; x=1784759063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WEq6Gzmt1f2hEZj2wO18jW2AXF+11Es6P4mjwJfz0Q=;
        b=I8eV0HOLSMLcRovv0GyMJWqHnFpOvQ+wquZ3aUQ2Z6LuHwiUKcEPslntKaNosvK7Gn
         jQuB7n+TBfjr5MHB9Xy+BNQYjQkLHOSJxAI8HjEzdbF/PWqv3elFWoxlnM9BxtdIx511
         pRX4EUwNYS/0IeutnANBzjGqNqcbYoW1qFQhIRIYrLr0Ih5CdkUYjAiupxgK+jPvDrlq
         JYwqXlAcX7iIXaEyalI20/AJ+eYvZYkKUyis7qRrOh67ZwIyxeuRD6VKl1oHdmVjrkLe
         jUo7MhphpZ23l8qLTY4WZcCCg5HGY1rw4Os7fR+pAUDSIzPvsKVUOYHPsuO6nFImid0M
         I1bQ==
X-Gm-Message-State: AOJu0YzwwcCVMdM0U0EuE1jWQ9yvwO7PwwDts4bL2FuWqyqYqHHdYyN7
	BQTAuFsLO10ahvS/v4CXmpDhedqjoNhd4lAm/ByEBOkePep1YfJNfJk1
X-Gm-Gg: AfdE7cmAj73AvRbDhucXGeFyrZzGU7DeuKfMxHyvHLIpeYq/myQsHgZx5sMhjjWfXTX
	uaI3PsPq7+/5QBZ94uTc9nG/bT/R8YGoh+NlebJwqttOcY4nEBVLqjhTdBRnx1BcygD+6KAeDCc
	unvubjcZOkcAC7vtGr9OwJVYQZ7DbtnHfFi8th9wBJaVT+wkVBopmiWABvo4hUacRc3QFB52TWP
	EKhFv2GyFsS7dGD/u3RsY7whmc+305BnvlSKF/PtlOSlsuvfTf48ao6nrA4vcUH+f4HU9jC5PK5
	NjW4ivS9r/stwE/l5JPXss2nwwmSatb9xFsC5r4iYFw4rG8FAIdhM5JNOuLtmI8wXo6ev0CufOT
	WzhPQNP08Qn4iVflKB2ZNYwf/K2Y/6Fz/+a2ShOXVIz11gpbyi1wONQevAunhPGJ/7GFHYY8rz3
	Lor0JDtwwOn0S3bH+7XXALrKnpGfVaZgAQOKFSqJ/ToSwsTr12+8qIKRGTpRBSijOQ8LuCBa1H7
	MG9RXqPrQpapGHGHfX8Srk+5c4=
X-Received: by 2002:a05:6000:1acb:b0:47f:4893:d17f with SMTP id ffacd0b85a97d-47f4fcd5c16mr5321708f8f.22.1784154262632;
        Wed, 15 Jul 2026 15:24:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e036sm22337783f8f.5.2026.07.15.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:24:22 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/7] memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
Date: Wed, 15 Jul 2026 23:24:11 +0100
Message-ID: <20260715222417.2997712-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


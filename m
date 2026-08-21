Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F2495045
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320643; cv=none; b=lpOUgIyOP7Ut+jA0VklydQZEKQh/LRfGMAusjdNZz1JqPwWsOPA00ADfbGb5GiScbV1AQQuNdpvPqZxX2eIK03l9KlK3iyuIUsq1BrWSPrsTPmGky4QZQVQp3h9Y8uKg1kqzkBhLzYi5gff0aLctdq4HgeHQKahlbc5qYpnabdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320643; c=relaxed/simple;
	bh=uGPIzdxc4KXBsjdGJiahS3bTCttkeJU0jZQMXBJYgIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiRtEPV7P5e2jL3xN7JNs51Ozagi8Lu3ZnSNJc36g7YQqMXXFKXpHsqtmzlmL5zoU+yCBpBaaRVvtU6MlfWfeiNhr98cyWEMFUhOikpS+C+HkZ6ZXtYlNmeuYW8DxGYoJyGEW79KVhgbYctTqfDidoUHhWUc84N/XSoEa2/mZjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV9bhoit; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV9bhoit"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d5335cf904so7587135ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320641; x=1787925441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsGnVgZXLIDkEiMG9qEO5rplY3MpoMwwrWWVu2HHkug=;
        b=MV9bhoitF3aUd4fbGnqC/4IX6MoVOL1j0lbyv6jJcAEgmMMzZzOTO4RcMjqAYd1rTY
         qts5lgm9IOGvg6JEiaELZpneB98ZPtuL00e1+98tCuRBOFx4f0X4eI1ihba6rE7s03nf
         0HX/i1Br4CPlv1dL8B2NqE3/elgW8ZoGtC5r98++oezQaub3OUzKjSBxuky0z2b/fU6Q
         ITIblVI7InG2BGDGZz8QYviUaGDDOD5oAgMMe6N7rg5kcARuPwp3yeEWgG4i5e++zUrr
         hKBU7AZdXPkYUfGxT7YUvVkXWWtr4He9MGBoiMfrj9WsDd0YEjsX58rudVTm12Gz5EY4
         A7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320641; x=1787925441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsGnVgZXLIDkEiMG9qEO5rplY3MpoMwwrWWVu2HHkug=;
        b=ogb6zqR7X+V1LMmhDMriRTllMQ5jIgR6/pkTcsVry8NkDdiDSC64zyJ0ijIKoGdYbe
         NzPn5h0bO33wvpCE4mPR+YHbog2DcKHXUfp7z4HWHziSm65FAvQhkLe0CBbDySWw6LH0
         iBRdllqMU3a4KNEvxNj+5vXnmYeHotlDRlnyK7dgLb+Q/xmjLWzRe9YMqm15URYn9I4Q
         AbqCEaQK7QyuHCtyUXDKyCoVL1GCIRigaAYHaru4joIMapY4STDmB+nC6KcDoDCVgF+9
         nKtpj5Bn3h6KGTRUHxgUY+Hss6H1N/x328kk7TRLWCvahrmrBYLoGHDaeQXVj/rVfl4V
         s2EA==
X-Forwarded-Encrypted: i=1; AHgh+RpX9nnJQyqxVK1r/lXDh7hKB0ynuQxyPSd3jCgJmUxDgqmT30DMVrYlyj9uVK/8DJ0vsQFUYsHbYMs1jny/CBYX4g==@vger.kernel.org
X-Gm-Message-State: AFuF++kcslgAyqmJ4fUQU6TcGydt5U16RMlg4lxUPQwjIpSQDjlRYS3l
	geESPpkVKc0yd3ohKvOk+6PS1Llw4v9Ag6/mLYl87D+mKWHymgXCZ7fw
X-Gm-Gg: AR+sD116zEK934n4uxxp0S7RXFYL4yVYqhj1yby8u8u2jAJe2qzHAqsYNzVqtMKXIND
	bLHoOntNNgR6DF6tMTY7myq8U3e0ehJJIDugyK16m08FLDrdwvXwEzFMNfjkH8bfa62b3lWWQbL
	TGHGA/PxI7fVNZkUoz6VZ7x/mowfUPEB3xpc05oFuv1VB3aczl0kztVdWnCkfYdLuaRVaxw8661
	IslWx0wV1uUxpHJ7mtKHNdP9DYM8byM5Tc/bV0QIxVbjo0ih3VJj3iYDHAywy05qqErS4d/foZ3
	AAJ1/4l0x2RtJuIc+euQHLDwPGcSePdD3CUkfHnQo206F0vkoSuVacSCPz4z9y/1ECXEdEOmV98
	4DMEpqG8iGax7i5SwTdEvuychZfc/eAt6YWdKJbtN3T/KwfapPW+oXtbYRhP4tFSER+VkpiA/5w
	xpueqXGdbiftJlw+uUc4hCjbwIxvbnotjvT+LhfkvPqpaoK1oSyowxs3Nclu8mfIbjyk1xhQOrf
	V7/AuwT+Lf5xjvVYsdF+Yvp7XG2sqNyjv4IpD46XyHG11foHwjd6ZPkThUwrx0hu3uqdTpLBTzp
	D4L2DNlI+A==
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr140267145ad.14.1787320641223;
        Fri, 21 Aug 2026 06:57:21 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 08/17] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Fri, 21 Aug 2026 14:55:59 +0100
Message-ID: <20260821135608.275233-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.43.0


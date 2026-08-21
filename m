Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8C494803
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320603; cv=none; b=VcKQ3VxlXv9Tj1/8i8Bzd8y3vGZfAc15EM6N+POC2zXdB3M1ARn5IeVL0/dAQp1uAxyjm4MSlyHh9jmed4OXAiQWmt5/iR3BgbkEPCBTWDTIBdguw4ZaWgFJjKpYJs3wQnm5FiJlWGjqyylRazwYYb/0jfYRQKJY9axPgd45XUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320603; c=relaxed/simple;
	bh=uLWrx8VP0XvMS4lZzOPKXcGwF34UPrlN0NDYQcb++Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plyNeaVi452o0wvXgWqDdQYR4yzdVPBpx1acUdOfgqKIhTEnCZFlxClbiQcFgay5Bpzldrf9+QPvZqUUvOi1Y9KT041RsnQacL1biapZF1zKCW3xV5suiIb7NRYquWgSWHXFXGxjYbe+vDK5Swle2BIlKO5JyUPQiXEXzWK7+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+LLsdd+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+LLsdd+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3900e39d935so922796a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320602; x=1787925402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4uKJIgLF3adY62zLAWtHXEgyUnOp/s/pf5/chMDvJU=;
        b=M+LLsdd+5WcNN2CF9wFBWTm/GoK3oATdYy88DYbuELkZKTnLYEjEbcCcfl0XbET29h
         1HjX5vmKyGKYcbyWZHFiwOqJtX5yCFQFNGZxK8IdNRoUt0JK7dS6AC2kWUaPzTeC1pGf
         e4RQ1xXhTN78uXrAvW/9WXRhlbIB8nQafUwRZ9DDsXjZa054TPQ1pLoUHLOeAZrLGZDg
         VBGLgXAE5oxyWi3jfaIYXVap6jI/e8gFe+TC8nA8Bp5a0oi5G378F1B11Tgou1qBIlw4
         AUFqOaJ9yF8iPpcZgciMcCJPiN63Q3VplkKVnZEk2hi1Cv5y0gmcEekJv1HBOFupOt4W
         V7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320602; x=1787925402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4uKJIgLF3adY62zLAWtHXEgyUnOp/s/pf5/chMDvJU=;
        b=OeiWaLtuW3O2QsLYKO3McdXmBnBvxoD9jaXpCd3SPvJcqbZF5Jz5QXOmlhu+WG/dpd
         c7X28ShJtyd5/qqLHpWp9f/k4yOUYYzZJbZBgAJpy7IOvEp6PPkuuYmWiQY/yygyDa9S
         pf6x9oBJEUyh5Fsbslo8adBaOYM4Iz/KDtEQ1XjQcBlceIzaD2GxAOjNnfivk4+dng91
         B5qWtbWB1sh7+6lFCpzyYRh/KfpICsrzx49vXsqQdjZuPQI4LjLPWsvIO6SGNPbJjC+q
         EF5QcIGbWarWfT8nCtZ6tW0j8xwCVJ8fvlDrIjE7wMeC97vm+hnhRBR1AwzdD8qiqqR/
         unVA==
X-Forwarded-Encrypted: i=1; AHgh+RpFXmeFEgMvKTxrkMmsaP/G/EhVWz72CApG/MoKvkpmdbdIb2ECR7q3jQyWdBSsMGz9JTZ1yRx2GPFzH3FdpV+gRA==@vger.kernel.org
X-Gm-Message-State: AFuF++lLSY7T0GbEqyeXWh8+7YSqm1Z1btkal4CzVe7xKFiczgGGb3rT
	2I7TW+/RHqE6xiEd/yYPY+fsA9vPQyvUxqA1JXKXRMcKGiDkJr3kHFQq
X-Gm-Gg: AR+sD13ZuajBM7tYJHsayLSNP/AFjaNTKJZUopI3IfiS/e8Unq/0XZ02gT0WV2XXRDS
	WP4WrLabHSiz/9rncbP4LNRN52Gc0+5/d33Q+ZwFFdncERsjljamb6I6q+8+Hr6+SRtHBJ/u4F/
	PYgcEPpWg8Qjks9DaninaD/iKn4UfeXsLgN9P2yEaBigZDKOPeHeoWoz9Uyvpz/s0QzRs6ltlgg
	XHwld3Wql7rtLCh5/53sm313JMEwKIuhLpbPAlo15NLInZWCYMo+pVifQtJzL0ivoOHs/FKuWWM
	nlbV8g5Gh6xgnu733j5DUJWYd/2cFEnlmg/6/mTFw9pz0GlAWdOJ8dQu83E/k6RODOWu65jWn1W
	uUYggP/iNwd5wiZc5H8ggpsvx86ZFwLslfuXIsOvAdP4ErUffo8wLwtsnluUutKhmAk/KOiDW9q
	zx+kBTLsfVklTuqJbyES+kzQzxZ1oE0m2Pe6OoTfdb+CwykZim7UG7ppuum39cmE+HTLIojOq52
	oJwkZ6UDXAdPOCuzW2CwcvJMti7CnmwO6JtO4gIVF1tVW2G2gzZTec165dnEVHH/zskemftcD+z
	aF3Dhxa9IaWbizz19otHGQ==
X-Received: by 2002:a17:90b:4c0a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-395c351386amr11634937a91.5.1787320601681;
        Fri, 21 Aug 2026 06:56:41 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:41 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 02/17] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Fri, 21 Aug 2026 14:55:53 +0100
Message-ID: <20260821135608.275233-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 305f10a8a85b..aa27ad7f5941 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -464,6 +464,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.43.0


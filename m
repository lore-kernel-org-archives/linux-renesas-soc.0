Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105384078EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166819; cv=none; b=YFdhCewis308zHUB6fbVAiMswGL691CciwXyAYva0Qg19ExZQqsxe4h2NJLqsJT28GQp3XkeQSdE95Svs6zIGNMRae3yjq0S2fZALO2cPGg4uIad7rI99IYH2tDy7Z3+PGgxXusc5tw4amOHLWr6XP16wF13+DZXTRdRC8vgB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166819; c=relaxed/simple;
	bh=WMyaiOHUFZEZCn5qisOFuuzbLFiZLVkNmCK7OaYn3L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrR41WKNdh9cKy6pyYcYZHKOGuuvXeCt9MyOYNZgXVeLnGkEIkQ5UKjRl7nF6eLK+TY467aTy6X2o+AObaG1EwQQnzAVAYDDzBwCzsu9Dll9h36giSU1eUiKhcv12dqVfpNWKRW+iMj/7tkan4+w4XgEqVMcMryXSMLXenOJlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQh+SF1O; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQh+SF1O"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482938466a7so1162857f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787166811; x=1787771611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XberlWF3ymsmF4TuhStgiZn4PucKKhdABjviIOXnOZg=;
        b=ZQh+SF1OdwPRCpQZ+6nrSZULsFNpU+iUevftlys6TopA5eCxVVb0WrCdlFenbKTLkC
         5dFNi+W6TqvKYjXM2uokrLzou3WD0W6yuuMBSutl2uF0dFwnlFjCXVnFp6pDYoYshf5j
         pA4Ycrsd949HgSPKFXMeo3aw7oufEYhqGBEQ2s51GtJ3NiqIjT0k0Mrnp9XmvaYgaeWi
         inaxJ/fyWTfWrY+LHVQRy/Q8xAZrgF0cRmvhAFlDIe3VO8sXZloGassnLmx+Bnf1ISLU
         5yep7yxBVj4BMtm3y/buGnMkF4TnfceYkol/d9I7jyqyCh/3IVTKVPS/tUl/GBsQ9Cl9
         oKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787166811; x=1787771611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XberlWF3ymsmF4TuhStgiZn4PucKKhdABjviIOXnOZg=;
        b=DdzjIhWbA7uG6kpFb4jZbcinmtyRQrpM6bDyQyGGU+Q3H5/KLHOVzvMAeU6E7MpgbQ
         hel1C78uS+UkC5ladQ5CZ36S10c3GJgiIGKCMRex3X7FuCxkVUuD3WvEBJbMBKWhLpAC
         USFO4IlwUAvSZLnlQjLImQrPmGhTlX1gcYQpB4IfD1l4gpRAEmJbNOa9pUavwLYYfhPi
         hYGEthsnPjXsCGNzGiIm/MOjkxK6+3BJGjYRMlDshFexFr+va2AkZRj0N8ieUrPmJr66
         V3xJ2ouKlsGvRtZZ+NZ2orfbvPAIxiZY2s/+I5x/w9435EHIW1qu2gsNgUD+g1pFtzVf
         WvMw==
X-Forwarded-Encrypted: i=1; AHgh+Rrl604qZvgsl9oisyTNtTN7gI76lHJH4wASNyx53Fo3yXMlSQ5CNlXOlab0Nn6f1FmLcIo+D6BtWqRGuZ17ueCoow==@vger.kernel.org
X-Gm-Message-State: AFuF++mFWyYJdZhztuXvJtVzDYQWkU4qufnsVU0ZGFZcScwU0hlTxJvW
	Xmb0hV8kbNpYqG3D4djKtRuRZ/vNIytGnKIai10szt7r2u0DnHYYbXQU
X-Gm-Gg: AR+sD10lReWQNRUdSfY/KGH23ypi7P40w4seH0mDZKrxDWCIkcakOPPTNV5VAaVSq2l
	G8jcU2RICZutU2tZ1CeQCrwnd+F4izOis5SU1muMQFZGZ0C0ydrtgaM2lxfdmLJNx9TPHONiMau
	upiABq9fHY0nCWCQwBagqQCp1icTj7PoaC3IVrMFjPOHzEPlmc/dNqOtsHl3JBj7p+SuMGB1fN3
	vP4cSNRDgyH5uYlMGzSk34hMQQMCD20JWVJysOOReuuMu+r01xibC0FoLbwSNtOZe6I1Op0Wfbw
	HcnSE46oLo1FthHT59t0sEPFFe/drq/62NSDcuVMoJUFhBQn5X5M2FLTws8g/8bDhXYbXAtKFVW
	CWsD7JdgIwOuWyw6sQQahx6xPvBWpg7JfF0dp63UnknVWA47R5jCIjW0YisdUIhx/UcphGoB/Z0
	DD752rQ5f7AVNHr4cIxKEhePZ3OsD8oDtBiYBnpZIiRxwZhc01ggwURHIZtloxpttcANnlYg==
X-Received: by 2002:a05:6000:70d:b0:482:552f:ef68 with SMTP id ffacd0b85a97d-482b1ff5862mr13807431f8f.19.1787166811191;
        Wed, 19 Aug 2026 12:13:31 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:c7e0:8c9b:65f0:4aef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c338dsm6153398f8f.25.2026.08.19.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:13:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/4] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Wed, 19 Aug 2026 20:13:21 +0100
Message-ID: <20260819191325.217809-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
References: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
handle the PWRRDY power sequencing, which requires the
pwrseq-renesas-pwrrdy driver to bind to it. Select
POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
whenever RZ/G3L SYSC support is enabled.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected the tag.
v2->v3:
 * Kconfig selects POWER_SEQUENCING as POWER_SEQUENCING_RENESAS_PWRRDY is
   defined inside an if POWER_SEQUENCING block in
   drivers/power/sequencing/Kconfig
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4929ea350cec..987958d494a5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -495,6 +495,8 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB9341D23D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 11:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535420; cv=none; b=SjVmCblmhGLZQ8NLYZCXwM69+UF+/MgSo/OTqu9jlpzniLzb8n/2CaFYvEnEbs1QiEoqfy17G5Tk+0KyzGAgiEnS5RxPGBJT7ABDApM7UZnlW9iYmhRiO3f1fUm8RrG+3GMPctSK9Au/iiSBsMzpfFTFZMuBfu8A+Ar2E0gP7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535420; c=relaxed/simple;
	bh=Bkl99Pal5ibOO8dI/lGeIcH3x7hxcMtQ7M2hNnEDrBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Stayi8OTKtC8BFE/0M7Wrz4pgAcjWLpqv4jD8ToA/zK5CRoXB795b5THhGpdCkbd4MtmjXeXND6mcXwJTYJ8YvVsqkDZZuaaRl1tOoSf7QYIkOkcuOiGgJ4v+p3MvalfXBflJGvPU1bOvwr8xtGsMGGnaiPpDp1KrWIV206hLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVCoQ095; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVCoQ095"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-496b7622a83so6054675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786535417; x=1787140217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdktkKuZclSrEU0L4DOkjob0X0ZTquWYHTfAfXLf4zs=;
        b=bVCoQ095JjAI/9qNyDcBZIZehb1vNNqDTOe3QZ2CXo7dTXFcTbZrqoWKAfKyb5kjh+
         Dhl6aWf9N/kceXlx6BZ5sGy4A7TmRPkHPG+rRgiOcihlLXcT1q90TqrLGH87PeBPh1S9
         8gfp+iwdSZrdd+k63/7ff7C3Vzw4vUqemC3qhy1sR9Npsq2RDVs10hC1sKHTZWnkQqBP
         EVqIlu2wrKIGOxIvSYxyxELodckLomDgbRQDFX9ae0xAI0vmAAEpec3bIhXU3YxuNjrS
         py5iT4u4803JR0nUWKjlupQG0NNubVxtlbD9FjMT1afARfxHU9RdnVdXsmOGgdDqgbYg
         uLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535417; x=1787140217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdktkKuZclSrEU0L4DOkjob0X0ZTquWYHTfAfXLf4zs=;
        b=e0u+Qo555XnvJnLODjkgJ2zup20PVJatJPZbhz69i8X1JSRb6LDA1ZTNXwm6c/iJI0
         rRSug9sOmhGTbTF91QCuLbqv3frgwUBevQs+FnNMHImFhCt9bg9qY5KVeCkFI78CG9li
         fn2t9BMOOTwuPGtfFETDHZedxxDEnRVX6cPWW8g686MiazKy9fVIMBfw7fct+bx1hQ2X
         4eJtA8kSAfh+7IqZUVHmdvTJJStLPpa+k8GgSu/x7yMIw6BfC8QbfpglaoVbTHY7/DoX
         kWKJoWfuFl7i+/1QOCTt3eHWl0ZaQ+WP343h8P7ykQnYO00bq3sSYDOGFjakyCsgM8kc
         wxKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvVAwmcXeSKdZWb6iy7jZFc3RN8SV17FtaJ3Y/xsFGeYiDPya8Roo15AE3EAiy1pIqv2ObPUi0plWrGa6omzq2Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1STbH/bcQxhhEfKuSZKYEe2fAVOKnt8Q45a9EHp5UfpC66Qgf
	BSqDwjTRXLroTRRUsSwVhsQ1dFUO/pRyAO2YcH6XFQCMQeP0ZQVeAKwB
X-Gm-Gg: AR+sD12ZdCMCBH6dSoa0CocVo4nKGlYGG7Z5M2OxKngaBCJFQOvhOGOqySyfpz2WfIJ
	BMRN2NrQmBmIigpjTdPcBmgXbWRhUbcWrWnEtwGKSaiNZweYOn9q4THFBm+23dAVPaN94o5O/M4
	wTlotNsI54PimqLRbwQYDsEjEPQ6hM/VIvrZTYBd65W47l3dKYPyf7rrJ5pSo9if48KZlkNCMqi
	JQB+RgYcuDtI+qy4iVF9RRUb0jyAG/FKMPo8uOnSE1hAuDLhxZ8Mi+AHjPSxwjr8fMku6LYFsCm
	Z0rqANueX7FseH5ZGbRjtnlm9QuUd5i4TMtznlj6jfn2hVTeJC93rVY6WZj/4hvyhKQycWg3l9K
	1Jhzlx1TbGvV0xzRbS/Xgi5BL5Tuhes9CvLY7L99x4c2fcc9m0zLwXQJt0ltb5K2jGFOzbDT+K5
	4Ju8wr9C5bosFZKY/n8rcjhTDgU69UOGcz7RJwmULCy170s12IJ8rW4Q4XxFwFzSxNyNRjh0gmf
	IMt7J/X9FTDqQ==
X-Received: by 2002:a7b:c3d5:0:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-4997c1079a3mr36724545e9.13.1786535416491;
        Wed, 12 Aug 2026 04:50:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815231c308sm6219090f8f.11.2026.08.12.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:50:16 -0700 (PDT)
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
Subject: [PATCH v3 3/3] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Wed, 12 Aug 2026 12:50:05 +0100
Message-ID: <20260812115010.108322-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index ab1c25fc2656..bf242141ef6e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -494,6 +494,8 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57D5013BC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376604; cv=none; b=Bxu+uOA+E30Fl7wtW8C1AN16+G960wryu0E0OkE8WFjL4qX2O0h5bOE7wxN0T1PK78a3RClwnHSgqhzPm/93d88GLT4XcdA1ZJ1EH88AKbT2ZvTPyE7pFFXQOWI0lYHOM+ecDvxkAae3oMOo18AyZGSvgjIkApRG+/z+cKL1iPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376604; c=relaxed/simple;
	bh=wZL92ga+oBf0yLGmXmHDNy7Ob78EaoiXMloI0hnmArk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2ObugELYH01egwxTWIv9XIcMJ5hleY95YfuqWZmT2ds+b4FjBg6/7od0gsANJ3Ow0siU5FwgdTZ6Jhw82GWZWkJiQ4uPqaaVFkDe/byvYVEV0WLkkqPWg4C8uy9LLF4l9ezTcDytHhZ6LvmzhOKUcIySxzXIUlqruansH+GcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYjSRJvh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYjSRJvh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so199845e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790376601; x=1790981401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOKPsClwaHbDld3hOUz+HmigKJvjjQBZ7IwdPyo7ZHY=;
        b=dYjSRJvh6dfd3Da9A7/OhhTAFZIY8U2apbvZoPhp6u3GYLiR7kaQ5uEY6T8BjsBbbM
         yKCBH+WQ6pNYSQBMb/fBN6VYe/krMr0VttYZphMjny166IuT7p9hgpgnFbZSUxX1AFjO
         jDsMwn3zLnDl4zG9o35/87aTUgz0ZANQYvKg/wPKo4fs/70HsaUpAfN6jS4AoC8vl7+h
         oJXp+aSOnvshDx6363aTfJUbZHI7+x7TbOwSKnSD91uf6gIWmPQ3zmkeJb5IWejCfmd6
         Opc3q18nXHOZgWBU+We66eoWTuVHhjWA1pcAz+fRHr3xqpiluXKd9eG0PQt8XKPHrIot
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376601; x=1790981401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOKPsClwaHbDld3hOUz+HmigKJvjjQBZ7IwdPyo7ZHY=;
        b=QO3XKNKfumlGWsK9BhJVOtvYyQocnRsB+AeLEQ3dNBDFPg/PZC8mUcxoc6+I6ERNIs
         w2ksquE6xzvQxYzRvH9w0zHs2s5JYs82JNOS41ktpBRYS2f4+8/56o2OTcJlIgmRlpkX
         26CmHu0uddgiiVr6FtXYE4wkQ4Ahwezy3lQ42QhF1zVo7VmBFTE+QN/6vvG2eLNH9+iR
         +pd9R0T4Z21fUXwbWdqjwkjJQUvqfl4UP2HJKzNf59PC4NjZd4ZJLA5B/VE8EQAuFW3t
         Ig+1e/OVQGIJJwsXUiRHNA4DzaSXy/Pz8EITkuyu7XxVV2l33CDdoATrO9Ig392a1uLG
         Ydig==
X-Gm-Message-State: AFuF++l07LIKgZ1hjJcnDpFmqIkySYMCAps0QSen/SVUcJqF/6wPHAZD
	tNyRkUEmF96CdibdsCeD1TydbJGiAV8p9W6/7VzdhCyT1tkDbHRN94UX
X-Gm-Gg: AYBFou1HrJJPE9Y55XdVFuXugeXAzfWAVDBtP5bm39Lm/VpkNiT7D9WukfvVD4Zspeh
	akjsztuqjwTfUAPbNoeoiPFgfhdeJsDZpKH9yXQvVg3PvMYGY7VHAy0ZZEsZhk7OD0+CaLVxAye
	vLIWoHfEBfhA8HeH6i7Miat71WjgREYc1SdlKC+JZrsb+VIlTaxd3/5CSwkE0tO7wai4Enned+l
	6Tpe4ptmRXpEeZ+GPN+sPgDupz7cq8j21LDglnJCStIGsb2bwQNANwa/2CyE0YTJgLBuJ6gihg2
	uAyM7QM6I1JEitOi7UMY9BzUCGaGzK3mYO6/Kr3sfeySPv1o1TBlTxOjpRD7e7vgngNCnbowxp0
	/gMeKeThWc2b8tcRFkhUta+31VBjxjoV3FbkAzwNZuOCJsmdF48mN2YqAqg8banYjkXogzFpXU4
	4wS3ZbXSp1DrsAiRh0aIWQYDlYB2T+lkq6afNyqqwEeC77jZaJ/p2a6Eo9o0wSRaK4kxiFMX8zj
	35p+beDLnXmaE1ATmM1gnLKgqHIsWzdMoTS/COBoZAsPU7Txy8Hb3nKZ1NqRwTW4WiFPexoYW48
	hm6vQDQx
X-Received: by 2002:a05:6000:4912:b0:488:8020:2454 with SMTP id ffacd0b85a97d-4888020286fmr6561405f8f.34.1790376601210;
        Fri, 25 Sep 2026 15:50:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8c30:a558:27e2:6b14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm10376145f8f.19.2026.09.25.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:50:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N
Date: Fri, 25 Sep 2026 23:49:27 +0100
Message-ID: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the RZ/V2H ICU driver for RZ/G3E and RZ/V2N, as GPIO and
IRQ interrupts are routed through the ICU block on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 5445fba0879d..a63df28df3b5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -418,6 +418,7 @@ config ARCH_R9A09G011
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for R9A09G047 (RZ/G3E)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
@@ -425,6 +426,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for R9A09G056 (RZ/V2N)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
-- 
2.43.0


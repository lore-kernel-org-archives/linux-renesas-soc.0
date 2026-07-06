Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA6E41735E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360314; cv=none; b=LRLjJLEYPBfX1xt5D65RcDJ+M1QxTQLAFOu4dDT3qWmJXrzVAacd8FguObF5VavVfM3GyW7tD8AoYkbubXf6hkPrYlIryOxQKsr6/dms4BkcJE+SjkjoTyieTkPN32TwpRDii3oQVaAtut5mJhrdLIoPoWckBpYwk0Y6ON6Z0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360314; c=relaxed/simple;
	bh=Us3nB+m00XhH8cWc7W1acfoiO0j9gY5xSZ6vdTG1GQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKNWxMolv1ToL1ClC1+MrAUs30w661tKO+AoL++vwT7i4eiIR0qQdd650tgG/2gra7/TwrXur8zETuioOC1TirtHHXP2S7DfGZyTXO5WgvioIqYCqmLc6UXMHJ/7EkoastefuzCVYbxm8JDk4NGn9+Zj16xBtv/SeyA8+voVCVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+MxKqQh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+MxKqQh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so11283115e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360311; x=1783965111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaY/L/tqsPL4V6P297f/6o8QOFru2yz0N5j7fKHXKvk=;
        b=I+MxKqQheJ4YDq7qYDn0lSFj4NVCrK266qNF3l1WY0+V82UM+eMolsDcIhPyxIWvbQ
         pS8Eq+pgUoSXQYhFPsY2DNprVTbAcxDgNK/Jl4TZbc6xMOof7YDRUo/AweITvu2GpQtm
         pQe4CA24EchieXVtO2baZmoH4suPcbUeZlDONWYrWxX7CztVTuiABxOVaHiOwLu+984w
         NYNJrPHcmEVW5sg5VGQaHe92dW4b/sRQr/WUoTHzJFpkY1QclBuetXSLdlm9WCodqWj0
         7dWj6ekWcai3UBmeEIJMESYpKC931H+wlb4kX0O8sb6/9RKihoEu3omDkilw6QfFrMIb
         tiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360311; x=1783965111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaY/L/tqsPL4V6P297f/6o8QOFru2yz0N5j7fKHXKvk=;
        b=OVVIbzXPWwm45/V8Y6ra+CQnjJoiP/Bw1uGOl86VHivRliaWd7quCAxLnHMGhvVqrL
         R87U5N1gK7rVgVs+WiOi64XfwQWhcO376I+RqbS7O6Wj9ukhDzI4cr/yWOZConm3WSYl
         HCEedPhrkHf7sAbQX3LqGpmtVao/IA8CKJFeJ1zyE+2fDrEu9wQltafCj3ctBQ6BMVzw
         HjfbNIOHqJZ58vNV3e7RAUAi/IlSyqBur482DtCxNnzO2gDQAF5JZL9OQNawHdSUw+zA
         irCvAIFPrpuuTkzhz/GTJ8pvU8qkg/6TeeA2xHf7XoBULJvm3OKkUyp6XnW0hrbphuPz
         jIRg==
X-Forwarded-Encrypted: i=1; AHgh+RqF2rhyqy4ZTiRpiZMfbv4TakuMwciQ37b9+G1Jbg8hXnLnORvIubp0N0tMm1RuMFKLaoGAhom++cRS3/nE/vOeEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziykGJ1lLq1W1X4Ru+TGcClWIkK4ZcyMMq7cFO7W59SJUuB/aG
	gukpskWYLVGzTHBc3IeaSuh/P3od1CX3v6ds7dH1tzv5Cwi5YTNUJgyr
X-Gm-Gg: AfdE7ck34lr+suoZlPXvon7MjgRuFuHjKPWwpOyTpmBjbWCbtk7WeLQY083EG8eRnkp
	+7jhTG87YYa+AybkbB+mGzBlbggGr5/cAVlUkKMBDxTQcYBMuQIgLeI9eRm8ti63/qPluW4jzUp
	Jp0FC62RoOPoCcWVKHsZ/W9UItliFShfqV0nj3M05gEU7fc+B8CBp1TWMY7BhdpP2hsT1KD+unB
	dWOo28mRpn2HdIgws26GrUQvHkiD2Y6Nw5PIJ/svM/FYB/xiqdA94y8/ODo09NSv2JT3EPL/Les
	zVlmRTyWzPYyY50okVQcbRzYYGHD2JGHHUKn/IcmlvafdORQkDR+f03+J/q6LTphJLlHjyfVbuO
	kt5+7QL0dmjE4BiFCqkFyL/6qAlqmtJhPUT70p5fPu3qDKqizIeo/IQWQZxavfvt8RfgAMRT6jq
	YvVIMZTfeKdTe/Q+tpaSJK0JHHXfTxal28uCasJVcAnJE8xgJex/0vDiqwIAQP6NcAgRLNFTEJY
	hXusDFZEqDEhaRmkWL/pR7fTFATPNICZyIS4Q==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493df04a9ddmr18480595e9.13.1783360311257;
        Mon, 06 Jul 2026 10:51:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Subject: [PATCH v3 05/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Mon,  6 Jul 2026 18:51:31 +0100
Message-ID: <20260706175138.12587-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
2.54.0


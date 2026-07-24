Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09F3EE1C0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883870; cv=none; b=DXDVXb5LZmmlqps8CR44toi8hhfqIOKDdrpRIDiK2wpD7VXYOjTR/FzIjLHbmsYFGU6PYpgb8Yyuz8pSTjY0OR/SqbJMnssBhuHmcc9ppkfCAE81LDvXEeU0Lnp8GBjZpwGH9uYeSgW93G1Nuyl2Kgvt5yIiWArdSSBIdH+phqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883870; c=relaxed/simple;
	bh=qi2V6YqGjc3ox5XSg9D+PgsVQmlPliMSkFPKWxRHUHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4tFcwYp8c4nIt5hF1uORY3rZyBOvUOZQkIO5flb/OupppqI6WZyjJt/1TLbKksPReeHXSHNtKy0wULAXSOgM/jfti2rwmHpm5v4UCIFLG6TssyolldF1EFvRdwyA6+OGOcvype24pxCcDutnzfxaFBJtBR3Gfz9JvHsP3eorpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TgZisXPe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TgZisXPe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1763775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883866; x=1785488666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=TgZisXPed4rf4NaTDmrIv0D/YcRccuclKTPYKRiObeZZDz/DnWPz8+AWW4gKZR+Y+j
         niS3eBKV8x8Xz8JXpQQqlmmo4+NnE168XLCGRcrTMqcocxg8fXR6W5C1YUp7anWjVZg5
         vstue14Th6IquO5d0gdntuwrJyvW/QHfYoKgE/y8GY7nQeVapOJZ6FNVOyEBHRa9c96z
         QLP81qhGtx1EUcLODxVkj20vYF1eBnfzOy/lkhcOTG7Fpey3SYFn2iTI1yJuWMGhOpLu
         NXaSiUqFPTPktBMDU2HSJe6/RxEpRc1/vNLhvtkrs/4rbtxMw8oc9DqzybPsGfOaV390
         hkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883866; x=1785488666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=cwhB/bzQ8l5QWrXaaTlUxiwsP7ONjV6B87iYvuCd+9eADMe4QjTtanpEwWJHMBUzjs
         k6Z6xoRk1hxf/ZpRFGoVT0jQ2b9qrU/tDdWg9NNPGWOmg/aHwC0hh8RMJon1U1Uc8exw
         8g1ZMBK7WQ2nR1JgHPHUWlCry1zXCmjnT6CSqAq7II+xIizf/7S0Kmtmk9o0DYdV/vcl
         uplQMAwvOH75OiFNvafQfEE9wUEu+9A39YoNCLkrv2fFT61LoPpCRQQvxntw3lxKfWNz
         T2+3bcs0rj+s8v3923eSJydDl62DezXQ9eo/TJVvWDUnderHiVqXPEmLl6FHr4pB68Wo
         1D2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Ja28pXwbytEC5fvNcRCom6ZEpexFt2FpWOHeo9CxNU4tRgo6xs8qDHUIpUYPgyiWs+GpglduCaK0aKR6MUPjyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAwtpBslrml8qpYnKsaq1nyst7eOCyqRJNZaJtffTH1dpl1OJ
	fXcux0SQAfd4YxnUWSD0N0PNQsEC0kCjRYcbJg+agCgtey2S8qkAoo1w34OxEKifEQk=
X-Gm-Gg: AR+sD11mENgL/mVla98UFUl+jMk1TowZdIZWhDNdQ2ykz7842vsSgo6t+OQ1TaMUcJo
	yDzcFG+vXxQ7CcuqEMoMm2oa8tZFSw9yqXIux78dSg0hTwbvkNcuXM0yjBUxTQ0FPTMk0sZ7rGY
	9KqpIYMeY1CixyWPzqVhjjDnKRcoz+ogQchX7LVc1qXfCAm2UWJFh2VfHDqlLLabykHaSOMP518
	53ZXuUkuIO2yv3wSZmeXubuyiRFDy3tXs1JWvs3S6joZbfSnH45ROwYAgSfLM5svZJ0f4KpQPz/
	h+pRtFptxrtFpu8TD2U4JfiLePnYhKZn3HeyivKD1O+9/MuisuhDtuWweAoJp5IDwMG4anfDSWl
	6zUwCeFdxfPzqNpd+bvK2O/LuVGt1MfESXvXzerFyoQ3zqLnO4b3dP5v1J0RTBln43Xzk//3dCa
	n0
X-Received: by 2002:a05:600c:1990:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-49573cd8927mr70665895e9.20.1784883865686;
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afb4da8sm50979535e9.12.2026.07.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:58 +0200
Subject: [PATCH v2 7/7] clk: ti: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-7-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qi2V6YqGjc3ox5XSg9D+PgsVQmlPliMSkFPKWxRHUHE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqD8X6HJICJaogPLmVW5ml1R75cJutw+gfiJ
 tB0/SaVRoeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgwAKCRDm/A8cN/La
 hZKDD/48CqDz/QRWxvqQiZfXQXrQZ+Wgc2Ef1vVKm04mZiagVtEgtLY8z82Jakzu+XTZ/upstvz
 xSnqrHDzMM2PT/UOqYhUTHR276luuahMFc+5GHs8qgLWSI4K6l1qQpFASzrkFMJ99geCBuSUUkw
 BcC1TcEoLVUZQxMiXPcKB9ZpJkpXEl6c0Iwpdblk7tIihwTXYWc4GLLUzWezJRfgtOuVwc9rVFJ
 8DomqHnipH4Gy56+1W+dWpiNzNXBjL73LXBFhsmlE8aNInLh7EjAGT9bAl8WES5M2ygH2BVuTyH
 BTfCvbPSIB+Janl3MVM/dTv6F/omRpFnOLIBrQtCTdHYGjTkRMJipWghoIvNYAY1fHORlsuyltp
 Ag04g+L7BFDYrlqh90BKDEWELW/DVl1FlzaMR6MAzFyiJ7Ubm2vaUgk4mYL+JnLMB93sH0TVJ7G
 ircePpHwwcUwnjE3cefSvi4pCtmxVrbb3cqGlmjG7fmg5Up2aRTnHHdbzXvpwYFSlYnhHNXfweJ
 0+ya2NqXjGjy8tEODN4dubBw7zAnxm0i+5ovlTpEJaiHLqYet0Inqc63sWoAstKpXL2pHo/9ZUS
 h9pjOdE/2Paxlah/zqAGJZBfh0+/EtVSCbHz/ikGAMSEEjMMkd7RbIiWpBjguLYslB7AnsJ5WiB
 BEqFaw6yMp0mO9Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/ti/clockdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index c897ad7e681e..aedbe78bf1e4 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -104,7 +104,7 @@ int omap2_init_clk_clkdm(struct clk_hw *hw)
 	if (!clk->clkdm_name)
 		return 0;
 
-	clk_name = __clk_get_name(hw->clk);
+	clk_name = clk_hw_get_name(hw);
 
 	clkdm = ti_clk_ll_ops->clkdm_lookup(clk->clkdm_name);
 	if (clkdm) {

-- 
2.47.3


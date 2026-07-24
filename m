Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169D3EDADC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883865; cv=none; b=AujEzIVJcBjDcQgJ2aUhcUVz7UEIpxRMF0Q53gW4P4wRllLqwpuBmiGfd+IUzxz1pEjFuL8ZgOgdChU1X/Fd//kC/xFgBb4DWtqrWscP914AAdmu6yV3JwdUjrtt9ip/bJ9+zt5KV+s1+ZMz8jPn65pJT1Py4vLvBLk1ofJ7B0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883865; c=relaxed/simple;
	bh=i4qllS4+L+pREPH0T4wiXzxc5q4nTV6C2Q3lI6XF9y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LL3qPhVOwNp8F0MTwYjF2/6MZ0Io4+g0jZfwzJIt2uuLYZwr12oEeMR1z+7Hnlmfxr8rtx63FlCJ6k8XbPw8MeOiATPQhWiaPs9wm5lgQpOAV6J70++Kjhxkw3o7JG77rLtZUNdkUbVQy9ywYmfX3ai3wDr5mh2jmiSK7knnle8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=diWoVkd9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="diWoVkd9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955de8797cso1518985e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883861; x=1785488661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=diWoVkd93LTrsU+yv7O8X4RZGMpZMfEdJ5tLuHx1wH1Rv3G+3xsBUTwqUbrx6MwxtH
         kCJAGghVbfVL4DoWdN7lBgPiyd5CeyDuvIjr+HZwi1m39sEuHL3W/jmJ0K/LArE+jSvf
         DLuWq9pOYUFAQ6o4tLmctaVg8nkWHSUlLHJlYn5FwrBgHz5oDbD3lP1aYFJHVkFFQ0u3
         XaXg8cpvuXg1E+CoeDQiwP7GcBym/n6tSxcAoQpxm4ZctUEyNtQ0Nn3IEUcPt0iSwDY/
         715SxobVsX6Vr53f6lj563sZG6gILIeeiQd/pea8FQwjBbJP8ISNgfAcv58bwrNtn7No
         8VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883861; x=1785488661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=LhM+JB1xVmrI4PIjoY5H/FcVuI7C5T5yqBbf9H1JnKiCYPaX/fQ/NZYgFfuKHS2SJx
         tqzMpaEUMBq2iX+3K2zSNY3hYnCpIHu20s22oIMuSCpmtJVuAOlU5xF1mR1EcW8m4BMn
         mwsweDFh9Z3ejwTyFcGxfm8hYl6Z4tsx3CYjKd5cEnDMfBLuFkZsOd4po//dhkllIBZp
         LcJ8sltlCqj0NCAeohYZAHAqHBDWFIXnPRUZdzOynLEQExk4TRqYgDQ/qG+RDI4rte3s
         mXl8TmA7X4V/CR8k4Wey8nnf+LHRSzOsTbDa/0cVyIOZ2YjyofkSbv4qfnc92QaWazYS
         vHRA==
X-Forwarded-Encrypted: i=1; AHgh+RqY99R/DSJckmNOVh//YITgzX9Ro2rRa9kDx1reF3vMg9TIV1OQgtDho/VzrI54P+RfbK5dsjdlsakBp47YC3e79A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpslh6KVP4GqAlAt+SP6tzlznEd4tpQ604bgVQPaz4CjcX3MAt
	NJUqQvRqPW17pJXSi2iPhYKxU62aRU8ufayp+L35+b/Rl18tfqYTEbEppzKXIClmkN0=
X-Gm-Gg: AR+sD10TmP/SkJOVOoMVgz+7d6m3coxTHYW/GPfhfFje18/ElKTq67534VLQNufObLC
	H9NcBcM4mnwsY634JBfIfgSwAHz2dZaZfd4+5ieNbK+qVP7PNQQn2S6aVj6O1Bxg3IR6B/UI87x
	q/30/o3YlhqNKhiCaiP865GvH8cbxqxMBRhtq0uSfqhRNbrpBCZAzOKlIUiENDTkq5BJuQLrcNo
	fA7Gwi0HmnqqSt6YsEBcu/FA/Qs2RTMvbSSl2TMSLBfLTcOiQvsc2aeQT1d5BXCPMxi8spRO9SG
	S++VB9ZQnY1WpQdN+WvXpinyZCUNzLquS1BJOsvCVAP101DGyPdMQsEj6U925BksjA+DXrtEmLg
	r2mmpDSMTcgJOYMI6HVh+hFMeY0kEFkGnqHMj1uefs8hkUAmSK299UqpUPjQMPPrPckmjEiJPZq
	9U
X-Received: by 2002:a05:600c:3508:b0:495:5f00:9497 with SMTP id 5b1f17b1804b1-49573cd9427mr73102445e9.18.1784883856862;
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b10esm57168825e9.5.2026.07.24.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:54 +0200
Subject: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=i4qllS4+L+pREPH0T4wiXzxc5q4nTV6C2Q3lI6XF9y4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqAHjrBMlLbsRDUuljqrEYPOyeyYAPzg/SXk
 jNGwdlpTaaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgAAKCRDm/A8cN/La
 hSkyD/4pUoLziZUxxkpmbPY/qvTAcrEdq7SBbVU6GpskFU5ov07moRfgR+6L+QnROKwYTiacIiV
 j1Id4mbcJS4lTGYyfhQHnpCpE6g4Ty5AOA5LGOh4j4/JBxdHL+gSrPGt14RoF6Yj4XQkhA1UHUu
 PUEYCZKL0dJtmaJtG+j9xQ1n8J5fLTJ4yYwDhVGPC0gFBub2VC55exg1nLw9H/BA9QuYfH/R6jB
 1gRBMy3ki4RKKZlrSF/HE+vSq17ymWXfrS3FSS34wfEJBVX61mFRwB0GHvC4MH3rUyoibQ+VXyT
 fxhDd8LpNOnsg4bjNSbln23x9I7vCg5gIqqxj3bytRpFG6vWz/hwCe241843XOXyP8UZXor57aU
 yCUv+ewWTn7vvtq/y0V8EFxe3K77GZ5obxj3nS1lws92lwHu5LoB7SmbeRYj3c8n2Cw4DJ4BP04
 aDLst1r0KfbFdesTIeiNVRM7Pj3uVdpGPq95OarAzPWMQ84Rw9b01YxXpPr4Qt0BO8crTXNH5bT
 9maeRb1sc1HL6+ksttwt1yZ9bpD0WzEbL1UOkKEbpdhQGM+2M9RzZzmlK0wbO4TnJ12TqHh5iWx
 gOM1ryGczqr/oYKu/yudM5d+TlB4vMwCZUy579E3zBPTZJJ6qG11DkD5DCSjYDdD8Ew2ujwzSo0
 pwxjz05NaJ3Z5Uw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 076f587dfd39..1da25e4fb4d7 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1014,7 +1014,7 @@ r9a06g032_div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	if (clk->index == R9A06G032_DIV_UART ||
 	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
-		req->rate = clk_get_rate(hw->clk);
+		req->rate = clk_hw_get_rate(hw);
 		return 0;
 	}
 	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);

-- 
2.47.3


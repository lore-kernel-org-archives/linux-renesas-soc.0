Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883219;
	b=4+YmM+qANlDFfMepuE/xwvj1KWB6wPrFzK1dMZ9CIP/a37B5ehh8oG9rMG+pxjaQLgHS
	 LMkG2EWPZc5mYHgvTOKe6nQpuuHDx5NsD74KpLaGrICWmtr/PicdvcWkHRuDAeFK0lA2k
	 6NjGIapdPaTI2ZmaRTkr6o6qOpYhRoP/uv0lrSt3GMNnSwYTRtquLyR5T86UBCQP8MX1A
	 U3BYmTzb8SluqSuMqEV1qDQggabtFQYR0BSDC135K1pVMBgfJwrSe4ddGGeT4RSoyElKu
	 lZmMwVa3hVVYQSaHQ4h09BQ3EXzGIIjJoDFCzutRKSetWJd2QJSyFBCb3AzGbjgULtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883219;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ou6GaedSx5cYPgt+3gAmU7AlBSbMHGPOlxdnYPsb0Js=;
	b=WKk1AvOJnIVjZh4DXpNsQ6wNid194eigu0/gizdAWWGbYhJWDfPLLtKmELeZlQBsoWO+
	 2zzRuyPEbTjmqNzzzFRiOSgl4EzhHfZDhPpW6i2CfltOHfoqZu4p3x9Sbt5P62ZOjZQan
	 WMRTO43VCX1ISSBNSdZnjWLpIG3+WUDdrkf12Zoe5yKE7ttAcsYW/xp8/bMW97lB7M1r7
	 xfDcwdPhbhp29u9e5cuyX5zrQAmqadSYxSMFa2yzv3lmxSTq+2/JCudnKO14qabw/3BsN
	 1/JYpfvgiyBlMH9BUBAt3Nr0KrZhHKG6Xwo3L90UlBk4aCBj6ABfHaD1hVgx6a3pGVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6Rlihb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F63606D80B;
	Thu,  5 Nov 2026 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6Rlihb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E40E1F000C1;
	Thu,  5 Nov 2026 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883219;
	bh=ou6GaedSx5cYPgt+3gAmU7AlBSbMHGPOlxdnYPsb0Js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iF6RlihbBNNYgvg19+Qrt1imfU4/+wvjqzV3bNHxRPMfQ80SqgbIsRlGxFLVpP9Ol
	 /J14NwDwroMmBfenfIT/g7K1SrfIb++FeRGWzO0SKDWI8KqG8rFp8ATZu+UyVWYYNL
	 Z7Zte/Xc4tU9YNqjtMDQ4Fj9Ii3fK6RWGa2a3BXvmtjeXV7UMd4Fpz0saAGIf/hsXN
	 IlpmNUMlXG0HqoEahw+aahAdZEpuN2as37CeyI+7R2rpNDLFBl2AINZMyeopl/UqKW
	 wP1aGSL45oI6PY5IDNUGxq8y0rWIQruC5ak5dL3uG0TaWXyL/WyLvpRM88m7MpBbsV
	 p73ZfMo65tW8g==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:19 +0100
Subject: [PATCH v6 6/6] media: mali-c55: Assert the ISP core reset last
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.16.0

Asserting the ISP core reset before the register and AXI interface resets
can leave the RZ/V2H ISP in a state where the first register access after
the next power-on stalls the bus.

Keep the bulk reset API and reorder the reset names so that hresetn and
aresetn are asserted before vresetn. The bulk API asserts resets in array
order and deasserts them in reverse order, so this also releases vresetn,
aresetn and hresetn in that order.

Suggested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 241a625f7284..e37f87e36eab 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -70,10 +70,17 @@ static const char * const mali_c55_clk_names[MALI_C55_NUM_CLKS] = {
 	"hclk",
 };
 
+/*
+ * The reset bulk API asserts the resets in array order and deasserts them in
+ * reverse order. The video core reset (vresetn) must be asserted last, after
+ * the register (hresetn) and AXI (aresetn) interface resets. Otherwise the
+ * ISP can be left in a state where the first register access after the next
+ * power-on stalls the bus.
+ */
 static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] = {
-	"vresetn",
-	"aresetn",
 	"hresetn",
+	"aresetn",
+	"vresetn",
 };
 
 /*

-- 
2.56.0


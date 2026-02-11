Received: from mx-relay128-hz1.antispameurope.com (mx-relay128-hz1.antispameurope.com [94.100.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66D33B6FB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813366; cv=pass; b=XsAEoJ+I2w/Lq31asmPFlzC3a5k8rdoCGRbixzSU2rFUMi4mrMyei7j/tfMHwrmbLOI66pZ3msZF2/WXgPOgh5dOUvYyBbBfZPLdKd8aiReIvvUg07BHtILfmaa72/arHuWKFnKesw67r0lClEO85/IsPaQky0HMewRnAuZ0Ts0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813366; c=relaxed/simple;
	bh=VZKGAiWgFqKvUlRhNiG9TSUoowFI3whqpIuUPg/BfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwPcHqv5MXsbJ3lX9WCqGTYLo23n28o4U5p/liXX2ZTo1ItVj4nWvLzLyRy3HVohOaNSwGud/s0cFaUO34Cc4/Pd3hnCksXQXdpCgINKcHI1cXnRJhLY4bt/xXYddPDuaA5ZZt1pfxk5Vi5eH2yht2TKsr5uDhv+POFPgBC0ZzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UXYR4hB2; arc=pass smtp.client-ip=94.100.132.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UXYR4hB2"
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813312;
 b=DbvMRaPIrO9l0H5KrijzQoxVhlqazULCq0/3tUBYcXgH6FbXQJitqPPcp7YDbMhuaTDSBHi3
 5nWxqZPIFEuNBy2EK3Z2cCipFnIQAQNp6RkkLjjhSsG0jKVJb6yVTRi2jkPGNKENp9sJTSK2EOt
 fnWKDV2G39Y7Xip2PSIhhtYLuAwZ5mqyuKGzr0chgrMTOj0NJ4NKErQfhI22r+By3qOxNOHHWBS
 TWm07LGCuZUunxhxaPwyZFsTmEAGGgK0pO2MDUh12ZqT9oLwripSuX+2xYcDMzD1YR32XXIulDZ
 y0dkW+FUGkD5THeh8b5fxqbo4EoUlZE60wIdw81q8DIDw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813312;
 b=Lg4PsGlqxn8YuY7qn3UuHuJmFUqk+l24HDsczFDlijO/t2IlAAcVimsK8xQbX+bxYrd0S7k3
 Cqe+DmLpv/iIPuazCmyN3wyqx8sBUDm8bR/j+FeZc8oQDWI9JyAirlmSaFcj9LAOQfDLD+iBecO
 N6zRWgDT8QnGdErqutaa8IpyKuwPT3ueQO8rNKLBB7u9x6gNCU7DAGOVCeQ6Isw9CXBkH4v6ZmX
 TVptevqnR+ZtCenObteueHK/JL1guN2ZfOddXKykbOoUh4WH1SC5POY3lLptwEqVfNB+fnZ0slS
 bZVycgq2lLe2mJNkyeK+XhRSRE/1lzI67PbRHgLZBPOSg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:35:12 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6742C5A12DB;
	Wed, 11 Feb 2026 13:34:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Wed, 11 Feb 2026 13:34:28 +0100
Message-ID: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4f9yYc4gf8zvb1m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:127a990275954f2aedbe66286a895387
X-cloud-security:scantime:2.345
DKIM-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813311; v=1;
 b=UXYR4hB20rRz5Yb9E47oUFcBb8I6Wnp+zN591x/x7XnjGaQcN2yHFDw9C67IaDxP6whpbEcS
 Bk47aE4DmjKUG3ymWBx+hCw1H+tIIB5xYbHob5wjNGdU9MTtLXBGMRwATOiGgg3YK2IfRtNhCdO
 37wSvoIr6e3CiAX8a1ZYnqouJ/scs3v1bxbWrCB6e0V+BF1KGfrcRE8kl6ZUORHQmiZABOZEwiT
 RjRCwHumEQoISdPgSCcpv4Zb72TK+yLAummXlgvc27MKtf97BlGBr/7De7hntcHoSkkW76m3hYT
 P+6dXbzyyV3m3dB2/p5pKU5dop7iAFwkNDEDqdoVQKyCw==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* reference usb-xhci.yaml# directly (suggested by Rob)

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


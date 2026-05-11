Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEA3FE372;
	Mon, 11 May 2026 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509979; cv=none; b=Mz1q6rDOiWCwXxxBuHwijihIeQ6siRvwU4vuI6og1QQEiBJYjt4pNny1D9DBpcis9zwdLIGmFO/zLorC4z/C3vwRseehFV+2YYRWNFZyAcjFlvJZc688EA1mqYQ3UXunfXmYY6kfyNyBvOMfZhYZWCat4baTnVEpP0/4TeIu+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509979; c=relaxed/simple;
	bh=Gc1QV4QHGnRLMYxcgyfUg4GUnrd3P27efU/EAKqHBDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQvxZBfbH+eqZBIPTKQjH9BaZ/2YFsDD/3s1yWr3ZK4vRvShHicJqmYYqRIDsIuYyNcsNg+gFP+//zNT9yrFYDs9FsIkx5ogwD9mlyeb16Gu8/d3mgAN4xVeTUV9fgeeMkI+MKOcRkAD+y88qJ3yPAaxdPdKUGNyznCo7w0yRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K2uSfrlm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K2uSfrlm"
Received: from ideasonboard.com (mob-109-113-28-211.net.vodafone.it [109.113.28.211])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CECC9D1;
	Mon, 11 May 2026 16:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778509969;
	bh=Gc1QV4QHGnRLMYxcgyfUg4GUnrd3P27efU/EAKqHBDI=;
	h=From:To:Cc:Subject:Date:From;
	b=K2uSfrlmRAvsRqkRIpB/iCLQYiecn8MAyogo0cJWnfJmoT+h//K8lcU9a7nBHvil6
	 pNqjXfgwvUra0X9LtCjfWUGr506HDunl267w84QM/s5bvYdueMM9xRTTx47uGhUTaQ
	 ftTtZRF98u+PyLnxP/SsZdHE8H3NI4C1+wvxHQ6U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: rzv2h-ivc: Add myself as co-maintainer
Date: Mon, 11 May 2026 16:32:38 +0200
Message-ID: <20260511143239.136253-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as co-maintainer of the RZ/V2H(P) IVC block.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d53481d3f7..f2be8f02dffb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22751,6 +22751,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

 RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
 M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
--
2.53.0


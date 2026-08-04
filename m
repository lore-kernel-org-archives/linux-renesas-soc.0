Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296674457C8;
	Tue,  4 Aug 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839088; cv=none; b=Ui0ERdIbZoz4vBbu62KmtcnD6oqlz2nj4w2EuSWDRT7J3tPQctcO7RQ8fsvpGNp4HWoUhqhbiAb8SOpKnuxT+Po0YUKNKD6EqS/6rskUevmP53/82Dl5oQha/b5iQk8qTdH9EwNyF5TKcDApo74SGoE4awIyZt0cghbTkA7+tUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839088; c=relaxed/simple;
	bh=NS2USlX0OVlziJmItCJOiSYddPkz4UUpDYxLgvv/nqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H++h/jmPsqpZ7N7pxPTt0s5/Ign5WrY4sGLXe2DJHaKABlx8MvACAS3Cyp7dMjZvW7ts6+YQiaDZgzWTxgbZkRLRQM7kUGhzh9VjJpob4bOuzPaRqjvH5iBCNd9KNq0xNndPkxG1iEqHjYCq5bGLd5V3/J7DqnO4M3RQCozPGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b187929a8fee11f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b2a4b822-69cb-4f4a-9b84-0eaecc7a0323,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0a92f36d3e49d91d1588c800351bb2ae,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b187929a8fee11f1aa26b74ffac11d73-20260804
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1067080345; Tue, 04 Aug 2026 18:24:36 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH v2 0/2] media: rcar-isp: Fix ISPCORE resource leaks
Date: Tue,  4 Aug 2026 18:24:29 +0800
Message-Id: <20260804102431.273385-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes resource leaks in the recently added ISPCORE support.

The patch order is swapped compared to v1. The VSPX reference is now
released explicitly rather than through a devm action, and it belongs at
the end of the error chain introduced by the resource cleanup patch, so
that patch comes first.

Changes in v2:
- Swap the patch order so the VSPX cleanup extends the error chain added
  by the first patch.
- Release the VSPX reference explicitly on the probe error paths and in
  the remove path instead of using a devm action (Niklas).
- Drop the Fixes tags because the ISPCORE support has not reached a
  release yet (Jacopo).
- Collect Reviewed-by tags on patch 1.

Linmao Li (2):
  media: rcar-isp: Release ISPCORE resources
  media: rcar-isp: Fix VSPX reference leaks

 .../media/platform/renesas/rcar-isp/core.c    | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)


base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
-- 
2.25.1


Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E4239085;
	Wed,  6 May 2026 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104615; cv=none; b=CCI/bgTm/meGoGdHolvK8v+aAnbY/qrTRpMsT/yzai/R/QduT4J7dHat8w6P6nck6jKoK6X3CZPeqGJd38FutJ+bn5OlLG6/LIacaFepvgyI/vDjiWun5F6tLJjtAHy6YS1fkG3lNFVdOQcYJBqyQCEItCILvsVKW5tGAppBfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104615; c=relaxed/simple;
	bh=dOju7S66TucdVDp7hfs1nDL1RTx9lm3MIyKHwMRkpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RxMsiYe/qDhaRh49ZhJK1469B4kEN/g5ScQs+UAe6OPu79zpfPzNFHZSH5DUX0SkJFLpFU8hEMorVqWewsBKswtVTCdrfzhmWmH0gbJv+1ToQBYt/1VvpT0ZSiLDXp8h2+CQLmmxedVwEpO0tmTXSTrjoIpIDOYltaCWtvWamPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=coxvNldC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="coxvNldC"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB45CDA;
	Wed,  6 May 2026 23:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778104608;
	bh=dOju7S66TucdVDp7hfs1nDL1RTx9lm3MIyKHwMRkpKg=;
	h=From:To:Cc:Subject:Date:From;
	b=coxvNldCfcFFLkWKeg1i9blUx8b/dRHyg1BL9C4hFr1SADluR58PGh/2gnDPTfnTR
	 oluTFQbqvaUK32Xrcozn+nnMViEU/0faAKSVu7KUzb0fmnC/sRNiKkpXbQ608eID+a
	 qFjFY8rYbMH6ruqoOZ43z8bUwGjlJGmWdWrFasAk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/2] media: renesas: vsp1: Fix display pipeline regression
Date: Thu,  7 May 2026 00:56:48 +0300
Message-ID: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Two commits merged in v7.1-rc1 introduced a regression in the display
pipeline. This series revert them to fix the regression.

The commits were meant to fix v4l2-compliance failures. Those failures
have never caused any issue in production use cases, and have never been
reported as issue by anyone. Reverting the commits is therefore the
safer option, to give us more time to address the v4l2-compliance
failures in a better way.

Laurent Pinchart (2):
  Revert "media: renesas: vsp1: Initialize format on all pads"
  Revert "media: renesas: vsp1: brx: Fix format propagation"

 drivers/media/platform/renesas/vsp1/vsp1_brx.c    | 10 ++--------
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)


base-commit: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d
-- 
Regards,

Laurent Pinchart


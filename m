Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910F363098;
	Mon, 11 May 2026 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543818; cv=none; b=HLLjyR87JhAYxiYe/ouj/9AKbUwZy/NIsOR8dYAqUhLYWdqSGdi17O3YiV/1QEPFVu4f99OLdUU1rivqQkDmW6NbjYvTBhSQmg4u3lnOELIJdt0Oqwd651WB6IBGmFdKaajQBYuouosTSBKPbaPEBY6FaPJGXlMecvInKkBqQ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543818; c=relaxed/simple;
	bh=NQToRHIqPx06qUtETyThQlKir++AJDt5NL4TiKH+2wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDm/sy6fvN43nkJfdXTZYfrzyYoPWECCKpLT9diAnjxWlJ8Iht7NZseBWfO0GsS9zXFvbhybJl5SA+rvaszqdpIyGuasuHduv4HhSW+kZVEB3gd50axS/lu1NRVIzJjJT2pAORGlwDEP8q69fnNTJYDSlpEjWBHbZH+eB6uxCco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UmkiP5lu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmkiP5lu"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 287C226A5;
	Tue, 12 May 2026 01:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543806;
	bh=NQToRHIqPx06qUtETyThQlKir++AJDt5NL4TiKH+2wE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UmkiP5luI1e8ir/M979ff50FuJkRQnWeJMrcaMy0EkTHFTSYsO1Q1aOi8WSOD4XKL
	 4vQXnk0R9K86V+C5oYgmyG5FhRo2RAwQWtwXFspOqDbRF2hWdYcjof3/tBDSpFIp9G
	 sz9YKe+vsmE5ZM0IBB/UBa1LjjW06/rgeZliut1Q=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 11/11] media: renesas: vsp1: Drop deprecated vsp1_du_setup_lif() function
Date: Tue, 12 May 2026 02:56:35 +0300
Message-ID: <20260511235637.3468558-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1_du_setup_lif() is deprecated and its last users are gone. Drop
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/vsp1.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index d2085cdb7fcb..98089e0a4385 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -48,15 +48,6 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
 		   const struct vsp1_du_lif_config *cfg);
 int vsp1_du_disable(struct device *dev, unsigned int pipe_index);
 
-static inline int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-				    const struct vsp1_du_lif_config *cfg)
-{
-	if (cfg)
-		return vsp1_du_enable(dev, pipe_index, cfg);
-	else
-		return vsp1_du_disable(dev, pipe_index);
-}
-
 /**
  * struct vsp1_du_atomic_config - VSP atomic configuration parameters
  * @pixelformat: plane pixel format (V4L2 4CC)
-- 
Regards,

Laurent Pinchart


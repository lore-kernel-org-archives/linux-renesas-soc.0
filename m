Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4273939A9;
	Wed, 18 Mar 2026 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878364; cv=none; b=CWKtWuRSYntSd0bRnSK+XbSfS09mh4B7DOcygnAT3OBNCEeL5iBX0ruX5dKy0kof0FDIqRctoleQay692IGIeBoGwK8gaSMyNNh1C4XWwL0miGQ9dL62yUmPb1HZVejpNN1EZSETMudw2Le0kIy5M2bieAu38rq+Pr0tADdlzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878364; c=relaxed/simple;
	bh=gLusdaZpzZV/R2o46xC9iIKOyF8IVORea2zrIZcUUo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOLcz3GL9l+kDClAwa4ih4vBq5CUC0Y/wGDkiC2zwMXnpk++Q6Aaza0ljocCPKMGIJ+pSjFvBZrkaNAAgYYoZadH2oW2jVyIo7uBlebcbCdgRJnHCWs8siR8lfBb2wJZhrW86T7RsfTvbqsjPma4bAljnx8Vw7NAdpzIzMy3qmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NdQRu/Ap; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NdQRu/Ap"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 549561AA6;
	Thu, 19 Mar 2026 00:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878285;
	bh=gLusdaZpzZV/R2o46xC9iIKOyF8IVORea2zrIZcUUo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdQRu/Ap4RahmgPEtrpQLbyDMClFXrhzdjHnH2VqqN5x7r/b77J2vluyRvItmvZs6
	 E13vAcw4hyimeImIjkH6KTSBUdTqIQJqN1GS/GwPPE83k7hGXB1bu9n1Bu5DrQXedG
	 TYQ9Ri7LIiPOU03ua0fN5gfzZkcDTIrY3bj0D0Ec=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
Date: Thu, 19 Mar 2026 01:59:01 +0200
Message-ID: <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The format width and height is never propagated to the BRX source pad,
leaving its initial configuration invalid. Propagate the whole format
from the first sink pad to the source pad instead of only propagating
the media bus code. This fixes compliance with the subdev format
propagation rules.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index dd651cef93e4..911359faa600 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		compose->height = format->height;
 	}
 
-	/* Propagate the format code to all pads. */
+	/*
+	 * Propagate the format code to all pads, and the whole format to the
+	 * source pad.
+	 */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
 		unsigned int i;
 
-		for (i = 0; i <= brx->entity.source_pad; ++i) {
+		for (i = 0; i < brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
+
+		format = v4l2_subdev_state_get_format(state, i);
+		*format = fmt->format;
 	}
 
 done:
-- 
Regards,

Laurent Pinchart


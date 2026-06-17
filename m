Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07603F0A99;
	Wed, 17 Jun 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697368; cv=none; b=uKMtIrbdtQPmlr/mpdyUgxL3EiF+0R+mi0hqyhvQgRbR6fBx7BLZuOg+ltboUmGNaP1/q34KWYIm9ltHexhm/URwoKyjb+KOU2T5i0m3qO/eDER85kdMDg75UuZiMF9jQ+qpgnfHm1SWJdravSRFpPTVP6Ez/WVOEm/KTyCA5ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697368; c=relaxed/simple;
	bh=BxfPGRr2J1D055cjrNZil4rQ5zjx26uJty+0ZS+l6aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0K1k9mljQU1s0lHUqT4uXq9brFj9ZwhUAJupKf9sEAhl686iFslAJVOkNqiI6moNR/s/lzbjpX6htT0+s02UAcQcO+mtZdfnoi8N48EHerz2wDxXAhRcGxPBM0gbFin/4i63r661ze3fBUoVZ1R8u1HMQxPR5iX6LPbdjru6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RSO1th//; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RSO1th//"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233AE97F;
	Wed, 17 Jun 2026 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697319;
	bh=BxfPGRr2J1D055cjrNZil4rQ5zjx26uJty+0ZS+l6aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RSO1th//l5VGOB3LKm+7zp2Gi2yhq0glg4UKzxHI1+jMuHotN26RoxcghWWzg5umq
	 Au8pA9z9amg1Z4pu6acNdiGeqqn71nywvu3t4KJmQ65mdzuyZDA+C7x3zyptsFr9CR
	 OpHnQXkQjeisvbW91OYz7Kx9/1MQu/PMhYldlxuk=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:55 +0300
Subject: [PATCH v6 02/11] media: rcar-vin: Link VINs on Gen3 to a single
 channel on each CSI-2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260617-rcar-streams-v6-2-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=BxfPGRr2J1D055cjrNZil4rQ5zjx26uJty+0ZS+l6aM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotDeU2HQMH+Ksbdr6V434I1E5hiKAwmD4jgi
 X+ZFv+Xzu6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLQwAKCRD6PaqMvJYe
 9aZKEACQ4YQcFPg9I7Kpu9Hv6GYO9uNyL9ipBLIZW52oU5p3hKkZKL8ELOg+meRH5zi7MLSlMnr
 BGdVLqDTDbAVP/Z30Pon1SdqQk8dOa7+M0bfYnVCk9Ce295IP8zcO/lhGUVhs6TXJRoXqTUjCIo
 Tjyrxf8jVhBgv8dTwiSfa0PRqK0b3LAgbTtJKPp0xuPNnWIAJfKSO+Pum99+ScXPrTBWmBE2Lpz
 C6f5tOZ525DEL4BhhZGvReivO/9nmvoPfwbrI1zRD13ibY8Xcke/XuUNARrTUFNcz/e4Fash1Td
 bAeCGnh23mTiO8O81uhf6DsVAtXGM7qraEWb9bT6lvh5Lm4rSOxKOlG4+fMvfXQCegIM+g6eImI
 fFBD4iMso/VsrDUXfNsK0UiGHBwS0gdaDZgCxxbHYCAscQ5YOpQ538r/RoWLQBJMFlRGA4MJ3G6
 SW8fJk6wTnaRba3HUQf9qVOZrdl9r77IE8JHLoCpoLDyo/R6lB3k4vXPDTMgdS9LnuxVwCXDphq
 wQY1Tbo8WlKM2lrLVTJGeJ1gqFQxs/8wRyVUrwUoULOPcAun886JJRjadl9KTpJw/25ybI707sU
 v59z4vyLZiVIolGwYasIjaTOPpyBn9uQPR0pA/hznoDZyEMOAzkYu0PssCqQ+4ERVZ2nDTB6eA/
 vb4qbZO6fNUq0mg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The stream routing will be fully configurable when we add full streams
support to the rcar pipeline. Thus there is no need for the user to be
able to link VINs to different CSI-2 channels. In fact, allowing e.g.
VIN0 to be connected to CSI-2 channel 3 would be wrong, as the hardware
doesn't allow that.

Change rvin_csi2_create_link() so that it creates media links only
between matching VINs and CSI-2 channels (VIN0 - channel 0, VIN1 -
channel 1, etc.).

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..2fcea715101c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -673,23 +673,26 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
 	struct media_entity *sink = &group->vin[id]->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
+	struct media_pad *source_pad;
+	unsigned int source_idx;
 	unsigned int channel;
-	int ret;
 
-	for (channel = 0; channel < 4; channel++) {
-		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
-		struct media_pad *source_pad = &source->pads[source_idx];
+	/*
+	 * The channels from CSI-2 blocks and the VIN groups have a set of
+	 * hardcoded routing options to choose from. We only support the routing
+	 * where all VINs in a group are connected to the same CSI-2 block,
+	 * and the Nth VIN in the group is connected to the Nth CSI-2 channel.
+	 */
 
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
+	channel = id % 4;
+	source_idx = rvin_group_csi_channel_to_pad(channel);
+	source_pad = &source->pads[source_idx];
 
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret)
-			return ret;
-	}
+	/* Skip if link already exists. */
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
 
-	return 0;
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
 }
 
 static int rvin_parallel_setup_links(struct rvin_group *group)

-- 
2.43.0


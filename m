Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA5C36A364;
	Mon, 11 May 2026 23:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543803; cv=none; b=eN4RMdTuouIlv5X29dtlMkhGriq5OmR5ihPbYcFVjQxohBMd4kGUfLBcHmO2GOnIBBTuLqgNHp8XLgaT98X/eq9sQyQZVmfGzz/SPQcggWEGYp4ptxaBudd/6Muq+uuRDW7V7DWh150UurIdC2+hLTlqOGTXomU/y50+tQTJrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543803; c=relaxed/simple;
	bh=MXqD0tcQNcnHW2tzHff801ywnDMdRZcA6m0SJoIXlzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx+a46uv4w5LViO9znIuLE7zXnEsmL8GzuN0jTmLVI47m6187UCbf5y2cJwwASQkYQY0RG0FE17fBtb+PxhF/moSyZF4HtpMX1it5Ekn1HqFBzwqppVjHcidi5hcrr1LdUEyUlH0tc1QJAoBX5xibwtFP8OwXtLKmn4/yO7j0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ns9NbCWk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ns9NbCWk"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9EC5C59;
	Tue, 12 May 2026 01:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543793;
	bh=MXqD0tcQNcnHW2tzHff801ywnDMdRZcA6m0SJoIXlzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ns9NbCWkgxBfo5kzvZbBX8cohVnX5osvAWr0rsi/dF9g+tC8e0YnD9LGK7xoj3rke
	 ATXTuT4UuaWqy7MiddnpzG8OuanVPc6u0NRB+88qxx3Zk0XskVb9UufxZZnqQ7oRlY
	 sF5ZiSt0R7jHLo6jEGcpN/K9zwPFj5RLYELNxrOI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 01/11] media: renesas: vsp1: Avoid forward function declaration
Date: Tue, 12 May 2026 02:56:25 +0300
Message-ID: <20260511235637.3468558-2-laurent.pinchart+renesas@ideasonboard.com>
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

Reorder functions to avoid the forward declaration of the
vsp1_du_pipeline_configure(). No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 90 +++++++++----------
 1 file changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 15d266439564..79b85968b061 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -57,6 +57,50 @@ static void vsp1_du_pipeline_frame_end(struct vsp1_pipeline *pipe,
  * Pipeline Configuration
  */
 
+/* Configure all entities in the pipeline. */
+static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
+{
+	struct vsp1_drm_pipeline *drm_pipe = to_vsp1_drm_pipeline(pipe);
+	struct vsp1_entity *entity;
+	struct vsp1_entity *next;
+	struct vsp1_dl_list *dl;
+	struct vsp1_dl_body *dlb;
+	unsigned int dl_flags = 0;
+
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  drm_pipe->width, 0);
+
+	if (drm_pipe->force_brx_release)
+		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
+	if (pipe->output->writeback)
+		dl_flags |= VSP1_DL_FRAME_END_WRITEBACK;
+
+	dl = vsp1_dl_list_get(pipe->output->dlm);
+	dlb = vsp1_dl_list_get_body0(dl);
+
+	list_for_each_entry_safe(entity, next, &pipe->entities, list_pipe) {
+		/* Disconnect unused entities from the pipeline. */
+		if (!entity->pipe) {
+			vsp1_dl_body_write(dlb, entity->route->reg,
+					   VI6_DPR_NODE_UNUSED);
+
+			entity->sink = NULL;
+			list_del(&entity->list_pipe);
+
+			continue;
+		}
+
+		vsp1_entity_route_setup(entity, pipe, dlb);
+		vsp1_entity_configure_stream(entity, entity->state, pipe,
+					     dl, dlb);
+		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
+		vsp1_entity_configure_partition(entity, pipe,
+						&pipe->part_table[0], dl, dlb);
+	}
+
+	vsp1_dl_list_commit(dl, dl_flags);
+}
+
 /*
  * Insert the UIF in the pipeline between the prev and next entities. If no UIF
  * is available connect the two entities directly.
@@ -224,8 +268,6 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 /* Setup the BRx source pad. */
 static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 					 struct vsp1_pipeline *pipe);
-static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe);
-
 static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 				      struct vsp1_pipeline *pipe)
 {
@@ -541,50 +583,6 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 	return 0;
 }
 
-/* Configure all entities in the pipeline. */
-static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
-{
-	struct vsp1_drm_pipeline *drm_pipe = to_vsp1_drm_pipeline(pipe);
-	struct vsp1_entity *entity;
-	struct vsp1_entity *next;
-	struct vsp1_dl_list *dl;
-	struct vsp1_dl_body *dlb;
-	unsigned int dl_flags = 0;
-
-	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
-					  drm_pipe->width, 0);
-
-	if (drm_pipe->force_brx_release)
-		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
-	if (pipe->output->writeback)
-		dl_flags |= VSP1_DL_FRAME_END_WRITEBACK;
-
-	dl = vsp1_dl_list_get(pipe->output->dlm);
-	dlb = vsp1_dl_list_get_body0(dl);
-
-	list_for_each_entry_safe(entity, next, &pipe->entities, list_pipe) {
-		/* Disconnect unused entities from the pipeline. */
-		if (!entity->pipe) {
-			vsp1_dl_body_write(dlb, entity->route->reg,
-					   VI6_DPR_NODE_UNUSED);
-
-			entity->sink = NULL;
-			list_del(&entity->list_pipe);
-
-			continue;
-		}
-
-		vsp1_entity_route_setup(entity, pipe, dlb);
-		vsp1_entity_configure_stream(entity, entity->state, pipe,
-					     dl, dlb);
-		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
-		vsp1_entity_configure_partition(entity, pipe,
-						&pipe->part_table[0], dl, dlb);
-	}
-
-	vsp1_dl_list_commit(dl, dl_flags);
-}
-
 static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
 					    struct vsp1_rwpf *rwpf,
 					    u32 pixelformat, unsigned int pitch)
-- 
Regards,

Laurent Pinchart


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667360;
	b=Q+RsT/q5RlZKzNHGPt/QM2Ce3DmmfyzVOR9GxT0Rc566KuOBhyZLFqTcZv6m+RtzSOnz
	 a/ULA8Et1n8tmfotf//lc7A/RzYLUNJRtDn+LNUVpwLvE7mOYkiJW2UVDGqeztQ5OFXkd
	 bqNNvO1zwDuwuFk+nnrIWzW0ENChwTm7+asQumpnnPLcokoys+pmygeh/v+WCtqHpKjmU
	 QzkK6X2HWgWBSVnIM1bKtYvrRgtAUL1AzGV2bZKWz+fVoQy5sVFq/hCtLgEsxrLv/dN0b
	 psRxBmR3EA74mLp0Hehczh+uhnxf8L/PaLRvqM9PSoyNLv4g2HoUBT5ai382ajzuZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BDHrGP4CZUTi6YV0wuLzVp9VSjNqS3NwXhEF/30oZnc=;
	b=WMeOj1PQHVDaJwRGW60hyP3FdM+wpwj/eorH24YhfKVz7pJjUlzE7qfFmwyd1Y1rzfho
	 wV+bmV1ql4ZgB14aK2+1uGtnODF18pPQ1YuBcfsNwm7Ig+9tqhKhHvFu/tEdKE+JpsCjh
	 C67xHt5EV+S7I3jKazVgx/Sm7YT9kwYXBGQ5dHoBSInz6wPV8d2tnE7tT8oo1Z9Myyrco
	 4OCBzXTlCm58mGKrvp0PXvNkCFVKegBd2UOlRcGExRpNtyxa4MVgFFPTtdg4YLVtJD/OT
	 Kyas5ElKPOEeiQlkaHYQXS7OByPavQ3e5KsbJ4NSIOx70ajlXDZVuizAx0VzT0ZHEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PuBL85pP;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A012606A326;
	Thu, 26 Nov 2026 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A012606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PuBL85pP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667361; x=1827203361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGNDccke0TEPf9u5l5GhQ4xg3GtepUUAiBwYWmGMpR4=;
  b=PuBL85pPhE9s1o3OETtiKEOiOA+QUUyYPSyLMLs4tkcloN2h2Tl7Jipt
   Env+Bdx1BNhOYmN+FWOB8NrZYtoH+cL87R1BdQkfX7L+aVQ1WgzydfPAv
   93b2wDRJ4f393ytW3UJmqJymxQrpkrM7q5OH9ajOFFJGngQljaIa4+lFM
   ntjvtpDNKA0wEDmh1lR+hTBLUUc0S4ayYe64VPzELFNJ+FFHIQ9w6bBz3
   6O37iLyNvyCwYS35gHjEllGAp/uUMPExdVbVczClIR00BDGUqX4ISS7q7
   g0STDSlOC/AQ45Ik/xmY0uCQ4Edsx5gb2Fqm3lEONymEoxERJznCN4mTT
   Q==;
X-CSE-ConnectionGUID: vkZjE6bPSnmdK6w2kx8HwQ==
X-CSE-MsgGUID: fgKpWMt5S/Sty7kaSBG10Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4472792"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4472792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:29:20 -0800
X-CSE-ConnectionGUID: m68eC+yURtWF8o2uW8dqfw==
X-CSE-MsgGUID: lh68Z+owQma7Zlr2IPg3zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12287735"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 20:29:13 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	John.Harrison@Igalia.com,
	kernel-dev@igalia.com,
	alex.hung@amd.com,
	liviu.dudau@arm.com,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	laurent.pinchart+renesas@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	uma.shankar@intel.com,
	arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 5/7] drm: writeback: Modify drm_writeback_get_out_fence helper
Date: Thu, 26 Nov 2026 09:58:33 +0530
Message-Id: <20261126042835.436307-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126042835.436307-1-suraj.kandpal@intel.com>
References: <20261126042835.436307-1-suraj.kandpal@intel.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_writeback_get_out_fence() does not itself need the parent
drm_connector object, but update it to take drm_connector for
consistency across the writeback interface, which is being moved
to use the top level drm_connector and traverse down to
drm_writeback_connector rather than passing in the lower level
object and traversing back up.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: John Harrison <John.Harrison@Igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
v6 -> v7:
- Rebase over latest kernel
- Rebase over latest writeback series by Dmitry

v5 -> v6:
- Rebase over latest kernel

v3 -> v4:
- Update subject line for consitency (John)
- Update commit message across commits for consitency (John)

 drivers/gpu/drm/drm_atomic_uapi.c | 4 +---
 drivers/gpu/drm/drm_writeback.c   | 4 ++--
 include/drm/drm_writeback.h       | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a3e8809b4508..139210b093e8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1498,7 +1498,6 @@ static int prepare_signaling(struct drm_device *dev,
 	}
 
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
-		struct drm_writeback_connector *wb_conn;
 		struct drm_out_fence_state *f;
 		struct dma_fence *fence;
 		s32 __user *fence_ptr;
@@ -1520,8 +1519,7 @@ static int prepare_signaling(struct drm_device *dev,
 		f[*num_fences].out_fence_ptr = fence_ptr;
 		*fence_state = f;
 
-		wb_conn = &conn->writeback;
-		fence = drm_writeback_get_out_fence(wb_conn);
+		fence = drm_writeback_get_out_fence(conn);
 		if (!fence)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 77f7955f955a..613cfaaa2584 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -509,10 +509,10 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_writeback_signal_completion);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
+drm_writeback_get_out_fence(struct drm_connector *connector)
 {
 	struct dma_fence *fence;
-	struct drm_connector *connector = drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector = &connector->writeback;
 
 	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 5e8ab51c2da4..2afa48ea7c00 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -104,5 +104,5 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 				int status);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector);
+drm_writeback_get_out_fence(struct drm_connector *connector);
 #endif
-- 
2.34.1


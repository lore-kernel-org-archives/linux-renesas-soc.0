Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667367;
	b=VqRPyg23f9jsHOHNoGNMF2XHDuhl3a2QJMLJL1kj2Qz8upfWSqGtpTNG86jsU5r1D3HK
	 dIYCstdnGeykcCbRMKfLq7thCcc7bWOKuXeXLz0dqPWVeZiZG1yW/aBZSgWCZzQt0qxgv
	 j6aQWnb6ndukrohZA5A6mYnDaKC38Izo/QjhuC0zfrqIi9AgdUpAjWAaMdjxCd/3cyOhI
	 YHbVGgqLTMkyvUdk1GUK2P4X28Eq6y+KL7hVt4qL+LraOOkJoav2AH6K88QoOPtX/yXE2
	 PmQ2mAbzH1VFA4RboSRd3pf1bDthX9kHPnRP/ilLhcnt+Sx0MVdl96UBYR+Ot8QeCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667367;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrsMxDu9FBk8EHoa2Dpxx1jqN8w5CqAlqHyYc7wCSWY=;
	b=p1e03Im/jvMoBHB+4c2W5d6ydaABksHNMWV9njMfbTohiyWXMzWHGhsycqYBFWUbQ26Y
	 IHkXy0XNFm6WXxCq5he0lzP5uXtKwSpEQ+ul6T4qV0r4WbpTb3uTHWmcvlqFucd9KJeor
	 x+zVjtQeN08dpwFo+AXHO+N4MClkaROS2qq3waW6KKrNUBhTBHCAwGIH9fJtxDTOYrnF9
	 LPj1lJVNRNDPjnqbG10MvapYI3EEJsS0qiMnSQqpd8iD8lH7zx1PwW81FIBnLlWF0DRH+
	 lTd8mFsLiu3Kc1uZRmcFS7O5Vc3YR9cTPOFea0ZRFSVvAjt+QF/6KdLwLH1teGof2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dp2m73md;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D94606A323;
	Thu, 26 Nov 2026 04:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dp2m73md
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667368; x=1827203368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAC68gtdtqJmFDT0oRCpLqnZvuNxy7EBILV+InQm8xk=;
  b=dp2m73md9eHS2j45wYLCtM4Dit+8xcIdZPxkMdgYK5T6rMis8LJs9klC
   g+ErZP/AdeVgpX52Wo04ODGsv01jj3XFFXS57ooapZFMZn+KKvas3ARfF
   FVMfosGUIwSOzBfKjHE6/DhZepDx38Ys71fw/aV6lPCWynN8wnKOdodvt
   Btw1ZwZC1IZKG/1U87AdQ3cvUZGObfvFgjNKqDfLHT5woIvz23Jt/KhvO
   smSxGNk/MMbjSSXYOPd51kNw/rPKXzCv8I6lA7ayEUt8vH51VBdLZSGx5
   7rv7QL10E58KYVSWt/HdP314fiPVHZZYasTyB82oCzBRwJHXpNXGJhUvG
   g==;
X-CSE-ConnectionGUID: NERPiuJVTtWObDYcApnVJg==
X-CSE-MsgGUID: pnhcn6VIQTqw8aT7bceVvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4472820"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4472820"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:29:27 -0800
X-CSE-ConnectionGUID: DZej+w/gTny5U/VqdNu/fA==
X-CSE-MsgGUID: +qQtv3FfSmCU22LrTuY36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12287761"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 20:29:19 -0800
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
Subject: [PATCH v8 6/7] drm: writeback: Modify prepare_writeback_job helper
Date: Thu, 26 Nov 2026 09:58:34 +0530
Message-Id: <20261126042835.436307-7-suraj.kandpal@intel.com>
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

The prepare_writeback_job() connector helper hook needs access to
the parent drm_connector object as well as the drm_writeback_connector
object itself. So, pass in the top level drm_connector and traverse
down to drm_writeback_connector rather than passing in the lower
level object and traversing back up. This also makes it uniform
with the params passed to other drm_connector_helper_funcs hooks.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h | 2 +-
 drivers/gpu/drm/drm_writeback.c                      | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c        | 3 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c  | 5 ++---
 drivers/gpu/drm/vkms/vkms_writeback.c                | 2 +-
 include/drm/drm_modeset_helper_vtables.h             | 2 +-
 7 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index e98481d5aa74..afed660762fd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -131,8 +131,8 @@ STATIC_IFN_KUNIT int amdgpu_dm_wb_connector_get_modes(struct drm_connector *conn
 }
 EXPORT_IF_KUNIT(amdgpu_dm_wb_connector_get_modes);
 
-STATIC_IFN_KUNIT int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector,
-			       struct drm_writeback_job *job)
+STATIC_IFN_KUNIT int amdgpu_dm_wb_prepare_job(struct drm_connector *wb_connector,
+					      struct drm_writeback_job *job)
 {
 	struct amdgpu_framebuffer *afb;
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h
index 8d39a37e80f0..ede7ff007ad7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h
@@ -59,7 +59,7 @@ int amdgpu_dm_wb_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
 				      struct drm_connector_state *conn_state);
 int amdgpu_dm_wb_connector_get_modes(struct drm_connector *connector);
-int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector,
+int amdgpu_dm_wb_prepare_job(struct drm_connector *wb_connector,
 			     struct drm_writeback_job *job);
 void amdgpu_dm_wb_cleanup_job(struct drm_writeback_connector *connector,
 			      struct drm_writeback_job *job);
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 613cfaaa2584..e63a2a0c2e2c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -374,7 +374,7 @@ int drm_writeback_prepare_job(struct drm_writeback_job *job)
 	int ret;
 
 	if (funcs->prepare_writeback_job) {
-		ret = funcs->prepare_writeback_job(wb_connector, job);
+		ret = funcs->prepare_writeback_job(connector, job);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 38c214dea08d..88227aa7ee69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -87,10 +87,9 @@ static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *wb_conn,
+static int dpu_wb_conn_prepare_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)
 {
-	struct drm_connector *connector = drm_writeback_to_connector(wb_conn);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 02e74048d00f..6c4685147e49 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -47,11 +47,10 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
+static int rcar_du_wb_prepare_job(struct drm_connector *connector,
 				  struct drm_writeback_job *job)
 {
-	struct drm_connector *conn = drm_writeback_to_connector(connector);
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(conn);
+	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob;
 	int ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8d72946989fe..be67b13e7347 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -72,7 +72,7 @@ static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
+static int vkms_wb_prepare_job(struct drm_connector *connector,
 			       struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob;
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 60b30cc26940..bff41a1d49a6 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1161,7 +1161,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 * This callback is used by the atomic modeset helpers.
 	 */
-	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
+	int (*prepare_writeback_job)(struct drm_connector *connector,
 				     struct drm_writeback_job *job);
 	/**
 	 * @cleanup_writeback_job:
-- 
2.34.1


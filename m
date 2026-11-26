Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667327;
	b=b9WzjWPXIdzP3HgZFDbmXEAAhH+wkH3VSmzV7GmGc/hsqwfIet5BP6mS/hkRvydeQ52N
	 8qO3d728Y8u7MqnqmOq6DeOKaSEku4XD/eaWam6E7g4GZmVB0qf7MVUl8iFiB7+23A5dP
	 Ni+Bkd/mQ90myYlp9v9bOe5g4X6aY/zZQRboWdBPAA/moR8bj/qHdzhV8A5LvPXa+cw0D
	 wPTyQ70fczG6QOqoP2FYznNXDsEwbBRRSrE2xDufo8X0GpY1dEBwuRutfXURgvIxbhF52
	 wuk2iNUIA7y/YVIOJ5AMvPhLhLDP5JSglGqs8Kpl9qoSUQ+F7W6tw4L2uUlzjuD/tYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vGh91UcroRQlkbO9//z48Xl7KoaJQ53w/I42k7ERlk4=;
	b=IJO8ANS8Mcs6Q9kKhyIiuaH9ouZxfa2lZAhZ9/gh3JtM+z+hlAbJke2da9Zcw8yS6oyZ
	 LVjm2fL4bXwuAIodp6ClC0d7dpRsYIrtp0TSlNBHlw7iiycwzW4Bs/QYgl716gJEeaJNv
	 QsG22+nZQHPRMqiObXOTVLlGbWTYzuYocwTZvHtGssbJYepsOqwPM1/9L64rFCNXZzMSR
	 9XP9cS58lI2tZVXMeAWaCys+gzap2accyq5p8PcXrbSxT89NhBgJAyDsF9DklK7ykEPFF
	 LgxK2h7dAMSkfMBrenr8Ysw7a0kGl1aD+HXE5JPMwG1aAonc54nMSITTDlOKzd3lwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="n0n9J/5Y";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F4606A31C;
	Thu, 26 Nov 2026 04:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n0n9J/5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667327; x=1827203327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qm6oFup9k1MgM8LiXYxYVFkfYUgamzbYYh/rI5/uSA0=;
  b=n0n9J/5Y8Xf1e+7/9Ouo9wvnfjfECzDx/hKvfwOFjuUUwUQP5uHBpU9I
   +cqzUB1Yifwc4stsSJZ40OSVRlZtqPMObYZjiIVotB3fwOFKTRSEAJczD
   Zn3aUdmpXW0YSfqp6gqNYsmerXBpmdySJMeLvw7vBTcofBJxYwQ3ycWXF
   hScY8BkjILswhMbVscN3nTCjmhW4KT2K+gdQpkJ+cMO+T57ETbVaxb0WB
   vlmx/wcQVngSnvfPgznCi29MXOL865fNTkNvVqa14315/3AmY4L3jnTDb
   e7+UoL26awF4C+/BmkKrCG+2tMiPfZKhEajpl29eeyk1oWJ2+Cjle9j0k
   g==;
X-CSE-ConnectionGUID: hwMJmQaYR6ioNggsfVLnGw==
X-CSE-MsgGUID: A/rQyCvhS4Kdg5lLpdcPEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4472702"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4472702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:28:46 -0800
X-CSE-ConnectionGUID: KlBiqAXPQRyPorIK2aPXaQ==
X-CSE-MsgGUID: ZY7XDbNBSDO+laM5cGeRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12287647"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 20:28:38 -0800
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
Subject: [PATCH v8 0/7] Refactor drm_writeback_connector structure
Date: Thu, 26 Nov 2026 09:58:28 +0530
Message-Id: <20261126042835.436307-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some drivers cannot work with the current design where the connector
is embedded within the drm_writeback_connector such as intel and
some drivers that can get it working end up adding a lot of checks
all around the code to check if it's a writeback conenctor or not.
This is due to the inheritance limitation in C.
This series intends to solve it by moving the drm_writeback_connector
within the drm_connector and remove the drm_connector base which was in
drm_writeback_connector. This is done in union with hdmi connector
within drm_connector to save memory and since drm_connector cannot be
both hdmi and writeback it serves is well.
A RFC version was floated and discussion had taken place at [1] which
kicked of this more cleaner series.
We do all other required modifications that come with these changes
along with addition of new function which returns the drm_connector when
drm_writeback_connector is present.
This series also contains some writeback API cleanups as a consequence
of writeback connector moving into drm_connector
All drivers will be expected to allocate the drm_connector.
This discussion was tiggered from [2]

[1] https://patchwork.freedesktop.org/series/152758/
[2] https://patchwork.freedesktop.org/series/152106/

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (7):
  drm: writeback: Refactor drm_writeback_connector structure
  drm: writeback: Modify writeback init helpers
  drm: writeback: Modify drm_writeback_queue_job helper
  drm: writeback: Modify drm_writeback_signal_completion helper
  drm: writeback: Modify drm_writeback_get_out_fence helper
  drm: writeback: Modify prepare_writeback_job helper
  drm: writeback: Modify cleanup_writeback_job helper

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_connector.c   |  4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  | 10 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h  |  4 +-
 .../tests/amdgpu_dm_connector_test.c          |  6 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_test.c  |  2 +-
 .../amdgpu_dm/tests/amdgpu_dm_wb_test.c       |  6 +-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  | 13 ++--
 drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +-
 drivers/gpu/drm/drm_writeback.c               | 50 +++++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  6 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 17 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                 |  8 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 15 ++--
 include/drm/drm_connector.h                   | 72 ++++++++++++++++--
 include/drm/drm_modeset_helper_vtables.h      |  4 +-
 include/drm/drm_writeback.h                   | 76 ++-----------------
 27 files changed, 174 insertions(+), 177 deletions(-)

-- 
2.34.1


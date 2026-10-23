Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750941;
	b=o30naS6H95vi9JMfVs7M2s+RWb216dU26/Mm4dyZnjwr+QOlnS0bwg9resdt/liGVbES
	 VrexMoiuCeV2YGtxKe45TuIgRe3w9KKA/z5fr7xvhTAiX1HeIGI3nzfpacUkr6o80UFOn
	 7og+9zmzm+y6tCAXXWHB5A/UUaqayiMVExhuZjiVl6PjLzIUHXwjcNfxfXkxcXaXaKYRY
	 WuBr8pF1NRNOWTYPBVXXB2z/uIUaCX6PnSPvMgLNeFCIuS/kCCWZrYep2i/nBtjmAH8pJ
	 MfWZHrecVV+9lqqWt6jfKs3Q4hnNQBmIOfHGkQr2gye1zUbM45+Xi/xc2Jk2Xzc9ZUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750941;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=WWj8cJaFKWW/3VUfB0olF9gXuECfuO0KdXvS2+pAZ6g=;
	b=2HU2z3osuNIB1DlTcN7NSeyu9m48oZ6SiAAwxG3N7iU0fIFnPeBuFXudcHGlwowQLa3X
	 FQxbZQlvvHhO7E84VFcKb37ZjSmJ4lfkOz5nZAWQsoLYBNXO8yruPqtxByIdpv6eRHU/7
	 cXFM3Xob3hSmfFTvY7bEwbS2HiDVa91WkxUfaieWuAFhOwPz/QEjfzyxmpZEUWgju3aP9
	 +BXTJVhNsHCprxKq/9kTt5VWOBtiQcThnyRVtWHBCpaXWqm8UkrgNe9Z/OdK6HV1+b2av
	 xrOOdm5E5WK/nEIfT5a6iVY73KKRUTt+Q6Y0G0KJkkgWStlfMTnezxki2tw637u7jsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tyl2Ylo8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2D0606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tyl2Ylo8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7031650
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 03:22:16 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D25BD3F7B4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750940; bh=VnaOaoCbZWtRveOiSDtrRS+aRrEZTeoetU0oSSXUGhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyl2Ylo8AyJpLtHtrxv1etZGIYrR4qS2sCvLNm/ggRtEWd/ah0EI6ad4Yi0kFzccT
	 EX1bnuB3gwgRHAKM4bJizR1uktA0I+fg+MyL2ui1JUvBRn5Sel8i1r5l5ThEilyITc
	 tqZWNK3JhDuR3yh037ZjObjfklqJePbsPWP6BLmY=
Date: Fri, 23 Oct 2026 11:21:48 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Harrison <John.Harrison@igalia.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	Eric Anholt <eric@anholt.net>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Brian Starkey <brian.starkey@arm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v7 0/9] drm: writeback: clean up writeback connector
 initialization
Message-ID: <ats1PJqVhNR-RXAX@e142607>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 04:12:26PM +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Enough of the drivers don't use
> the encoder embedded into the drm_writeback connector.  In preparation
> to further rework of the WB connectors (as planned to enable WB for i915
> / xe drivers, which would move drm_writeback_connector to be a field
> inside drm_connector instead of subclassing it) remove the drm_encoder
> wrapped in struct drm_writeback_connector. Rename the
> drm_writeback_connector_init_with_encoder() to
> drm_writeback_connector_init()
> and copy drmm_writeback_connector_init() interface. Then, with the
> encoder being gone, handle proper cleanup of writeback data in
> drm_connector_cleanup().
> 
> ---
> Changes in v7:
> - Significantly reworked series, no longer insisting on using drmm.
> - Link to v6: https://patch.msgid.link/20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com
> 
> Changes in v6:
> - Dropped applied patch
> - Implemented suggestion by Alex to use drmm allocation for the
>   writeback connector.
> - Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com
> 
> Changes in v5:
> - Rebased on top of drm-misc-next
> - Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
> - Expanded commit messages, describing why the drivers are converted to
>   drmm_writeback_connector_init() (Laurent)
> - Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com
> 
> Changes in v4:
> - Rebase on top of drm-misc-next, dropping applied patch.
> - Added a note regarding memory leak in the AMDGPU driver.
> - Fixed a devm vs drmm issue in the msm/dpu driver.
> - Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com
> 
> Changes in v3:
> - Fixed subject prefix for the rcar-du patch (Jessica Zhang)
> - Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com
> 
> Changes in v2:
> - Switched to drm_crtc_mask() where applicable (Louis Chauvet)
> - Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com
> 
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: John Harrison <John.Harrison@igalia.com>
> To: Harry Wentland <harry.wentland@amd.com>
> To: Leo Li <sunpeng.li@amd.com>
> To: Rodrigo Siqueira <siqueira@igalia.com>
> To: Alex Deucher <alexander.deucher@amd.com>
> To: Christian König <christian.koenig@amd.com>
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Magnus Damm <magnus.damm@gmail.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> To: Maíra Canal <mcanal@igalia.com>
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Louis Chauvet <louis.chauvet@bootlin.com>
> To: Mihail Atanassov <mihail.atanassov@arm.com>
> To: Eric Anholt <eric@anholt.net>
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Brian Starkey <brian.starkey@arm.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> 
> ---
> Dmitry Baryshkov (9):
>       drm/amd/display: embed the writeback encoder in amdgpu_dm_wb_connector
>       drm/komeda: embed the writeback encoder in komeda_wb_connector
>       drm/mali: embed the writeback encoder in malidp_drm
>       drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
>       drm: writeback: drop excess connector initialization functions
>       drm: writeback: rename drm_writeback_connector_init_with_encoder()
>       drm: writeback: don't destroy the shared writeback properties
>       drm: writeback: clean up writeback connectors in drm_connector_cleanup()
>       drm: writeback: drop the drmm writeback cleanup action
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  27 +++-
>  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   4 +-
>  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   4 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   3 +
>  .../drm/arm/display/komeda/komeda_wb_connector.c   |  24 +++-
>  drivers/gpu/drm/arm/malidp_drv.h                   |   1 +
>  drivers/gpu/drm/arm/malidp_mw.c                    |  25 +++-
>  drivers/gpu/drm/drm_connector.c                    |   3 +
>  drivers/gpu/drm/drm_crtc_internal.h                |   3 +
>  drivers/gpu/drm/drm_writeback.c                    | 147 +++++----------------
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |   2 +
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    |  29 +++-
>  drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
>  include/drm/drm_writeback.h                        |  22 +--
>  16 files changed, 140 insertions(+), 165 deletions(-)

I still personally dislike the whole idea of removing a framework feature that was beneficial
to a lot of drivers in order to help one driver, but that is just my stance. The stats kind of
show that and if it wasn't for the massive delete in drm_writeback.c (partly of comments) you
would add more code with this change. The cleanup and fixes patches in this series also points
out that there are still issues with the concept and John and sashiko are also raising issues.

Anyway, as far as komeda and malidp drivers changes are concerned, I'm OK with them being applied
as long as the framework or the patch series solves any cleanup issues. So for those two patches
you can have my

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> ---
> base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
> change-id: 20250801-wb-drop-encoder-97a0c75bd5d7
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

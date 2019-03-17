Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C79C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 02:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 695B9218D0
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 02:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iFE+4TrX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfCQCUE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 22:20:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfCQCUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 22:20:04 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEEA3255;
        Sun, 17 Mar 2019 03:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552789202;
        bh=mwg+/h/LoUeTzOw1fP4RdzRM8Eksn9Tq5YgjnwRul9Q=;
        h=Date:From:To:Cc:Subject:From;
        b=iFE+4TrX0DiYWz4kZTa/xDZ2fO/GzMgR7hZB9R4FUFX/nY43uznka8Ufyl3cgLx3B
         +N5EJdSeAnwg2DlH0xpTrR8JrwcxoeV1MA3TCSn61es7je0PTYfcb5KLfgr4Hy2x/Z
         J4Tz+9FW4B0yWZL4WOgUfuqOoTj9jZPzRGe2NNR8=
Date:   Sun, 17 Mar 2019 04:19:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] DU LVDS dual-link mode support
Message-ID: <20190317021954.GA4912@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

The following changes since commit 3a7d2f4f4427f4b241f8240e370099e2ec1fd307:

  Merge branch 'etnaviv/next' of https://git.pengutronix.de/git/lst/linux into drm-next (2019-03-12 15:20:57 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git b3ddd36a2b05

for you to fetch changes up to b3ddd36a2b05074db0810a0f6508562f80045323:

  arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1 (2019-03-13 03:42:41 +0200)

The above commit is part of a branch name drm/du/lvds/dual-link in the
same tree. The two top-most commits of the branch are hacks meant for
testing only, so I didn't want to include them in this pull request.

Please note that this pull request refers to prototype RFC code, I'll
let you decide if you want to include it in renesas-drivers.

----------------------------------------------------------------
Laurent Pinchart (13):
      drm: rcar-du: Support panels connected directly to the DPAD outputs
      drm: Clarify definition of the DRM_BUS_FLAG_(PIXDATA|SYNC)_* macros
      drm: Use new DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags
      drm: bridge: Add dual_link field to the drm_bridge_timings structure
      dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
      drm: bridge: thc63: Report input bus mode through bridge timings
      dt-bindings: display: renesas: lvds: Add renesas,companion property
      drm: rcar-du: lvds: Remove LVDS double-enable checks
      drm: rcar-du: lvds: Adjust operating frequency for D3 and E3
      drm: rcar-du: lvds: Set LVEN and LVRES bits together on D3
      drm: rcar-du: lvds: Add support for dual-link mode
      drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
      arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1

Stefan Agner (1):
      drm/bridge: use bus flags in bridge timings

 .../bindings/display/bridge/renesas,lvds.txt       |   6 +
 .../bindings/display/bridge/thine,thc63lvd1024.txt |   6 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   4 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  54 ++++++--
 drivers/gpu/drm/drm_modes.c                        |  12 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |   2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 |   6 +-
 drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c  |   5 +-
 .../omapdrm/displays/panel-lgphilips-lb035q02.c    |   5 +-
 .../drm/omapdrm/displays/panel-nec-nl8048hl11.c    |   5 +-
 .../drm/omapdrm/displays/panel-sharp-ls037v7dw01.c |   5 +-
 .../drm/omapdrm/displays/panel-sony-acx565akm.c    |   5 +-
 .../drm/omapdrm/displays/panel-tpo-td028ttec1.c    |   5 +-
 .../drm/omapdrm/displays/panel-tpo-td043mtea1.c    |   5 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   4 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |   4 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c             |   8 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   4 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  24 ++--
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |  10 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  66 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 140 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   3 +-
 include/drm/drm_bridge.h                           |  19 ++-
 include/drm/drm_connector.h                        |  36 +++++-
 35 files changed, 346 insertions(+), 128 deletions(-)

-- 
Regards,

Laurent Pinchart

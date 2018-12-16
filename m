Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55C0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A3DB2084A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i7wirkwg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbeLPRLe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:11:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45760 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbeLPRLe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 12:11:34 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9211459;
        Sun, 16 Dec 2018 18:11:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544980292;
        bh=ckYzgTEMLhJ4cq81o5scSAUyy3B3oHjX2GJn1MU4OIw=;
        h=From:To:Cc:Subject:Date:From;
        b=i7wirkwg+v0n7jqickkAUZtZttVizyhk5kFkmJO1Fj7m9ViOAfmA9G/xmgPUX4HkX
         LFolPVxwEg4+MXExGogKVuQcQ6lxf6WNW9/42QAJ5zqDVLW8fA9oo/TXH2c2vVghHA
         72hiooCKVm5Jkr/5zWcmQIzToR3uRcyxXPKi6HCw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] DU -next branch
Date:   Sun, 16 Dec 2018 19:12:20 +0200
Message-ID: <4714815.IyZ5WZzCdP@avalon>
Organization: Ideas on Board Oy
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

The following changes since commit 272c1a9b493986a95219dce674c49877d98cf90f:

  Merge tag 'exynos-drm-next-for-v4.21-v2' of git://git.kernel.org/pub/scm/
linux/kernel/git/daeinki/drm-exynos into drm-next (2018-12-14 11:27:24 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git drm/du/next

for you to fetch changes up to e4b271f20598eb17c60a508dcba1e35a4f9d2a8c:

  drm: rcar-du: Disable unused DPAD outputs (2018-12-16 13:55:03 +0200)

They contain all the pending DU patches, scheduled for v4.22, on top of Dave's 
latest drm-next branch.

----------------------------------------------------------------
Fabrizio Castro (4):
      dt-bindings: display: renesas: du: Document r8a774c0 bindings
      dt-bindings: display: renesas: lvds: Document r8a774c0 bindings
      drm: rcar-du: Add r8a774c0 device support
      drm: rcar-du: lvds: add R8A774C0 support

Geert Uytterhoeven (1):
      drm: rcar-du: Convert live DT patches to sugar syntax

Laurent Pinchart (4):
      drm: rcar-du: dw-hdmi: Reject modes with a too high clock frequency
      drm: rcar-du: Replace EXT_CTRL_REGS feature flag with generation check
      drm: rcar-du: Move CRTC outputs bitmask to private CRTC state
      drm: rcar-du: Disable unused DPAD outputs

 .../devicetree/bindings/display/bridge/renesas,lvds.txt |  3 +-
 .../devicetree/bindings/display/renesas,du.txt          |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c                  | 42 ++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h                  |  7 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                   | 41 +++++++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h                   |  8 +--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c               | 10 ---
 drivers/gpu/drm/rcar-du/rcar_du_group.c                 | 51 ++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c                   | 22 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts     | 93 +++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts     | 53 ++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts     | 53 ++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts     | 53 ++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts     | 53 ++++++--------
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c                  | 15 ++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                     |  1 +
 16 files changed, 278 insertions(+), 229 deletions(-)

-- 
Regards,

Laurent Pinchart




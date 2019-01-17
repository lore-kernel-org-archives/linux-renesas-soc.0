Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4E5C43612
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F90C20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mjElcQtg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfAQBt4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 20:49:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfAQBt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 20:49:56 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yyyyyyyyyyyyyby-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00::2])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A117E53E;
        Thu, 17 Jan 2019 02:49:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547689793;
        bh=OjINiDu+l4yhIiQLsjT8ZunIWHfCkKEePEgJnExaClE=;
        h=From:To:Cc:Subject:Date:From;
        b=mjElcQtgsMGT2yyK0yHQ8iI6Z5Gw+HELj8Yxbvoj8Ryg5BiSuH7xqjDBrWD3Yw5n2
         liWJ+qZtFwcgFnEeJ16c43FxQC2OMV6IcjQ9f7bDabydwfg3AIZKplHcHBTki/3lG4
         KKyOE+v4zUVGe5p+XbByzUqbFjhT0EfiI6l8RTKc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/6] R-Car DU DPAD support for D3 and E3
Date:   Thu, 17 Jan 2019 03:49:40 +0200
Message-Id: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for the DPAD0 output for the D3 and E3 SoCs. On
the Draak and Ebisu boards, DPAD0 is used for the VGA output.

Patches 1/6 and 2/6 prepare the grounds by successfully probing LVDS
encoders that have no connected output. This is required in order to
provide a dot clock to the DPAD output, as on the D3 and E3 SoCs the dot
clock is provided by the LVDS encoders.

Patch 3/6 then adds an API to the LVDS encoder driver to control the
LVDS output clock independently of the LVDS encoder itself, and patch
4/6 makes use of that API to control the clock from the DU driver.

Patches 5/6 and 6/6 finally enable the LVDS1 encoders in the Ebisu and
Draak boards DTs, required to operate the HDMI (out of LVDS0) and VGA
(using the LVDS1 dot clock) together.

The patches have been tested on Draak only as I don't have access to an
Ebisu board, but they should work equally well on both boards.

For your convenience the patches are available from

	git://linuxtv.org/pinchartl/media.git drm/du/next

Laurent Pinchart (6):
  drm: rcar-du: Simplify encoder registration
  drm: rcar-du: lvds: Don't fail probe if output is not connected on
    D3/E3
  drm: rcar-du: lvds: Add API to enable/disable clock output
  drm: rcar-du: Turn LVDS clock output on/off for DPAD0 output on D3/E3
  arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1 encoder
  arm64: dts: renesas: r8a77995: draak: Enable LVDS1 encoder

 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |  2 +
 .../arm64/boot/dts/renesas/r8a77995-draak.dts |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 34 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  3 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 52 +----------
 drivers/gpu/drm/rcar-du/rcar_lvds.c           | 92 ++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_lvds.h           | 18 ++++
 9 files changed, 146 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.h

-- 
Regards,

Laurent Pinchart


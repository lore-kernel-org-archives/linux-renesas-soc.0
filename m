Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA4BC32793
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Aug 2022 12:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbiHXMrl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Aug 2022 08:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbiHXMrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 08:47:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A31F915CF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:47:39 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC5E2B3;
        Wed, 24 Aug 2022 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661345256;
        bh=jmXMBiW2sAdBb7wHcyIWSm1ZxeHbRx5C7F49bqeOB2I=;
        h=From:To:Cc:Subject:Date:From;
        b=dzNqVvfArpr05Ky8ed9MvCJ+Rxe6iyNwKomWeb3NM559Ot5pUlKvRM5NNfS9i0BZH
         ikE7+Z8+WACR+ouU9EQBSC6kStk/eab/iP9OxO75FJKddmqe3jODRgBvZnxO/8k6SX
         qrjW05EKcHlUVEfIh5gCnw2zC3avMu/iDCEPyzC0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/5] drm: rcar-du: DSI fixes
Date:   Wed, 24 Aug 2022 15:47:21 +0300
Message-Id: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Changes to v3:
- Fix LVDS function renames wrt. export symbol.
- Fix missing static inline
- Use rcar_mipi_dsi_write for VCLKSET writes

 Tomi

Tomi Valkeinen (5):
  drm: rcar-du: lvds: Rename pclk enable/disable functions
  drm: rcar-du: dsi: Properly stop video mode TX
  drm: rcar-du: dsi: Improve DSI shutdown
  drm: rcar-du: fix DSI enable & disable sequence
  drm: rcar-du: dsi: Fix VCLKSET write

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 30 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  8 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 68 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 +++++++++++
 7 files changed, 135 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1


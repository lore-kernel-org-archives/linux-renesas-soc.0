Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFAFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 20:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEDFA20896
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 20:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JJfu2KC6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfCQUJ7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 16:09:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfCQUJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 16:09:59 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E8823A;
        Sun, 17 Mar 2019 21:09:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552853397;
        bh=aJwCyVjzSQW+OrxnEPFY7fh0jJd5NQJ35HeTl2ngyUw=;
        h=From:To:Cc:Subject:Date:From;
        b=JJfu2KC6FWlaIr/r58vgGdfnqfgdhEhaKJh+3Sa0+aCFnpOyA0t/je4KJPrK/4hby
         srg/FoH/eamhm9fPvsEiqD0uBsgqUAa8PO0SP+XbA4mS+tFb914QvYvDbwveoY8kYH
         PSXMw+DhLkDf+dkojS1VO2JofnwYMbCAnXpWdCsM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] du/for-renesas-drivers
Date:   Sun, 17 Mar 2019 20:09:53 +0000
Message-Id: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Please consider including this release in renesas-drivers.

--
Regards

Kieran

The following changes since commit 0f1d37e65a59e9db33ab85f6e2c9784768ef80f4:

  Merge branch 'drm-next-5.1' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-03-14 12:15:02 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/for-renesas-drivers

for you to fetch changes up to 99deb47fa63bb9fc7bd691e358fea1c5bccc1da2:

  drm: rcar-du: Add group hooks for atomic-commit (2019-03-17 19:29:37 +0000)

----------------------------------------------------------------
Kieran Bingham (9):
      drm: Fix subtle spelling error in drm_crtc_state
      drm: rcar-du: crtc: Make local functions static
      drm: rcar-du: Remove unused prototypes
      drm: rcar-du: Link CRTCs to the DU device
      drm: rcar-du: Add CRTC standby helpers
      drm: rcar-du: Add pre/post commit CRTC helpers
      drm: rcar-du: Provide for_each_group helper
      drm: rcar-du: Create a group state object
      drm: rcar-du: Add group hooks for atomic-commit

Laurent Pinchart (1):
      drm: rcar-du: Support panels connected directly to the DPAD outputs

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 159 +++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  16 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  54 ++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_group.c   | 182 ++++++++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_group.h   |  36 +++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  49 +++-----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |   2 +-
 include/drm/drm_crtc.h                    |   2 +-
 9 files changed, 359 insertions(+), 146 deletions(-)

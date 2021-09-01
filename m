Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEE0C432BE
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 23:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B1FF6023E
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 23:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhIAXuK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 19:50:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhIAXuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:50:09 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CEBC340;
        Thu,  2 Sep 2021 01:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540151;
        bh=+dee+gCFuu4a2ZBKzAfEdB9or3LKQ7mucKpynh4l5uo=;
        h=From:To:Cc:Subject:Date:From;
        b=siQdUq26tHYyEHXXuHgx4EaZcZCE3kXC1nzsQ9iU5rGJhehuZRcjoQPF2UcaiT1mJ
         Uph6VsgfhSN5OnyXQe142mJOnF1WTb+w48wRsJICCj+SnGVDnF1VWuznLfrxIUmPDm
         FoJMK1JiluFvMk342fWAUahwTtR0XTWfF3qeHwx8=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 0/5] drm: rcar-du: V3U Support
Date:   Thu,  2 Sep 2021 00:49:02 +0100
Message-Id: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend support for the V3U Display Unit.

The V3U DU support can be tested on a Falcon-V3U making use of the DSI
encoder from Laurent.

Patch 1 just cleans up in preparation for patch 5, and patch 2 is
required for operation on the V3U, however it is functional and should
be correct for the D3 and E3 as well, as they also lack external sync.

Patch 3 is a further clean up to fix the naming of fields identified as
incorrect while developing.

Patch 4 splits the RCAR_DU_FEATURE_CRTC_IRQ_CLOCK feature flag into two
separate components, allowing the V3U to select RCAR_DU_FEATURE_CRTC_IRQ
without RCAR_DU_FEATURE_CRTC_CLOCK.

And finally, Patch 5 enables the V3U and connects it to the MIPI DSI
encoder.

Tests have been run and produce images - but there are artifacts visible
and some modes are unavailable, which will need further investigations,
but can be done on top of this integration.


Kieran Bingham (5):
  drm: rcar-du: Sort the DU outputs
  drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
  drm: rcar-du: Fix DIDSR field name
  drm: rcar-du: Split CRTC IRQ and Clock features
  drm: rcar-du: Add r8a779a0 device support

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  9 ++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  6 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 68 +++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 11 ++--
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  6 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  8 +--
 6 files changed, 77 insertions(+), 31 deletions(-)

-- 
2.30.2


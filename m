Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3193C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 17:01:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51EC5218D0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 17:01:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n7E4nQqx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbfCORBQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 13:01:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53196 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727651AbfCORBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 13:01:16 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0DFF31A;
        Fri, 15 Mar 2019 18:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552669275;
        bh=R905az5TiJgr3ba6D2Ug0Pj86WB9igxiK7ishnNM5F4=;
        h=From:To:Cc:Subject:Date:From;
        b=n7E4nQqxzxOPJeGHvoX+6qfnkKsNFPyhpVpI1lcq2nYcYLPC7o+xEbWF4V8DFjFws
         u/B+MtER3AAJyTzyg4UmrBb+k29D9WZ5COAUySxbXGgNL+XEUZqulKJisz5fKT5Jr2
         eZJzJYjJmFkx4XHrbvkiN3LyTvF1zfRdEp5FbINI=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/6] drm: rcar-du: Rework CRTC and groups for atomic commits
Date:   Fri, 15 Mar 2019 17:01:04 +0000
Message-Id: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DU processes the CRTC and group objects, with various operations storing
state of those objects globally, along with performing configuration operations
in the atomic_begin handlers.

This series aims to refactor the code to establish a private object for the
group state, and move all hardware operations to occur only in the commit_tail
code paths.

The sequence of register writes to the DU is confirmed to be unchanged by this
series, however follow on patches after this may begin to modify the sequences.
Because of this, these patches are kept as their own series.

Note that the rcar_du_crtc_get() in rcar_du_crtc_atomic_begin() is safe to
remove, as the call to rcar_du_vsp_atomic_begin() now maps to a no-op, but is
kept for API integrity, though it could now be removed.

Removal of rcar_du_vsp_atomic_begin() and indeed rcar_du_crtc_atomic_begin()
could occur in a later patch, but needs to be synchronised with VSP update.

These patches are based on top of my previous cleanup series, which is on top
of drm-next.

Kieran Bingham (6):
  drm: rcar-du: Link CRTCs to the DU device
  drm: rcar-du: Add CRTC standby helpers
  drm: rcar-du: Add pre/post commit CRTC helpers
  drm: rcar-du: Provide for_each_group helper
  drm: rcar-du: Create a group state object
  drm: rcar-du: Add group hooks for atomic-commit

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 150 +++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 182 +++++++++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  36 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  49 +++----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |   2 +-
 7 files changed, 305 insertions(+), 133 deletions(-)

-- 
2.19.1


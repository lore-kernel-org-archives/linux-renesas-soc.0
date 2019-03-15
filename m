Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496C2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC13E21871
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ulw6aS43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfCOLeZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 07:34:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfCOLeZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 07:34:25 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 341C631A;
        Fri, 15 Mar 2019 12:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552649663;
        bh=xs9G2WbrohoDosW0J8dn0PTPj5yIuGQ0DEyM98CltCg=;
        h=From:To:Cc:Subject:Date:From;
        b=ulw6aS43bsEc5RsHE1SHZkYNIMQk4IxpZm2u5w+U0CcE+tSGMiRAbmYNJnabCsLMr
         uWvL6+uwYKYyMcha7uxOV3WgSzo75/QwtuA2HueGhk5kPygM7firAkm7/sXTZKtFQd
         HFgU/xCG9NFhq4w0ntoeJ6n1dLJKQt1cAoaXsAvg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 0/5] drm: rcar-du: Rework CRTC and groups for atomic commits
Date:   Fri, 15 Mar 2019 11:34:13 +0000
Message-Id: <20190315113418.24452-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

An early iteration for refactoring the RCAR-DU so that the group and CRTC state
is only changed during rcar_du_atomic_commit_tail.

Currnently, various parts of the group and crtc are adjusted and state is
stored globaly. Introduce a private object state for the groups so that we can
track per-state group-state, and start to utilise that to refactor so that all
hardware operations can occur during rcar_du_atomic_commit_tail().

This is only RFC state at the moment, and I am actively working on this code.

Kieran Bingham (5):
  drm: rcar-du: Link CRTCs to the DU device
  drm: rcar-du: Provide for_each_group helper
  drm: rcar-du: Create a group state object
  drm: rcar-du: add group hooks for atomic-commit
  drm: rcar-du: Add crtc standby helpers

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 150 +++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 203 ++++++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  38 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  52 +++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |   2 +-
 7 files changed, 313 insertions(+), 146 deletions(-)

-- 
2.19.1


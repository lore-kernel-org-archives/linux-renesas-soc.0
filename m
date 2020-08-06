Return-Path: <SRS0=aa6b=BQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D1C433E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Aug 2020 02:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 148702245C
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Aug 2020 02:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m6fWXBwb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgHFC3C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 5 Aug 2020 22:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgHFC3C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:29:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E19C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2020 19:29:01 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54D9650E;
        Thu,  6 Aug 2020 04:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680898;
        bh=z7jO7YGy0oA+E1mZ0kd+pSrB4kFkmX0MrOoSxeumiPY=;
        h=From:To:Cc:Subject:Date:From;
        b=m6fWXBwbFRjoA47Nj+eicITMPgOhV/T6kohS66rbuc+wKUfSqnrDC0jSFISBeKxeY
         2DNQLwK68ZXO7WiMX/SMTA3A82CD/9VRn9JlsiHRFiX6nrN/kGl/bTqbEUeiT7rawd
         D9LCzyLzJXZfEy+Wrah/VKKl9jB3RCPQz0K9io6I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] kms-tests: Small fixes and enhancements
Date:   Thu,  6 Aug 2020 05:27:59 +0300
Message-Id: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patch series fixes a problem in kms-test-crc.py (patch 1/3),
and improves kms-test-formats.py with better progress and error
reporting (2/3 and 3/3).

While working on this, I noticed that many formats were skipped in
kms-test-formats.py, as they were not supported by kmsxx. This is now
fixed, and the patches have been sent to the linux-renesas-soc mailing
list in "[PATCH 0/8] kmsxx: Various fixes and improvements".

Another discovery during this work was that fully planar formats are
broken in the DU driver. The fix has also been submitted in
"[PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV formats".

Laurent Pinchart (3):
  tests: crc: Fix AtomicRequest usage
  tests: formats: Add progress reporting
  tests: formats: Improve error reporting

 tests/kms-test-crc.py     |  2 +-
 tests/kms-test-formats.py | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart


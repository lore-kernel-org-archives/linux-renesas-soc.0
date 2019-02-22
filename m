Return-Path: <SRS0=c3Ds=Q5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BEAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Feb 2019 10:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1202220700
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Feb 2019 10:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A9I+Phl6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfBVKDH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Feb 2019 05:03:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57920 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfBVKDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Feb 2019 05:03:07 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A06B7255;
        Fri, 22 Feb 2019 11:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550829785;
        bh=Nqq0/k3in8ojLWRiR+SE12UyCPxwXlUEXlv7FW8oyog=;
        h=From:To:Cc:Subject:Date:From;
        b=A9I+Phl62MrwntZVBbrhUXM0b1xjHaosRUmdolZ1S0yt15rSFncW46fA2RaE8HOQ0
         YpbqusTM217Cj4H8sxVY6RoDiaR+I6F/NXl7Y7Tsqlmrx31fovCuv82qPraGSigb8D
         +lTbXB1LW8T3BiOaCbULyUU5y9sNtNAjS/g1Pu0Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH VSP test suite] Remove dependency on a particular yavta branch
Date:   Fri, 22 Feb 2019 12:02:57 +0200
Message-Id: <20190222100257.4847-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All the changes required by the VSP test suite have been integrated in
the master branch of yavta. There is no need to depend on the vsp branch
anymore, remove the corresponding paragraph from the documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 README | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README b/README
index 17920ee663c8..0d5a6967d7f5 100644
--- a/README
+++ b/README
@@ -45,10 +45,6 @@ system in a directory included in $PATH.
 * raw2rgbpnm (available at git://git.retiisi.org.uk/~sailus/raw2rgbpnm.git)
 * yavta (available at git://git.ideasonboard.org/yavta.git)
 
-All but the HGO and CLU/LUT tests can be run with the latest version of these
-tools. To test the HGO, HGT and CLU/LUT, the 'vsp' branch of 'yavta' is currently
-needed.
-
 The following tool is additionally required to run some of the tests. If the
 tool is not available the corresponding tests will be skipped.
 
-- 
Regards,

Laurent Pinchart


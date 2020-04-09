Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98FBC2BA2B
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D84E2078E
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 12:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sWIT+XFV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDIMMJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 08:12:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIMMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:09 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A266E72C;
        Thu,  9 Apr 2020 14:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434328;
        bh=LziLycvrG4hCw5KsPEXOhdeFs3Ol8t/qWMyfo47JIcQ=;
        h=From:To:Cc:Subject:Date:From;
        b=sWIT+XFVxITWV35CBh3ITxjqAjNAHQrgA6MWgktVvL/zddC+NoDMUU2vtGDdFhbRz
         Q0gvxbvBjZG/J4V0CDrEHPwVhPjdKdtGQf6ba37L8HYWJB02G6gbZYb/Y8lC+jC5yk
         YU9sO+a5ndTgrwOD3NN0fJn/sceUj6Cl1FanM9gw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 00/13] max9286 v8 - modifications
Date:   Thu,  9 Apr 2020 13:11:49 +0100
Message-Id: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

These patches generate the current diff that I plan to squash into the current
MAX9286v7 driver, to prepare a v8 posting.

There are several key fixups from Sakari's review, along with new features and
functionality changes. As such I've kept them separate so that the changes are
clearly visible to the current interested parties :-)

If you have comments on any of these changes, please let me know - otherwise
they'll all get squashed directly into the max9286 driver in preparation for
the v8.


Kieran Bingham (13):
  squash! max9286: Update the bound_sources mask on unbind
  squash! max9286: convert probe kzalloc
  squash! max9286: Fix cleanup path from GPIO powerdown
  squash! max9286: cleanup GPIO device registration fail path
  squash! max9286: Convert to use devm_regulator_get()
  squash! max9286: Fit max9286_parse_dt print on one line
  squash! max9286: Move multi-device workarounds out of upstream
  squash! max9286: Remove I2C mod-table
  sqaush! max9286: Lock format changes
  squash! max9286: Implement Pixelrate control
  squash! max9286: Disable overlap window
  sqaush! max9286: Describe pad index usage
  sqaush! max9286: Remove poc_enabled workaround

 drivers/media/i2c/max9286.c | 156 ++++++++++++++++++++++++++----------
 1 file changed, 115 insertions(+), 41 deletions(-)

-- 
2.20.1


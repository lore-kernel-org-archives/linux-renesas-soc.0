Return-Path: <SRS0=k+uM=7X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4DBC433E1
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0553E2074B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgFJMqc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 08:46:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50540 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgFJMqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:31 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7882A29E;
        Wed, 10 Jun 2020 14:46:27 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 0/9] GMSL fixups ready for v10.
Date:   Wed, 10 Jun 2020 13:46:14 +0100
Message-Id: <20200610124623.51085-1-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Unfortunately we missed the 5.8 window with reviews that came in really
late in the merge window, but hey  ... more time to do more fixups to
GMSL....

Jacopo has done various updates to fix the DT Yaml validation, though
there is probably some scope there that means we might need a
meta-schema for I2C-Muxes ... but that gets more complicated and
probably a bit out of scope for now.

I've taken more review comments into consideration and handled more
fixes for the drivers, which we expect to get to a point that these can
now be merged for the next release.

Sakari has at least provisionalyl given us his blessing - so lets hope
v10 is the last - and we can finally see max9286/rdacm20 get upstream.

--
Kieran


Jacopo Mondi (1):
  fixes! [max9286-dt]: Fix dt-validation

Kieran Bingham (8):
  fixes! [max9286]: Fix whitespace indent
  fixes! [max9286]: Validate link formats
  fixes! [max9286]: Use single sample per pixel
  fixes! [max9286]: Remove redundant DPHY check
  fixes! [max9286]: Remove redundant call
  fixes! [max9286-dt]: Add GPIO controller support
  fixes! [max9286-dt]: Correctly match the hex camera node reg
  fixes! [rdacm20]: Use usleep_range over mdelay(10)

 .../bindings/media/i2c/maxim,max9286.yaml     | 91 +++++++++++++++++--
 drivers/media/i2c/max9286.c                   | 45 ++++-----
 drivers/media/i2c/rdacm20.c                   |  4 +-
 3 files changed, 107 insertions(+), 33 deletions(-)

-- 
2.25.1


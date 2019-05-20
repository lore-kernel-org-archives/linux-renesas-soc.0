Return-Path: <SRS0=uQ1k=TU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE484C04AAF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 May 2019 09:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF085206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 May 2019 09:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732120AbfETJ1X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from sauhun.de ([88.99.104.3]:49458 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730445AbfETJ1X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id 6B9632C2761;
        Mon, 20 May 2019 11:27:21 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-input@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND 0/2] input: da9063 updates
Date:   Mon, 20 May 2019 11:27:09 +0200
Message-Id: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series removes the unused pdata interface and updates the header to
SPDX. Last time, a similar and bigger da9063 series was meant to go in
via MFD. This resend, however, was rebased to v5.2-rc1 and regrouped, so
it can go in via the input tree directly.

Wolfram Sang (2):
  input: da9063_onkey: remove platform_data support
  input: da9063_onkey: convert header to SPDX

 drivers/input/misc/da9063_onkey.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

-- 
2.19.1


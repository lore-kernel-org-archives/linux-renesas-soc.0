Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F11C4321B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEDF1206BF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfDYOT6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:19:58 -0400
Received: from sauhun.de ([88.99.104.3]:45548 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbfDYOT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 10:19:58 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 6D7162CF687;
        Thu, 25 Apr 2019 16:19:56 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] i2c: core: improve reporting of a suspended adapter
Date:   Thu, 25 Apr 2019 16:19:46 +0200
Message-Id: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Two drawbacks have been discovered for the newly added suspended check. Those
two patches fix them.

Changes since V1:
	* patch 2 added
	* Fixes: tag added

Wolfram Sang (2):
  i2c: core: ratelimit 'transfer when suspended' errors
  i2c: core: apply 'is_suspended' check for SMBus, too

 drivers/i2c/i2c-core-base.c  |  6 ++++--
 drivers/i2c/i2c-core-smbus.c |  4 ++++
 drivers/i2c/i2c-core.h       | 11 +++++++++++
 include/linux/i2c.h          |  3 ++-
 4 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.11.0


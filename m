Return-Path: <SRS0=mZgV=4A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAD9C2BA83
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Feb 2020 17:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB0432073C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Feb 2020 17:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sVg1NSHc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgBLRhd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Feb 2020 12:37:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38398 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLRhd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:37:33 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E4C2808;
        Wed, 12 Feb 2020 18:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581529051;
        bh=tByacKDtzas+FsPO+cxefndiOqIRRGbQTPgjJ1q3c3E=;
        h=From:To:Cc:Subject:Date:From;
        b=sVg1NSHcWLSJgGoJgEuEfzcFmaq5vqGEcPTADWSRutV2abeN3VxMmu7BKVvAwpeLq
         PyBukqvg0erEK6hPJweX4V6bslTdx3ln6AFX20jd38/yxee9FRwD/qcSnHGpFoavYU
         UW5EgY+GDc9GxROWFMQrmk47Yk/tmNrRXADLQH4U=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] max9286: Refactor V4L2 support to prevent EPROBE_DEFER failures
Date:   Wed, 12 Feb 2020 17:37:25 +0000
Message-Id: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the V4L2 notifiers are registered during DT parsing.

Move this handling and all other V4L2 code to two distinct implementations and
contained higher in the source code.  This simplifies the hardware
initialisation functions, and makes error paths and cleanup much easier to
parse.

I hope to squash these two patches into the max9286 and then post a v7, along
with Jacopo's RDACM20 split work, with an aim to hopefully getting upstream
integration.


max9286 v7 changlog currently looks like:

    v7:
     [Kieran]
     - Ensure powerdown lines are optional
     - Add a 4ms power-up delay
     - Add max9286_check_config_link() to core
     - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
     - Fix GPIO registration
    
     [Jacopo]
     - Remove redundanct MAXIM_I2C_SPEED macros
     - Move notifiers operations
     - Add delay after reverse channel reconfiguration
     - Move link setup to completion
     - Fix up max9286_check_config_link() implementation
     - Remove redundant dual configuration of reverse channel


Kieran Bingham (2):
  max9286: Split out async registration
  max9286: Collect all V4L2 registrations

 drivers/media/i2c/max9286.c | 205 ++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 78 deletions(-)

-- 
2.20.1


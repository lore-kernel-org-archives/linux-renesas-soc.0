Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627EAC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A9B820882
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4oyrUJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9B820882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbeLMKVM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 05:21:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44388 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbeLMKVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 05:21:12 -0500
Received: from Q.home (unknown [IPv6:2a02:c7f:1887:5d00:a043:492c:f55d:2bdb])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C792A549;
        Thu, 13 Dec 2018 11:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544696471;
        bh=ZZqUduKnt8pOi7v1FOD3xGSLACdlXK7vgHr6MAPnXYM=;
        h=From:To:Subject:Date:From;
        b=v4oyrUJqvKhUIONLYwN1KF8x4ZzlUHy3dqN6F8m2A5/MlwlGD2+YOk8t8KoFumTDQ
         SHXEzdL6lGU8ey1kvm53vndeSHKNgivSXZHpAJ32o8uhKqievmLPGJGdxCjA1jCBAD
         k9FnQIaYU06nwsqhDXJmJhjyMehT30rhvPcxCKyk=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] [PLEASEIGNORE] vsp1: Undesirable change
Date:   Thu, 13 Dec 2018 10:21:05 +0000
Message-Id: <20181213102105.409-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_wpf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index 2e8cc4195c31..207baf0cd75e 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -7,6 +7,8 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+/* A no op change. Please disregard */
+
 #include <linux/device.h>
 
 #include <media/v4l2-subdev.h>
-- 
2.17.1


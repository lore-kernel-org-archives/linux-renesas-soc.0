Return-Path: <SRS0=51Nn=UH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7789C468BD
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  8 Jun 2019 14:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7725121537
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  8 Jun 2019 14:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MpXZEqat"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfFHONC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 8 Jun 2019 10:13:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39402 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHONC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Jun 2019 10:13:02 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4326E5D;
        Sat,  8 Jun 2019 16:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560003180;
        bh=X2/JVVfXS1x08ZUXukgr/dKfXIosmPbD2c0O9DtaWNY=;
        h=From:To:Cc:Subject:Date:From;
        b=MpXZEqat3Q/YlVPEkXLNlr5/+tUHYld3Sy+Z+l/tR8Zyf04EjjNJ+TqFJgCDDTohj
         AQqRKjMnSmJUblDYJZ0FlXI321jaL/IgRgkPMABQCvHLyIH7s5ejypFWMSYmjQfG32
         3V+bKOO8rBR6/oj0kseU0P0WIEsMe0kzuiLLIqOE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] drm: panels: Add MAINTAINERS entry for LVDS panel driver
Date:   Sat,  8 Jun 2019 17:12:41 +0300
Message-Id: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the DRM LVDS panel driver uses a different approach to DT bindings
compared to what Thierry Reding advocates, add a specific MAINTAINERS
entry to avoid bothering Thierry with requests related to that driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2f487ea49a..713733afec17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5021,6 +5021,14 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
 F:	include/uapi/drm/i810_drm.h
 
+DRM DRIVER FOR LVDS PANELS
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	dri-devel@lists.freedesktop.org
+T:	git git://anongit.freedesktop.org/drm/drm
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-lvds.c
+F:	Documentation/devicetree/bindings/display/panel/panel-lvds.txt
+
 DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/mga/
-- 
Regards,

Laurent Pinchart


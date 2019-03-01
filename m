Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF998C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDA2720851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfCALGs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 06:06:48 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:42831 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727932AbfCALGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 06:06:48 -0500
X-IronPort-AV: E=Sophos;i="5.58,427,1544454000"; 
   d="scan'208";a="9011079"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2019 20:06:46 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 80BFB4377B77;
        Fri,  1 Mar 2019 20:06:43 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        #@vger.kernel.org, v4.4+@vger.kernel.org
Subject: [PATCH 1/4] usb: common: Consider only available nodes for dr_mode
Date:   Fri,  1 Mar 2019 11:05:45 +0000
Message-Id: <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are cases where multiple device tree nodes point to the
same phy node by means of the "phys" property, but we should
only consider those nodes that are marked as available rather
than just any node.

Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the phy node")
Cc: stable@vger.kernel.org # v4.4+
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/usb/common/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 48277bb..73c8e65 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
 
 	do {
 		controller = of_find_node_with_property(controller, "phys");
+		if (!of_device_is_available(controller))
+			continue;
 		index = 0;
 		do {
 			if (arg0 == -1) {
-- 
2.7.4


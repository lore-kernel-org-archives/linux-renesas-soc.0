Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09A6C2BB3F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 18 Nov 2023 23:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjKRXvQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 18 Nov 2023 18:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjKRXvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Nov 2023 18:51:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3F193
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Nov 2023 15:51:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3061C484;
        Sun, 19 Nov 2023 00:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1700351441;
        bh=EZIez//dm7X3iEmz/1gI/sq80PWxUxjkUb1aUmoD0g0=;
        h=From:To:Cc:Subject:Date:From;
        b=rgUuAaovBli30LZylDbJZAG8BhL0J8XrvaOhh8siMecjZDvOhWYllwtEhZn50v5Et
         nvRFHjrKhqiX5df5/t+FJVvSM7j+goFyajg4DIUyiOCUETIMmfHyxfGdM8wrPGHvi6
         iwoFwcTe1S3/maB/PoPJbSxeNRNNYV9ABGOw4p6Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH] kmstest: Fix writeback connector type check
Date:   Sun, 19 Nov 2023 01:51:15 +0200
Message-ID: <20231118235115.10486-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The kernel spells writeback connectors with a capital 'W'. Fix the
corresponding connector type check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 3cc8f1a3e306..93b9d89fa1fc 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -481,7 +481,7 @@ class KMSTest(object):
 
     def output_connectors(self):
         for connector in self.card.connectors:
-            if connector.fullname.startswith('writeback-'):
+            if connector.fullname.startswith('Writeback-'):
                 continue
             yield connector
 

base-commit: 2264236eefd15450320c0cdb34fa07ac0881f713
-- 
Regards,

Laurent Pinchart


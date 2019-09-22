Return-Path: <SRS0=mpTP=XR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297FAC3A5A2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 22 Sep 2019 19:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA883205F4
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 22 Sep 2019 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569180970;
	bh=vXDkuYne+Hy4F82vAvYwB/USPCaWPvacv5O9Bg8gQqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1P4l+95SL1vI2clhcbB8PU/me5NahhvjbasvTzJRJSM3rTIS3NLWe1J0dkzmlJEqC
	 ypNXCeuVXy/spogBeGJN4sjF8T2ckBRDc4TyHl9/+g1VW9DkLYHgJJcYlweAiIgtdf
	 WQDKv5KjaAJO3oaZk63Wt8gkFxW/F0iMt3XNOn9Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390020AbfIVSqb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 22 Sep 2019 14:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390001AbfIVSqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Sep 2019 14:46:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D9FE208C2;
        Sun, 22 Sep 2019 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569177990;
        bh=vXDkuYne+Hy4F82vAvYwB/USPCaWPvacv5O9Bg8gQqY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJ+GE9GaKbFMWBMd5Kc/A808x6XJHeePJTEAVvnpXBaglVsomDZbqOCx/++CF6vKB
         NMYEfeKqKytqBk9YHtHDyeYIS8VmFpW41JqenR5nNivEFmscQ6Lx2kyN8eVIRXVLva
         ehiTT7e8fmwPc1Y3C1DQ2v5HOqwiTszLmOEBrsHY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 082/203] media: vsp1: fix memory leak of dl on error return path
Date:   Sun, 22 Sep 2019 14:41:48 -0400
Message-Id: <20190922184350.30563-82-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 70c55c1ad1a76e804ee5330e134674f5d2741cb7 ]

Currently when the call vsp1_dl_body_get fails and returns null the
error return path leaks the allocation of dl. Fix this by kfree'ing
dl before returning.

Addresses-Coverity: ("Resource leak")

Fixes: 5d7936b8e27d ("media: vsp1: Convert display lists to use new body pool")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/vsp1/vsp1_dl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
index 104b6f5145364..d7b43037e500a 100644
--- a/drivers/media/platform/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/vsp1/vsp1_dl.c
@@ -557,8 +557,10 @@ static struct vsp1_dl_list *vsp1_dl_list_alloc(struct vsp1_dl_manager *dlm)
 
 	/* Get a default body for our list. */
 	dl->body0 = vsp1_dl_body_get(dlm->pool);
-	if (!dl->body0)
+	if (!dl->body0) {
+		kfree(dl);
 		return NULL;
+	}
 
 	header_offset = dl->body0->max_entries * sizeof(*dl->body0->entries);
 
-- 
2.20.1


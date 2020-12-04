Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F43C1B0D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Dec 2020 17:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979BF22B3B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Dec 2020 17:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388525AbgLDRFx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 12:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388509AbgLDRFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 12:05:52 -0500
Received: from latitanza.investici.org (latitanza.investici.org [IPv6:2001:888:2000:56::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2F2C061A51
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Dec 2020 09:05:11 -0800 (PST)
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4CnfFR4tBCz8shv;
        Fri,  4 Dec 2020 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
        s=stigmate; t=1607101467;
        bh=2zSLREyUq7ZQ7biojEerXIWmpTslB1rfxKxJGm0Yl/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xa72QKp0aZec20MikUqt2PG25vYmAO/CK7Ss6PIuxp8TZtHa1bxXlMh1e4Lg1yWEk
         SMGdq6KJMiSdwbQ6bGzHHHjfTCiEYEMDSwfqdWZdn1U1zZzp2fV/wHe9WeQKkZMLsb
         cX3iPRGT5WZxXDH3Hkdz5gYScMYd1g3hEPwOHEuk=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: laniel_francis@privacyrequired.com) by localhost (Postfix) with ESMTPSA id 4CnfFQ6VHJz8sfb;
        Fri,  4 Dec 2020 17:04:26 +0000 (UTC)
From:   laniel_francis@privacyrequired.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Francis Laniel <laniel_francis@privacyrequired.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 05/12] renesas: Replace strstarts() by str_has_prefix().
Date:   Fri,  4 Dec 2020 18:03:11 +0100
Message-Id: <20201204170319.20383-6-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Francis Laniel <laniel_francis@privacyrequired.com>

The two functions indicates if a string begins with a given prefix.
The only difference is that strstarts() returns a bool while str_has_prefix()
returns the length of the prefix if the string begins with it or 0 otherwise.

Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index fe86a3e67757..3f9972165afa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1016,7 +1016,7 @@ static int rcar_du_crtc_parse_crc_source(struct rcar_du_crtc *rcrtc,
 	} else if (!strcmp(source_name, "auto")) {
 		*source = VSP1_DU_CRC_OUTPUT;
 		return 0;
-	} else if (strstarts(source_name, "plane")) {
+	} else if (str_has_prefix(source_name, "plane")) {
 		unsigned int i;
 
 		*source = VSP1_DU_CRC_PLANE;
-- 
2.20.1


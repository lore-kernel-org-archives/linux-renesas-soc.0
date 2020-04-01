Return-Path: <SRS0=ZyEX=5R=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D71C43331
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Apr 2020 06:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E834C2077D
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Apr 2020 06:11:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=igel-co-jp.20150623.gappssmtp.com header.i=@igel-co-jp.20150623.gappssmtp.com header.b="l4ubtL/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgDAGLk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Apr 2020 02:11:40 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39227 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAGLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Apr 2020 02:11:39 -0400
Received: by mail-pl1-f194.google.com with SMTP id k18so4388384pll.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2020 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=JayHWFzs8K9spXx+a+w0iimVf8NsVIwUpkN4OO5nc2s=;
        b=l4ubtL/84hAJ4uKzle0u/iYkeZ0ZvAmMOJpWmC0/xNYc3JbrrzJc3UYf7rGXSXHWQo
         11AI8YIMjrsNv1VynR/WoizloRJj67r5dlg7OQnEUkWz+1eQEckb8fBzbZc0ZzkyKmIG
         c5yyFpZWGxFBg8t8fvUVRKDY/umApsS4fiMp9+5x1DDXHnku6x2RihlP8VHf0RWbbLqf
         CQ4GWnyeRBr1xJVQDY03rLo9VHjKY7EMy6XIEdCMqbAVqdgsAX8G2MnMms2FWJ5wsDEh
         kDo3mvijce9aPaasrgAEw8FXU2N1saSf8ogPHMZYRK4bOOrbCPFyUWxRInO0qAWxhxJt
         91sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JayHWFzs8K9spXx+a+w0iimVf8NsVIwUpkN4OO5nc2s=;
        b=cZQP+0788dwpMlt/e5JXw/9acllOyJ/UauwAphUAeBfR6cOKkO0rAgfIYUS67u2YvG
         bIwavjeySv7gGS6V9vTzKZqiWp4ToTr9itk40TTjvDNKLM1VFNjDXmPf9ve505FupTQX
         g1+1losef9isuiJmxy1aEf/NB/W6okR2T6xsCAOpRLUzFDBR7llaLjF+gtYPUCLogbJM
         tj86Un1LM7Kt5kxC4uAKDKaSkBMnccZ6dddzG6Px00EdU3bpzxJ9MYzZWv53DA+hdsuH
         zyYi0sPfnsFeEJcgSSgpOQWMh11bOrOSXcPrs4Ya32QaZfd1ar7QNb3whDFISXQj/NFT
         uj3w==
X-Gm-Message-State: AGi0PuZ+hICFBucMQ+KoezatmHPuUx61aDdoW81SeXu3xZEsW9rZ6UWK
        KnxKmBn+OPEjqsS7pcQXB+iyLm8jTiI=
X-Google-Smtp-Source: APiQypIxE6aeadAHIzMVO/9nXk413wD3Iz9wt0n9bGgn+dVdpet53CJcTJJ7aQ6bhjDrKDnjNynO+A==
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr12289110pls.324.1585721498537;
        Tue, 31 Mar 2020 23:11:38 -0700 (PDT)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id l22sm743148pjq.15.2020.03.31.23.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 23:11:37 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Tomohito Esaki <etom@igel.co.jp>
Subject: [PATCH] drm: rcar-du: Set primary plane zpos immutably at initializing
Date:   Wed,  1 Apr 2020 15:11:00 +0900
Message-Id: <20200401061100.7379-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to drm_plane_create_zpos_property() function documentation,
all planes zpos range should be set if zpos property is supported.
However, the rcar-du driver didn't set primary plane zpos range. Since
the primary plane's zpos is fixed, set i immutably.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 5 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index c6430027169f..9a499be45c45 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -785,8 +785,11 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 
 		drm_plane_create_alpha_property(&plane->plane);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			drm_plane_create_zpos_immutable_property(&plane->plane,
+								 0);
 			continue;
+		}
 
 		drm_object_attach_property(&plane->plane.base,
 					   rcdu->props.colorkey,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 5e4faf258c31..382b720edc09 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -392,8 +392,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_vsp_plane_helper_funcs);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			drm_plane_create_zpos_immutable_property(&plane->plane,
+								 0);
 			continue;
+		}
 
 		drm_plane_create_alpha_property(&plane->plane);
 		drm_plane_create_zpos_property(&plane->plane, 1, 1,
-- 
2.17.1


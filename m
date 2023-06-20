Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F117EB64DB
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Jun 2023 12:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjFTMMK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 20 Jun 2023 08:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjFTMMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 08:12:06 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD17C6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 05:12:06 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B9B15218B8;
        Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687263124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=klSNIOMbt2VL2IyeeNqCr1hM5B19djKU9H3/vvK7FQg=;
        b=2NI7rDj5mjvU+SS+6fB9z3ssN41PLgFpMEGRPkW2+zlQJtWldsxvxtDrgKUVocLZ7i8xPI
        eRh/SCE4gO8snzDKtnC8/KqUgaX/ZunztIL23NX1Q13QalikGJGjc9w7R0lIZyEAiTHC8Z
        shTIWn0/7cKK4cI6ckdxaOvBflWgnFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687263124;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=klSNIOMbt2VL2IyeeNqCr1hM5B19djKU9H3/vvK7FQg=;
        b=yjTBhDw2CJ+t5LUSt0Vo4hm+neJ2kNNiHAsydeV2D87o9qlkRS4NTFWIz0Cn7ie7+8sBHj
        4H1ImVdQLmaZNEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 659DE133A9;
        Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8prYF5SXkWSwEQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:04 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/gem-dma: Remove unnecessary calls
Date:   Tue, 20 Jun 2023 14:03:20 +0200
Message-ID: <20230620121202.28263-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove rockchip's dependency on GEM DMA helpers. Rework the GEM DMA
interface to fit the needs of rcar-du.

This intends to be a cleanup with no functional changes. With the
patches merged, a later patchset can attempt to generate some of the
boiler-plate code for struct drm_gem_object_funcs automatically.

Thomas Zimmermann (3):
  drm/rcar-du: Import buffers with GEM DMA's helpers
  drm/rockchip: Resolve dependency in GEM DMA helpers
  drm/gem-dma: Unexport drm_gem_dma_vm_ops

 drivers/gpu/drm/drm_gem_dma_helper.c          | 16 ++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 +++----------------
 drivers/gpu/drm/rockchip/Kconfig              |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  8 +++--
 include/drm/drm_gem_dma_helper.h              |  5 +--
 6 files changed, 22 insertions(+), 43 deletions(-)


base-commit: 32e260cd0d16cee6f33e747679f168d63ea54bf6
-- 
2.41.0


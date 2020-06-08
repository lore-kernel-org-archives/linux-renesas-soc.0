Return-Path: <SRS0=5Okl=7V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BDCC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Jun 2020 03:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 823202075A
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Jun 2020 03:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591585241;
	bh=KA0h8uSgwRg/oIXbbGNpTwsIq4K93/vhOelnMVaVskI=;
	h=Subject:From:Date:To:List-ID:From;
	b=2raXroGc/H43qYLRw5sTZCFSlUarf0i0mnakgtdAqt7VnLSTiEcFAMRFwymEbVXXW
	 qeaPW/cCh8urz00LkRcuWyNd6UifRt8/BBZyp9QA03AzW64yaDyoSAzFo6tuQOiSUK
	 4cdnYPU/uNIiBTjtzaOnTTZIwrDhQQnmsMh5G6K8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgFHDAl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 7 Jun 2020 23:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbgFHDAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 23:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591585240;
        bh=KA0h8uSgwRg/oIXbbGNpTwsIq4K93/vhOelnMVaVskI=;
        h=Subject:From:Date:To:From;
        b=BbBilz2R/ATFzZFkKleChZ28sHcG9R36cO5uoHsRADyxgLd5FcVBK9Jh35RtyA+UC
         zT+ELfcRI/swv3UfCpV0WXn0qWZDcy8Qb9rkQCyvC6D9mEXXbReEDt9N00muX2ufRD
         bBdDB23QYfBQvy0H+dNO1VeRJlT1AYzHOvVdSjzY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159158524072.11889.18399879086713222366.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 08 Jun 2020 03:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM (2020-06-08T02:53:40)
  Superseding: [v1] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM (2020-06-08T01:48:18):
    drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

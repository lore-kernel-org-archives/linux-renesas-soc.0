Return-Path: <SRS0=aevT=3E=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C94C33CB2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jan 2020 13:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8DE124679
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jan 2020 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579094435;
	bh=lMSBC8LNv7xDWw6qoeDJWD/lmlTrgLKlUIQDGpfWRU8=;
	h=Subject:From:Date:To:List-ID:From;
	b=D08nsunP1UoCRv3KWo4TydnPth1Qx/PVa+f2kdyfE5333J4LF1HWMznkhn6cRFyoT
	 sYBtUv+DbP6KTh1Syqv7KToJWfQxr5ylSbzZ7370WkDkN/+b+NqXMIkSCupbkwRbfk
	 e46UKU107F3YsrlK/H/a2BMVSwT00MYeGVqN/xHo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAONUf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 Jan 2020 08:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:60112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgAONUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 08:20:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579094434;
        bh=lMSBC8LNv7xDWw6qoeDJWD/lmlTrgLKlUIQDGpfWRU8=;
        h=Subject:From:Date:To:From;
        b=dDWkOVbIt1PkG3nkitqswMtFB4LfM3wGHzX0rTetKVzoVqOpCF6olIcSE/ZpEKj0s
         GCJC/VkxGuNMfTsSLO1o++8lIkiPUH31MFnEjv5FmGvy+tDV0U3dWwel4Iq0mJadav
         BzKRJLMAJYX4gQXbhLxPQui2i3lNXBt9HYODsfTY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157909443481.7556.7296715268043715147.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jan 2020 13:20:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] mtd: maps: physmap: Add minimal Runtime PM support (2020-01-15T13:13:23)
  Superseding: [v1] mtd: maps: physmap: Add minimal Runtime PM support (2019-12-09T13:48:23):
    mtd: maps: physmap: Add minimal Runtime PM support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

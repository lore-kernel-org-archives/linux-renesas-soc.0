Return-Path: <SRS0=94ze=AM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC459C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Jul 2020 10:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAF5A20747
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Jul 2020 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593597646;
	bh=2bEFVUl5uxYufynwLPaUbs8KEZ23X/RfCECRtbkY+rI=;
	h=Subject:From:Date:To:List-ID:From;
	b=gLuPP8nBJiGUzmO+Q10pcPqOQhBcBIkABKYYmnN1eI+T+BaO/par6QOiloghYoYC5
	 45eR5z+V3qZ9vR6f8dAcfbFfpbWymo5GBGQfTiRpewFGMfuzp5kHDs/G7XV7JUn2NL
	 1ykoKndUEKfYoXmRy1sJv+eOWXtTVsscvFJRoKZ8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgGAKAq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Jul 2020 06:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgGAKAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 06:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593597646;
        bh=2bEFVUl5uxYufynwLPaUbs8KEZ23X/RfCECRtbkY+rI=;
        h=Subject:From:Date:To:From;
        b=Ad8fW1rlZgh5lTl/RCS0Al+Nha7k1+7gUVHKArjS4O4E0OLaKIot0Wx0wpWQWz1ek
         GcQzlZoytnDN2sSDTXr8ex70fP+EkF1fxdrgOAnHQOYzLbJ1xj8qSQj4/HRIaulycL
         TiYcGCIsVYmGDIaYVewd3nRS/miRold++xvsVorA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159359764618.18888.16016708546359247684.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 01 Jul 2020 10:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v9] media: rcar-csi2: Correct the selection of hsfreqrange (2020-07-01T09:52:59)
  Superseding: [v8] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-18T10:34:31):
    [v8,1/3] media: rcar-csi2: Correct the selection of hsfreqrange
    [v8,2/3] media: rcar-csi2: Add warning for PHY speed less than minimum
    [v8,3/3] media: rcar-csi2: Optimize the selection PHTW register


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

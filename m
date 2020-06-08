Return-Path: <SRS0=5Okl=7V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A9DC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Jun 2020 03:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E3D2067B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Jun 2020 03:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591587641;
	bh=ysDWPkTOj6HUglcJMe7yXtFBpvFu/5Rg1jdGNbJrMtw=;
	h=Subject:From:Date:To:List-ID:From;
	b=UPEWJ1offhETrB6SQFxoqog5ZdnO+zwBEVWLQ2A2aSind6lyT4dOX5llSfHgUS/Bb
	 wI0gcSRQ3zQvZCGuMePZcLuxwGwV9DMw/9kDhFrxa0reGcwPyisdpY5TySnN7XpWHU
	 LwVvRd526EsHfRh3/WxsEXFnWd7Aal8XsOt/xaGQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgFHDkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 7 Jun 2020 23:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgFHDkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 23:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591587640;
        bh=ysDWPkTOj6HUglcJMe7yXtFBpvFu/5Rg1jdGNbJrMtw=;
        h=Subject:From:Date:To:From;
        b=czpgpOzdqRJaFgjzaIla+36txBBxKBZsLJWxLwecN1K4MJ8R/LIe2+tveIjjQOMsz
         kHgiTPRndNPsOcBLgut77lasp7aleNTy9iLh7yuzI9hLLPsUq1oaFNK1kehFEbU/Ws
         VvMJisU8zxtx3XZFifnzEqkm1jbVEJcDXruXGi+w=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159158764090.21438.8674175641101324853.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 08 Jun 2020 03:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-08T03:25:03)
  Superseding: [v5] media: rcar-csi2: Correct the selection of hsfreqrange (2020-04-30T06:03:10):
    [v5] media: rcar-csi2: Correct the selection of hsfreqrange


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

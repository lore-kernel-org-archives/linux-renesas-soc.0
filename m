Return-Path: <SRS0=2rCm=77=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A44C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Jun 2020 10:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32AA220706
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Jun 2020 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592476842;
	bh=tnLV4cWRX5YEGWTVOLajZ0lYwi+l0BGBA/f/HKkwObE=;
	h=Subject:From:Date:To:List-ID:From;
	b=oT/mU0OR7FwjwCexQJCf7TCjs+/u435xS98pYhE66HoIgbTMdPXFe9kcuktr+947G
	 SrMNvEj7EPbncrw/j+oOiXe+MmfMdbWMbNU4yHSGMBmO32NLWN7biN3y+V7VsbDSG4
	 iVvsmuUkgxXuZR4IQFNNgtOSeKpvyl5RItytsd8c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgFRKkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Jun 2020 06:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728760AbgFRKkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 06:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592476840;
        bh=tnLV4cWRX5YEGWTVOLajZ0lYwi+l0BGBA/f/HKkwObE=;
        h=Subject:From:Date:To:From;
        b=SYboPpm/NFRbX2u7jRU9jN3mwYAxuecS1uNd/ixMCIWiUK3tb/XZrNPfY1OWXMZy/
         BG+wcTrh9pQAUVgQcDevZ5symp6Syv9e5usbDLSLSLX1fMiPq6yYM24ppMt68cR8fC
         JjvwtK6S9dYdU3WfkwA/rbmO6GyWRciMNxvj13ec=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159247684069.27445.5450928625452394459.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 18 Jun 2020 10:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v8] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-18T10:34:31)
  Superseding: [v7] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-17T04:57:22):
    [v7,1/2] media: rcar-csi2: Correct the selection of hsfreqrange
    [v7,2/2] media: rcar-csi2: Add warning for PHY speed less than minimum


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

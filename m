Return-Path: <SRS0=JlV5=CU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF97C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 07:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252C82073E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599808854;
	bh=xf+8bzXSVb0vKe2yrpG3nJ5x1DuxRnlTeoADLkKUEcc=;
	h=Subject:From:Date:To:List-ID:From;
	b=OYK0hQeBXnHlL/Tz7McgEN/pbm9ha2oS7E0NC7Bj5PQKlqV7/9MOrvYIvQKcvSdSZ
	 lx5hymFL4altO4PLJa8ZtLCx7/17mP5jk6V+tLFbKfBEOApVM4mLN39HVAq5tnOewH
	 L7oiGGE9/W2wvNUN8m3aOVxy7SX7a7c+3hTxwg9Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKHUw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 03:20:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgIKHUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:20:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599808848;
        bh=xf+8bzXSVb0vKe2yrpG3nJ5x1DuxRnlTeoADLkKUEcc=;
        h=Subject:From:Date:To:From;
        b=IK8vRBsqOf4LCvTG+q1aBdmcn1N0bxxEGVamz0uDvjW0kytWTS4fvmaXHTuOf0hJg
         2Xt3wh+RqotxPq9ka170FF+XT8Yd8Q9Q4iTKLywnyCW87Lf9tkUVAbQfjvdToVOjvz
         MzmX/n1Rnpsq/sKN2cSXk3Wgc6JPL4Q6krXjglVk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159980884851.31954.2254976681479549298.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 11 Sep 2020 07:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] i2c: add slave testunit driver (2020-09-11T07:16:57)
  Superseding: [v1] i2c: add slave testunit driver (2020-06-29T18:53:18):
    [RFC,1/1] i2c: add slave testunit driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

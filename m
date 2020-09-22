Return-Path: <SRS0=Wq11=C7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9DEC4727C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Sep 2020 16:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBF9820672
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Sep 2020 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600790449;
	bh=uUxNn+4sXGhDhPsVAEBdY07D/f2kUwh1bi6XMQhrcSk=;
	h=Subject:From:Date:To:List-ID:From;
	b=mz2h+nBAqujLYV9r01XPEbNFbXCzhPyrxGsH4VZzZaU0uGtoEFp9mWoGzyKaHUKZl
	 Zjy4bO5mEwLVtR3FMsSdGtGQ68jW5ql0V2CnOtDwIE1sFN2PDpmztLA+XpLMc/LG70
	 ibM8N2yWmPG6N5gUhUZAhgNlshxijTMiOA1hejFY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIVQAq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 12:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIVQAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 12:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600790446;
        bh=uUxNn+4sXGhDhPsVAEBdY07D/f2kUwh1bi6XMQhrcSk=;
        h=Subject:From:Date:To:From;
        b=LaiJSW4wW7j/l/Ry5km8tDOqplmR1D2lZUVAZIxR7PVJRfefGB88J2mTpmG/xnroV
         kpkU9mIYA3flOtJbVTNSGNOjseYSEP9ziPlb8fjg5wtOE5JomdFSBnCGROgJPERzIp
         SHegG4e+3qUuf/esr89Km48zIeEDHB2m/Tp2cNX0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160079044618.15521.6124054881546226208.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 22 Sep 2020 16:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] i2c: sh_mobile: implement atomic transfers (2020-09-22T15:49:43)
  Superseding: [v2] i2c: sh_mobile: implement atomic transfers (2020-06-18T15:05:32):
    [v2] i2c: sh_mobile: implement atomic transfers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

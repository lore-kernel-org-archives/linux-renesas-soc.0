Return-Path: <SRS0=rLoD=3Y=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEDAC3524D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  4 Feb 2020 18:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A46F12084E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  4 Feb 2020 18:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580839237;
	bh=siHOL6TG4qR37i3T25ITIDrQqmtAcKiLyJgyb4WVDSs=;
	h=Subject:From:Date:To:List-ID:From;
	b=kz5EBXAOp6hOPgA3gPpyvFFhEvn0Z14xrkgb4RQrgr8omdHhvn8I+VQpgxPidiiGV
	 OJnoswb9pAo7+AItW9SgsiII5ri26Qr7yejTChStWaGgfhRwDFoJVSjVAvj91S+BC3
	 uFz2ItUD+IHwY6BsWj1YgcY0smIGu/XYClTBmFNg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgBDSAh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 4 Feb 2020 13:00:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727369AbgBDSAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 13:00:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580839236;
        bh=siHOL6TG4qR37i3T25ITIDrQqmtAcKiLyJgyb4WVDSs=;
        h=Subject:From:Date:To:From;
        b=MRsullGn3nUhLk6Lop8tWb3bEjZlFf1YqH8e9eWhBPM5NLLwWInXIaDjdA49jgh6J
         IbYF4+ktkiqGsKgi7ggbc4CJroJ0wr5kCtssi8ZWtrsCafCakJ4Bkh02taw9GI2MTQ
         +QrjDEVuneuO2IRgLDlMWVQJGfCx9o6+otecFFIU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158083923691.5843.5282060353208755286.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 04 Feb 2020 18:00:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-02-04T17:44:13)
  Superseding: [v2] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-01-30T17:06:34):
    [v2] USB: hub: Fix the broken detection of USB3 device in SMSC hub


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

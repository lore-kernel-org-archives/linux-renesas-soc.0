Return-Path: <SRS0=a51t=5J=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA19EC43331
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Mar 2020 14:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF34B205ED
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Mar 2020 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585058442;
	bh=9+vjlzxOfuyZ+dGEo93ulsoBuMrn8hwyMJ4EGLE6k1w=;
	h=Subject:From:Date:To:List-ID:From;
	b=03th56zHrmDdmnF1sJg1p0cJdiBWYeA3aKR5X7K+YlRn8JQXrxMOG1Lu+DZkm7u29
	 a1Q8pvq8jF3+No+Mf+eZ4gW2R+akgoze3Eo5W83J2CQCXpwFBwwRmxVJciAeLHf7VR
	 Jf3Ir5kLrJWz1bGxzs0FZPnjdKkPpKMZF4mHO+t0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgCXOAm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 24 Mar 2020 10:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbgCXOAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Mar 2020 10:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585058442;
        bh=9+vjlzxOfuyZ+dGEo93ulsoBuMrn8hwyMJ4EGLE6k1w=;
        h=Subject:From:Date:To:From;
        b=0OUTRApgtF5rxKapmH78kZfN2hij+sTrkmyCdSCUYEHdhA4j01PgATRVfkCxx6Vty
         cUwaWlQz/5HBA8bzaFJBSdZj3TLpueFg2Nub1f2Nc/lcyE5Qw+8lqC0sYzDrmDkOuK
         zZ/5PCyIUd76hpXpSsc7wcKPvGHyy5/7S+G4G9Nk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158505844196.20961.3213519801357647857.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 24 Mar 2020 14:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] gpio: Add GPIO Aggregator (2020-03-24T13:53:28)
  Superseding: [v5] gpio: Add GPIO Aggregator (2020-02-18T15:18:12):
    [v5,1/5] gpiolib: Add support for gpiochipN-based table lookup
    [v5,2/5] gpiolib: Add support for GPIO line table lookup
    [v5,3/5] gpio: Add GPIO Aggregator
    [v5,4/5] docs: gpio: Add GPIO Aggregator documentation
    [v5,5/5] MAINTAINERS: Add GPIO Aggregator section


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

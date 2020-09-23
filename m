Return-Path: <SRS0=2LD/=DA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91626C2D0A8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Sep 2020 11:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49FEA20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Sep 2020 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600861246;
	bh=eA+lA49ZMljfbAfurGBByJdKtm71R+Gd7fN20Cm9ays=;
	h=Subject:From:Date:To:List-ID:From;
	b=aWk6fOAiVDFivY5HpKimTLxOKkvjd1IZk90OLtK75HGWpBB7XQEYsvbB+0btrvgwK
	 BPKf6rUnojqdhQ3zraOuAGGjzXpsBt4kOAwpzKUq2XmvGkyRqscfzBGhMKa25FmHDJ
	 NW19gjQBd8UvDDozQxRI0m+WWn7dztSJpwa9fRbo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWLkq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Sep 2020 07:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgIWLkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 07:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600861245;
        bh=eA+lA49ZMljfbAfurGBByJdKtm71R+Gd7fN20Cm9ays=;
        h=Subject:From:Date:To:From;
        b=usyo0f6eftbXN7uivOcL4Uad66vVaIJ0xIBLSTzY7Cks71AbrPDPu7rJ9n6AlVUvc
         A/GLEPg5EHW1CmAD1QhnpPdUFWUu/6ibc/4efuBDWlLgySZkKz90yduwkgtdT0PMMw
         ofWiGzOowZAtRXMUmgItBn6WxGTl1sKbcekMX8R4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160086124559.18822.16109843443087340799.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 23 Sep 2020 11:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-09-23T11:31:42)
  Superseding: [v1] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-09-23T08:44:58):
    soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

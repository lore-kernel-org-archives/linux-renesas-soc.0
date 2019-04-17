Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5432C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B88FC204EC
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbfDQP6g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:58:36 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQP6g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:58:36 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4DFDA25AEB0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Apr 2019 01:58:34 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 33B98940B0E; Wed, 17 Apr 2019 17:58:32 +0200 (CEST)
Date:   Wed, 17 Apr 2019 17:58:32 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [ANNOUNCE] Renesas tree closed for v5.2
Message-ID: <20190417155822.ftjhqzsr3ov343ja@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organisation: Horms Solutions Ltd.
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

I would like to stop accepting non-bug-fix patches for v5.2 and get
the last pull requests posted by the end of this week. This is in order
for them to be sent before the release of v5.1-rc6, the deadline set by the
ARM SoC maintainers.  As patches should ideally progress from the renesas
tree into linux-next before sending pull requests there is a few days lead
time involved.

I have tried to accept all patches that I felt were ready, but I did feel
that those currently marked as under review on patchwork need a bit more
time, if only for review by people other than myself.

I intend to begin queueing up patches for v5.3 as they are ready.


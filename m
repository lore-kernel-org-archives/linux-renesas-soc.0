Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC75EC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 09:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 926BE20693
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 09:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfDOJCS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 05:02:18 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:43234 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfDOJCS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 05:02:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B67F425AD78
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Apr 2019 19:02:16 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AC6839403F0; Mon, 15 Apr 2019 11:02:14 +0200 (CEST)
Date:   Mon, 15 Apr 2019 11:02:14 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [ANNOUNCE] Renesas tree closing for v5.2
Message-ID: <20190415090214.yasjvl2dlefv63wm@verge.net.au>
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

I would like to stop accepting non-bug-fix patches for v5.2 on Wednesday
17th April (this week) and get the last pull requests posted by the end of
next week.  This is in order for them to be sent before the release of
v5.1-rc6, the deadline set by the ARM SoC maintainers.  As patches should
ideally progress from the renesas tree into linux-next before sending pull
requests there is a few days lead time involved.

Once the tree has closed for v5.2 I intend to begin queueing up patches
for v5.3 as they are ready.

Happy hacking!

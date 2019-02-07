Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9529C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FD7421872
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Sp23pt5N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfBGKpV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:45:21 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53922 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfBGKpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:45:21 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BC8A725B7E2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Feb 2019 21:45:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549536319; bh=72qpUGnSDCRv5II6K89D/z083NjU+Fs7ZkUloByE2FI=;
        h=Date:From:To:Subject:From;
        b=Sp23pt5NrSnwwTWzNDtwjwd4UcIKmr18skjD455y+L39hTx48CNaSHFLe8xB0mR/P
         o5GnO1plMlhIO7+8Feizh/TGbxZKn2tO3YA+XIKo1bEoroRZMvvIhZeTnYONfR4ZuG
         gRDBcH8CilWv10QhFthb1JLID9/lGXue/gM2lE2s=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 126209444BE; Thu,  7 Feb 2019 11:45:17 +0100 (CET)
Date:   Thu, 7 Feb 2019 11:45:16 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [ANNOUNCE] Renesas tree closed for v5.1
Message-ID: <20190207104515.hruwywlpuowawxol@verge.net.au>
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

I would like to stop accepting non-bug-fix patches for v5.1 and get
the last pull requests posted by the end of this week. This is in order
for them to be sent before the release of v5.0-rc6, the deadline set by the
ARM SoC maintainers.  As patches should ideally progress from the renesas
tree into linux-next before sending pull requests there is a few days lead
time involved.

I intend to begin queueing up patches for v5.2 as they are ready.

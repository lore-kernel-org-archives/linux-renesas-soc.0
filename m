Return-Path: <SRS0=3RBk=BB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF924C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Jul 2020 03:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5A3720714
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Jul 2020 03:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595389241;
	bh=RHaf8W9vLHd4vZ2C1NagFKca3JSJHLsYv4BfSsbW25M=;
	h=Subject:From:Date:To:List-ID:From;
	b=Bh0cuivA7YzFo2I6wIzJ4UJDuP0kOxx1q/bZOQuJCYhmx/It67XqY4z4fNx7QrZxU
	 oyksL6XEPiU0tuW7bIQ4W9XrTuDYW2m9ckVaY3fgo58Bhud2UQ3TtEiVMwrpO+5sml
	 UTb/OgbvTx3H/FiwbvHvnYK2N0DE3pYWjmzPxV6A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbgGVDkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 21 Jul 2020 23:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731793AbgGVDkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jul 2020 23:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595389241;
        bh=RHaf8W9vLHd4vZ2C1NagFKca3JSJHLsYv4BfSsbW25M=;
        h=Subject:From:Date:To:From;
        b=niTlzv5mmGmLKIvcVhF0m7BVSEWJlPLE92/9rTRN77ijmaCyt3bBLUenWneMt7eQh
         C0y1TgyEt9Ni/ln75jyw8gRDKEKv8abrrGt9K8w2IvlXJaRuuDnW96rjIp6TpHvlyu
         6AWOqPQOaNVl7+lZxHoXvkoF761VdLErwKVjgfgw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159538924108.17625.14138572433200334980.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 22 Jul 2020 03:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] PCI: rcar-gen2: Use fallthrough pseudo-keyword (2020-07-22T03:28:51)
  Superseding: [v1] PCI: rcar-gen2: Use fallthrough pseudo-keyword (2020-07-16T21:15:17):
    [next] PCI: rcar-gen2: Use fallthrough pseudo-keyword


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

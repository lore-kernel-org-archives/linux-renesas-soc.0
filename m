Return-Path: <SRS0=yEp9=AR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F613C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 08:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E0C2053B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594023639;
	bh=GtEhzda4sVnjwROyb/261hSkeVFZ7MRi7+VL2tEmK9M=;
	h=Subject:From:Date:To:List-ID:From;
	b=NzdPx96TUBP1NwARg45cwJO/ksA08udnbYJGdwALP1ow/jt72jb/x9IXiu5qNO/2P
	 S9JQyfa1Q7Z+Ufyo/6u5I2KYVHQiQ3XNkDswpGuBiLBoJjy4c1GSxNpB4TGxVfnmg7
	 h7jL+L2Wq7/aiI3DLbRdZCmPwsHSlb0p2gFLh+Cc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgGFIUi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 6 Jul 2020 04:20:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:39348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbgGFIUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 04:20:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594023638;
        bh=GtEhzda4sVnjwROyb/261hSkeVFZ7MRi7+VL2tEmK9M=;
        h=Subject:From:Date:To:From;
        b=EXqv75f0KNk5UW6YlgxnpCwkvC/ZwhCENFd5Sug6O3UxDU/C++cDz3AeNr+Qk1gzY
         vwB+4pAfqxHMBU7yv8SIKRya/Qj80zl+7E96SpdncSkzifpTumOk5YMMbygLe3diUo
         7oo5lFpoO0xI3M44zwV1mQaoJ1l06Z64uFP+F5tw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159402363837.12097.5328297408879588997.git-patchwork-summary@kernel.org>
Date:   Mon, 06 Jul 2020 08:20:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v4] thermal: rcar_gen3_thermal: Fix undefined temperature if negative
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=308333
  Link: <1593085099-2057-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94FDC433DB
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Jan 2021 10:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7288C2222F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Jan 2021 10:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388505AbhARKok (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Jan 2021 05:44:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:34320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388850AbhARJbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 04:31:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1DFAC20780
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610962233;
        bh=X98plq10wWh0Wu5g/OZMUfJ3PBajVrsyhUwPbPTcZPI=;
        h=Subject:From:Date:To:From;
        b=XDX/OWlfUyatTlQBPbR1CUQmrXGGTjLZu+Pevf4sgcZJFqWcR6IVUiZ/rpVwqtmqv
         0IEMTAbdfgLJyYet3AvDa5BOyJJBaFkVck0xz6C+1HQty6bnFBgvCmJ5vw2UjXLW99
         x6X0k7HMG+P44s8QpPBHQzXDqCwQ+L+MUBuhtFFwvjbdikPqyYWCdT9bhcXA69Sdcv
         UhZOymbm6YHH4o1LGh/RFnyi3fmI+BXEfqyyMFRXu0rkCQpNTJ5kAaclKbRRY40KNR
         espxbi94jLjGvluSfe4Iy4vdX7WOvERnMNprgwRkC+Rc8gnqYdPgXU9Z74GGPS1ZTD
         gTcojonfS49QQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161096223295.16367.224542575282817769.git-patchwork-summary@kernel.org>
Date:   Mon, 18 Jan 2021 09:30:32 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [v2] arm64: dts: renesas: r8a779a0: Add MSIOF device nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=411173
  Lore link: https://lore.kernel.org/r/20210108104345.2026857-1-geert+renesas@glider.be

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



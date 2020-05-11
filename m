Return-Path: <SRS0=JaFY=6Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671C3C47255
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 May 2020 09:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DB022075E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 May 2020 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589187635;
	bh=l0pxqtfM20XmlMRY+3rV0OkP/WcFl1da+w98+j3OuD8=;
	h=Subject:From:Date:To:List-ID:From;
	b=U1hAneHtgBkxROONP8dvxnuAf0OQlx1CUm/PsnQ4KPOHInPXqTNZjTIh5Xl3Ck3xN
	 gWFGr2gtnzbE/IImEZAsfkYO0tH4FG1Qv/KM4og1uQuHD4EyIz9WKPjI3LvlIoPfNB
	 zC6xz7xakBaLDEQVrsv4y3rgIgaS4Q/sWxhQAVTY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgEKJAf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 May 2020 05:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:50874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbgEKJAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 05:00:34 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589187634;
        bh=l0pxqtfM20XmlMRY+3rV0OkP/WcFl1da+w98+j3OuD8=;
        h=Subject:From:Date:To:From;
        b=2mqJacWyJSdwC6+QInVxVyT+dcrR53WnkODuplM6pQbW8V5W+FCZLxs5XWTzTY9kj
         dxyuTzWy8e11u7jOwnZtFTCk3pxP2tDLI+NNzClolXXy4BeapTJ+0d/GhVvPJbFxLu
         NYtoEygNd0c+xyj2SmgLMPeo4usI9qI0KMm83Vzg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158918763460.24333.13741259512839955890.git-patchwork-summary@kernel.org>
Date:   Mon, 11 May 2020 09:00:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: r8a7740: Add missing extal2 to CPG node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=284675
  Link: <20200508095918.6061-1-geert+renesas@glider.be>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

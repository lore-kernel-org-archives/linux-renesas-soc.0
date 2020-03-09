Return-Path: <SRS0=k1k+=42=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A959C10F27
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Mar 2020 09:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4164D20674
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Mar 2020 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583745637;
	bh=n/wqyh8gYzeCA7CAXdMLBj0MShhKDLOfzStkyNhFacw=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=JEPRwb72XkfeVGj5ffUnfmyJwQyJk2gbJYGB3aZ+ZLUhmlndyGuwDSVcTisy7Bxhz
	 Ad+gM0ogMcwQDNo1ikKMS7pTuSAo+CMmh5z8vs2shBo14IY033jYHhgHOV9l1OEH2V
	 mypUdg8cMxQhEtCX/OK5Vm2sdONtqBDMWE7ZSQB8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCIJUh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 Mar 2020 05:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCIJUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 05:20:36 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583745636;
        bh=n/wqyh8gYzeCA7CAXdMLBj0MShhKDLOfzStkyNhFacw=;
        h=Subject:From:Date:References:To:From;
        b=C/U0IlXfTI5ja0/6wqCGKaO0AHQPrPjAPsUfd4Qg/w6lN+cWPbV6lE8R4ZI+jEu4+
         qq1qRKwLcKA8xX2ppj9Sdx/G3h7VGjSQJH/ZAv2tUSE4bJD4tzaBm7eNrTxucf3qsM
         jCQkjitmqEijlIBjbXVqAyHhyldLu7u70xz/VekA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158374563655.19788.18252023916959855985.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Mar 2020 09:20:36 +0000
References: <20200225183057.31953-1-erosca@de.adit-jv.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v2] usb: hub: Fix unhandled return value of usb_autopm_get_interface()
  Submitter: Eugeniu Rosca <erosca@de.adit-jv.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=247249

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

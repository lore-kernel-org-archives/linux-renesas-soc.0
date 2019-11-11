Return-Path: <SRS0=wY1Z=ZD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F24C43331
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Nov 2019 14:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDA0F206A3
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Nov 2019 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573480834;
	bh=x2s+ZcEnQxQwdlwXph04MpmyTyy/OZUVAkCnGJNoDb4=;
	h=Subject:From:Date:To:List-ID:From;
	b=ZPzdCXzVivVxo4yIUtiTOVUVZ4kPYnqU+uPtASt3Ulum5cYTHPlwkfcnixDS/BZPF
	 AzAs7n84S0LsFcbjSrQ2mM5MUx1GblRvFHketC0CpcEecRKuKozyYNBOuQGm90hLGo
	 g/liuOeyV7pRwyFm4AEF++93Frm63hzNZKGafsgg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKOAe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Nov 2019 09:00:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:55088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbfKKOAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Nov 2019 09:00:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573480833;
        bh=x2s+ZcEnQxQwdlwXph04MpmyTyy/OZUVAkCnGJNoDb4=;
        h=Subject:From:Date:To:From;
        b=uizCoWHP4ViCRWqvL6Rt7FsyLzT8QpTICw4nI9oaxEmRI9EFY36GPDbIHgzLECMv6
         R2tNLutzU/TC4fciFeqQ4VMI4LBbewlENlujUzJpS8y0xmUyDUQVT1cy3xOw8tRo5T
         4sKTTN/at/RlOWhAJkUCYYEKAwgW9wk/v1LzMAXA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157348083395.417.16391370394029843514.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 11 Nov 2019 14:00:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: bindings: video-interfaces: Update the example (2019-11-11T14:00:55)
  Superseding: [v1] media: bindings: video-interfaces: Update the example (2019-08-22T21:04:33):
    media: bindings: video-interfaces: Update the example


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

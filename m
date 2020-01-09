Return-Path: <SRS0=nOGu=26=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0212FC282DD
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Jan 2020 00:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFE9D206F0
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Jan 2020 00:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578530436;
	bh=e2tBk2+IQtwXt6qAPRVj2PTR4cp5GCLKLysUW0GYCOs=;
	h=Subject:From:Date:To:List-ID:From;
	b=ZyLgTiqDJ1kl1bk3sKMPKlE8Z61uLZc2KluwggjuwSft3/4RG8cMy+HrNT9GZ2Po2
	 OdVTBViNZCgdPFPEQGz3aZ3sDcIUOjMCLEY5oh1RrTn4XWe4fxljHKXFdsefJwyD7N
	 UtLBTpfeT6d/O+GoXKjUbssFr8n6xvIhXMuwrZzc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgAIAkg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 8 Jan 2020 19:40:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:55408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgAIAkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 19:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578530436;
        bh=e2tBk2+IQtwXt6qAPRVj2PTR4cp5GCLKLysUW0GYCOs=;
        h=Subject:From:Date:To:From;
        b=NdOr37JYOJNTRmXhfKdadJu280OmK72HxobnUVfpquD7slmTvwaSzDN2wrrgMcetF
         mD5//Ua8GuB3XF269UR6VDTg7+d43OX5cZwO6bMnXClrC4gyT9Pc4mS+lJKEWqPHMb
         wmhy1tkAp7RhvWvAp7HORngvn3I9p8etoh+tJiyk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157853043606.16821.3929164176638847362.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 09 Jan 2020 00:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] sh: clkfwk: remove r8/r16/r32 (2020-01-09T00:28:59)
  Superseding: [v1] sh: clkfwk: remove r8/r16/r32 (2019-12-18T05:19:32):
    sh: clkfwk: remove r8/r16/r32

Latest series: [v1] SH: Convert iounmap() macros to inline functions (2020-01-09T00:30:40)
  Superseding: [v2] SH: Convert iounmap() macros to inline functions (2019-12-17T07:50:36):
    [v2] SH: Convert iounmap() macros to inline functions


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

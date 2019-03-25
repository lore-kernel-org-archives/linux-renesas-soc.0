Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090E6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 20:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D087620879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553544797;
	bh=vkwvOfTuYx/Hnce0dSAadS9au+3QwbM+VeCYL3Z86Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EVzl2SkOPi16YEUxlgDdjkhWVpBhnp603nApWNsEjSflvpgXP9r5+cdn13JRAEIMd
	 /T339gTxlmmF5/mF7/izN7+6JaTMOgYCxNssq7P8ZBMk9IbjdhG0PUf4oRZi2Slyfj
	 9v3VdH+9oi8xUkw3HSjoMlBAB7Kb31jPaDyUivLY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbfCYUNR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 16:13:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729283AbfCYUNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 16:13:17 -0400
Received: from localhost (unknown [218.237.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 529542087C;
        Mon, 25 Mar 2019 20:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553544796;
        bh=vkwvOfTuYx/Hnce0dSAadS9au+3QwbM+VeCYL3Z86Fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WQZWeWqdfmk9q6DiiST8N7VXHATgxLTdKtSIxrxQ+NOfwnS5TnTmAT3LVQNxIQcIw
         COK2IN+gcE544dSuYgxYYMrCuAB9PATpDhNwKH0O73l8Tb7Zx6TlIWVzGBZxJwqSut
         5lfSFpi8iLNido8eOTbyTqZdeiizw8DI9xOam2Ww=
Date:   Tue, 26 Mar 2019 05:10:42 +0900
From:   GregKH <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4.4.y] mmc: tmio_mmc_core: don't claim spurious
 interrupts
Message-ID: <20190325201042.GA28735@kroah.com>
References: <948c139f-aef2-efb9-6b73-c293883ab368@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <948c139f-aef2-efb9-6b73-c293883ab368@cogentembedded.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 24, 2019 at 08:32:12PM +0300, Sergei Shtylyov wrote:
> Commit 5c27ff5db1491a947264d6d4e4cbe43ae6535bae upstream.
> 
> I have encountered an interrupt storm during the eMMC chip probing (and
> the chip finally didn't get detected).  It turned out that U-Boot left
> the DMAC interrupts enabled while the Linux driver  didn't use those.
> The SDHI driver's interrupt handler somehow assumes that, even if an
> SDIO interrupt didn't happen, it should return IRQ_HANDLED.  I think
> that if none of the enabled interrupts happened and got handled, we
> should return IRQ_NONE -- that way the kernel IRQ code recoginizes
> a spurious interrupt and masks it off pretty quickly...
> 
> Fixes: 7729c7a232a9 ("mmc: tmio: Provide separate interrupt handlers")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'linux-4.4.y' branch of the -stable repo.

Now queued up, thanks!

greg k-h

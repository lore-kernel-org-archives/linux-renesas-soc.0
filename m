Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FE8C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D0432087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552896477;
	bh=RRB45Z8cWcknrSbGh8mcpOenSOs/nrWtWoFg8MG4QoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aV8tO19KSsXO2fgArmTh4//MnMVxENBHM7CLS0YTHFJ/Gk0VZh1/Q4CHB5/Fxn0XS
	 2sAUqUq3Lla2x6/HYdyeGFsmRKLX5Nf7iXrqHgpaNXX1obev2CHbLV1fTyaJ8gLure
	 7Lq7DTYLf82dUjg+5Orh6FZsUr4C9PmQgFn0hwl4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfCRIH4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 04:07:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfCRIH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 04:07:56 -0400
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8529420643;
        Mon, 18 Mar 2019 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552896476;
        bh=RRB45Z8cWcknrSbGh8mcpOenSOs/nrWtWoFg8MG4QoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HgHcMEGppGDhxkonZoNQn/D8xz9+b+S1ltuFsHDTcuZC+VAqIm+jk8oEqTXcgLoNn
         yutNj0M2f+vrGPm+qMMmfDtvAS+NJQ913a87XeVjnMkaCjOWLothF3CQuXGSs5uQTG
         0pQiC9cx6MVV3/GsiHgFpYRFKNbeP660eZDYpYSo=
Date:   Mon, 18 Mar 2019 09:07:53 +0100
From:   GregKH <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4.9.y] mmc: tmio_mmc_core: don't claim spurious
 interrupts
Message-ID: <20190318080753.GC4746@kroah.com>
References: <e82bd7bc-3e47-0ac9-ce43-5fb809644f9f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82bd7bc-3e47-0ac9-ce43-5fb809644f9f@cogentembedded.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 17, 2019 at 09:11:31PM +0300, Sergei Shtylyov wrote:
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
> The patch is against the 'linux-4.9.y' branch of the -stable repo.

Now applied, thanks.

greg k-h

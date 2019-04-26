Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631A4C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 10:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41B4B2077B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 10:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfDZKRL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 06:17:11 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47132 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfDZKRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 06:17:11 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6660725AD60;
        Fri, 26 Apr 2019 20:17:09 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 69F679403ED; Fri, 26 Apr 2019 12:17:07 +0200 (CEST)
Date:   Fri, 26 Apr 2019 12:17:07 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] mmc: tmio: add init_card ops
Message-ID: <20190426101706.jt5hmwiwyan7wzbr@verge.net.au>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190426094500.66fg3treuml6v47u@verge.net.au>
 <20190426095600.GE1031@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426095600.GE1031@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 26, 2019 at 11:56:00AM +0200, Wolfram Sang wrote:
> On Fri, Apr 26, 2019 at 11:45:01AM +0200, Simon Horman wrote:
> > On Fri, Apr 26, 2019 at 02:18:48PM +0900, Yoshihiro Shimoda wrote:
> > > Since renesas_sdhi_internal_dmac driver would like to use
> > > the init_card() ops in the future, this patch adds init_card ops
> > > into the struct tmio_mmc_host and struct tmio_mmc_dma_ops.
> > > 
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Don't you think this not needed anymore in context with all the
> refactoring around 2aaa3c5193db ("mmc: tmio, renesas_sdhi: set
> mmc_host_ops hooks directly")?

Yes, true.

Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA01C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A741F208C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfDZJpQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:45:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfDZJpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:45:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B29CD25AEA8;
        Fri, 26 Apr 2019 19:45:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 984959403ED; Fri, 26 Apr 2019 11:45:10 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:45:10 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on IOMMU
Message-ID: <20190426094509.gegxoevxuzht5alq@verge.net.au>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 26, 2019 at 02:18:49PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a condition to avoid memory size limitaion of
> swiotlb if the driver runs on IOMMU.
> 
> Tested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


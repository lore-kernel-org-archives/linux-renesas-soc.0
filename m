Return-Path: <SRS0=cDZa=C3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15A8C43463
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 08:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1FD620C56
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 08:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIRInl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Sep 2020 04:43:41 -0400
Received: from 8bytes.org ([81.169.241.247]:45162 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgIRInl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 04:43:41 -0400
X-Greylist: delayed 322 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 04:43:41 EDT
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 9FC36396; Fri, 18 Sep 2020 10:38:16 +0200 (CEST)
Date:   Fri, 18 Sep 2020 10:38:15 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] iommu: Kconfig: Update help description for IPMMU_VMSA
 config
Message-ID: <20200918083815.GG31590@8bytes.org>
References: <20200911101912.20701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911101912.20701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 11:19:12AM +0100, Lad Prabhakar wrote:
> ipmmu-vmsa driver is also used on Renesas RZ/G{1,2} Soc's, update the
> same to reflect the help description for IPMMU_VMSA config.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  drivers/iommu/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.


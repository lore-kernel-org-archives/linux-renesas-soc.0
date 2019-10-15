Return-Path: <SRS0=Zc5b=YI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59610ECE588
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 10:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37A0F2089C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 10:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731633AbfJOK64 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Oct 2019 06:58:56 -0400
Received: from 8bytes.org ([81.169.241.247]:47410 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731632AbfJOK6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 06:58:55 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 3435A2D9; Tue, 15 Oct 2019 12:58:54 +0200 (CEST)
Date:   Tue, 15 Oct 2019 12:58:52 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     iommu@lists.linux-foundation.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Hook up r8a774b1 DT matching code
Message-ID: <20191015105852.GE14518@8bytes.org>
References: <1569581601-34027-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569581601-34027-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 27, 2019 at 11:53:21AM +0100, Biju Das wrote:
> Support RZ/G2N (R8A774B1) IPMMU.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2
>   * Incorporated Geet's review comment
>   * Added Geert's Reviewed-by tag
> ---
>  drivers/iommu/ipmmu-vmsa.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.


Return-Path: <SRS0=W0u2=XA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BADC3A5A5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 08:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1810620820
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 08:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732802AbfIEIor (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 5 Sep 2019 04:44:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59596 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731772AbfIEIor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 04:44:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7B2F525B753;
        Thu,  5 Sep 2019 18:44:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5FA1B940AC6; Thu,  5 Sep 2019 10:44:43 +0200 (CEST)
Date:   Thu, 5 Sep 2019 10:44:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Move IMTTBCR_SL0_TWOBIT_* to
 restore sort order
Message-ID: <20190905084443.z55xbhijq5ekhkpn@verge.net.au>
References: <20190904120802.2163-1-geert+renesas@glider.be>
 <20190904120802.2163-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904120802.2163-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 02:08:01PM +0200, Geert Uytterhoeven wrote:
> Move the recently added IMTTBCR_SL0_TWOBIT_* definitions up, to make
> sure all IMTTBCR register bit definitions are sorted by decreasing bit
> index.  Add comments to make it clear that they exist on R-Car Gen3
> only.
> 
> Fixes: c295f504fb5a38ab ("iommu/ipmmu-vmsa: Allow two bit SL0")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


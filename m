Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF3FC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1616C206A3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDWKyM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 06:54:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47072 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfDWKyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 06:54:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7904F25AE8B;
        Tue, 23 Apr 2019 20:54:10 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6E0F09403E4; Tue, 23 Apr 2019 12:54:08 +0200 (CEST)
Date:   Tue, 23 Apr 2019 12:54:08 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH] [LOCAL] arm64: defconfig: Enable TDA998X
Message-ID: <20190423105408.cfnnsjzjauffvbfr@verge.net.au>
References: <1555587226-374-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555587226-374-1-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 18, 2019 at 12:33:46PM +0100, Fabrizio Castro wrote:
> The EK874 comes with the TDA1998X chip on board, therefore
> enable TDA998X option.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.

Return-Path: <SRS0=TiSs=UL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BAEC31E46
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Jun 2019 12:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 938F7208C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Jun 2019 12:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406365AbfFLMJr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Jun 2019 08:09:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39264 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404957AbfFLMJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:09:47 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CFBBE25AD60;
        Wed, 12 Jun 2019 22:09:44 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C0F98E21FE5; Wed, 12 Jun 2019 14:09:42 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:09:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: renesas: cat874: Enable USB3.0
 host/peripheral device node
Message-ID: <20190612120942.dsl2oucx5qog63so@verge.net.au>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-7-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-7-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 10:59:59AM +0100, Biju Das wrote:
> This patch enables USB3.0 host/peripheral device node for the cat874
> board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

I have applied this patch for inclusion in v5.3. Please let me know if that
is not desired at this time.

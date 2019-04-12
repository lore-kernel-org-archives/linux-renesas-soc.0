Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660CBC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D3F82077C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfDLMST (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:18:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLMSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:18:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9C16E25AD68;
        Fri, 12 Apr 2019 22:18:16 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9AC279403FF; Fri, 12 Apr 2019 14:18:14 +0200 (CEST)
Date:   Fri, 12 Apr 2019 14:18:14 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V5 08/13] ARM: dts: r8a77470: Add USB PHY DT support
Message-ID: <20190412121814.afhdvycx6axid2j2@verge.net.au>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-9-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554907730-14792-9-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 03:48:45PM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the USB PHY device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied for v5.2.

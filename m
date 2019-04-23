Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286F2C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 11:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 009312077C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 11:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfDWLbN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 07:31:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfDWLbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 07:31:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 59ABB25AE8B;
        Tue, 23 Apr 2019 21:31:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 49B699403E4; Tue, 23 Apr 2019 13:31:09 +0200 (CEST)
Date:   Tue, 23 Apr 2019 13:31:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/6] Add more support to RZ/G2M SoC
Message-ID: <20190423113108.z2hhjgnlezxpairh@verge.net.au>
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 16, 2019 at 04:31:51PM +0100, Biju Das wrote:
> This series adds RZ/G2M SoC dtsi support for DU, VSP, FDP,
> and Tie SYS-DMAC, Audio-DMAC, Ethernet AVB to IPMMU.
> 
> This patchset is based on renesas dev branch.

Thanks Biju,

applied for v5.3 with "renesas:" added to the prefix for the
first two patches.

> 
> Biju Das (6):
>   arm64: dts: r8a774a1: Add VSP instances
>   arm64: dts: r8a774a1: Add DU device to DT
>   arm64: dts: renesas: r8a774a1: Add FDP1 instance
>   arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
>   arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
>   arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB to IPMMU-DS0
> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> -- 
> 2.7.4
> 

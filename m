Return-Path: <SRS0=Vibg=X2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD04C352AA
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 18:16:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47AA720815
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 18:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JgER+4QE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbfJASQi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 14:16:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52816 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfJASQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:16:37 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9564923F;
        Tue,  1 Oct 2019 20:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953796;
        bh=NtVPx+W+awfU0wFiY7E8sNfbUgVBuwclLTWqY7FDlJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JgER+4QEuuVw5uFf9ng2ZcP7gLN5RWB55O922TfiogKlC1g8reXAqwAbPXFx575/J
         gjUMGHX1RiaAaAWNQFzh3rCWEdLIBeg6/Ic4CACf85/29+sZeDmUihBfLKUMDDeQO+
         tR7SaDat+LI8a1QdhlUgXqHZcdIXq4qB8AiddPNk=
Date:   Tue, 1 Oct 2019 21:16:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 5/8] arm64: dts: renesas: r8a774b1: Add FDP1 device nodes
Message-ID: <20191001181623.GG4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-6-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-6-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:21PM +0100, Biju Das wrote:
> The r8a774b1 has a single FDP1 instance.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 979be5a..93b2e88 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -1182,6 +1182,16 @@
>  			/* placeholder */
>  		};
>  
> +		fdp1@fe940000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe940000 0 0x2400>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 119>;
> +			power-domains = <&sysc R8A774B1_PD_A3VP>;
> +			resets = <&cpg 119>;
> +			renesas,fcp = <&fcpf0>;
> +		};
> +
>  		fcpf0: fcp@fe950000 {
>  			compatible = "renesas,fcpf";
>  			reg = <0 0xfe950000 0 0x200>;

-- 
Regards,

Laurent Pinchart

Return-Path: <SRS0=caTn=CR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24055C43461
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Sep 2020 06:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6DCB2137B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Sep 2020 06:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eIuyIaXR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgIHGFH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Sep 2020 02:05:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgIHGFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 02:05:07 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A5BA35;
        Tue,  8 Sep 2020 08:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599545105;
        bh=KAgqx8cHw8/klOU482b09HpM1VOg2bhGV56fxZ1dVQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIuyIaXREX75FQ623naMRWFrUwjIZ5m8vW56M1xl5cGTwNCviOwe83MTqJgv1kgEX
         jON4W/+vikWrq2IS+g447zIm4agum3ggEUY1lE8t2R88hrmXS//ONbioohVUxYXRX9
         Y/bQSdKfg+VBD0v50CZxcdaQMDEs8S2tHgef+CAg=
Date:   Tue, 8 Sep 2020 09:04:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Display support
Message-ID: <20200908060440.GT6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:35:20AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch enables HDMI Display on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> index 2ffc7e31dd58..ca21a702db54 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> @@ -29,3 +29,31 @@ memory@600000000 {
>  		reg = <0x6 0x00000000 0x1 0x00000000>;
>  	};
>  };
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock6 1>,
> +		 <&x21_clk>,
> +		 <&versaclock6 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +};
> +
> +&hdmi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi0_con {
> +	remote-endpoint = <&rcar_dw_hdmi0_out>;
> +};

-- 
Regards,

Laurent Pinchart

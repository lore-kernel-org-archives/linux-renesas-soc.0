Return-Path: <SRS0=sogr=SW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1771C282DD
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 20 Apr 2019 08:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6480721479
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 20 Apr 2019 08:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="oslk6nHN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfDTIl0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 20 Apr 2019 04:41:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44749 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbfDTIl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Apr 2019 04:41:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id h18so5512740lfj.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Apr 2019 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ogrK9A4hlvygd5D9UGNWp3iz2t4NhsF+oZnZygaVVh0=;
        b=oslk6nHNe/y+3WsEjLgrRZXtxIscdHCi3VB1CCPoDqbLUALfNqRD1j8zPtOxAbWago
         rbmWJ65YKp/XKcpZ98/6kXKKH0b1wAQeZo2SRvspDBxYy6zCg6nnAROuFN4hNVerMxZA
         CFYC2ophOPujeLd0845/0b9hSRtPuwbIU/Y3bBtDCz3k+hMP0basnI5Y+T5VDJsmUsX5
         2YZNoDlIg1j4JKdt6j7ohRm5xhrXjjnemsK3dI8SirHM6GuOV22McZr5XQiuUi7bRi3r
         nYcDtcEFRBWvvxsWwyzadmD84Hs3cVngvMj7ibaBTWoM5GneNvnYmYmRvvpCNIXCmtlr
         iC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ogrK9A4hlvygd5D9UGNWp3iz2t4NhsF+oZnZygaVVh0=;
        b=H2M46O3FyLXnx+A6limKB+GVMTAZ4E2f+PgAVu5SAcGOYpQR7eVumOciZWn1mn3LA9
         YnMcpF5reE6kCr1RPZZliIrVZ3mK2fCS1tIY8cKERSx2hvjpVtn9iau0ISgzra2N91mg
         LJmOnjElzyma9P7UG9DVvvETTIeAmaufrCKZR8iDPREM+1UyH7aEPnYOTkPCVIndz0OU
         55mZBiUlsvZ9urHbJ2Jwa8c1/9gSkFxSvS3k8vqAgSX2o657tjXV/KHpYjvcDkHIV7Wx
         T/vPhHxBxAQtdpZB+7u7B1qRFvyjTM5S5ijItJCIGJl2Yuh10RPnOKZFQOi2pDjBNnM6
         IopQ==
X-Gm-Message-State: APjAAAX5K6DppvAKQ+LUEnUR1ld/MCGcatmHV/M1W4ZPzeuW50ZnGW0p
        hUrpc2/VwkmUtM5YSBUsn3z1/A==
X-Google-Smtp-Source: APXvYqxwx4+Hu9Ysg1nkMRoURaSPIIBvr4hx5f+GzcHDwVC7lcH29TRiCvNp7Aml8c9s/pS9+cNGrQ==
X-Received: by 2002:a05:6512:20e:: with SMTP id a14mr4642503lfo.14.1555749683654;
        Sat, 20 Apr 2019 01:41:23 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id t206sm1708549lff.21.2019.04.20.01.41.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Apr 2019 01:41:22 -0700 (PDT)
Date:   Sat, 20 Apr 2019 10:41:22 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: draak: Remove unecessary index from
 vin4 port
Message-ID: <20190420084122.GE28515@bigcity.dyn.berto.se>
References: <20190313105118.23245-1-horms+renesas@verge.net.au>
 <20190313134628.GB24848@bigcity.dyn.berto.se>
 <20190419233049.GA6250@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190419233049.GA6250@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent and Simon,

On 2019-04-20 02:30:49 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Wed, Mar 13, 2019 at 02:46:28PM +0100, Niklas Söderlund wrote:
> > On 2019-03-13 11:51:18 +0100, Simon Horman wrote:
> > > The ports node of vin4 only has one sub-node and thus does
> > > not need #address-cells/#size-cells and the sub-node does
> > > not need an exit.
> > 
> > I agree that the warning should be silenced however I have a feeling 
> > this might need to be tested. The VIN bindings assigns special meaning 
> > to which port reg an endpoint is described in and handles each of them 
> > differently, see the biding documentation.
> > 
> > As the single port described here is port 0 I think removing the reg 
> > property will probably work but is it correct? If someone with a Draak 
> > board could test this patch it would be great!
> 
> I've tested this patch, and the media-ctl -p output is identical before
> and after applying it.
> 
> # media-ctl -p -d /dev/media2
> Media controller API version 5.1.0
> 
> Media device information
> ------------------------
> driver          rcar_vin
> model           renesas,vin-r8a77995
> serial
> bus info        platform:e6ef4000.video
> hw revision     0x0
> driver version  5.1.0
> 
> Device topology
> - entity 1: adv7180 0-0020 (1 pad, 1 link)
>             type V4L2 subdev subtype Decoder flags 0
>             device node name /dev/v4l-subdev6
>         pad0: Source
>                 [fmt:UYVY8_2X8/720x240 field:alternate]
>                 -> "VIN4 output":0 []
> 
> - entity 5: VIN4 output (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video5
>         pad0: Sink
>                 <- "adv7180 0-0020":0 []
> 
> 
> Please let me know if I should conduct other tests.

Thanks for testing, no more tests are needed.

> 
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

It works and the change silence the warning,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> > > This addresses the following warning:
> > > 
> > >  # make dtbs W=1
> > >  ...
> > >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts:492.8-503.4: Warning (graph_child_address): /soc/video@e6ef4000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> > > 
> > > Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
> > > Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > >  Developed on top of renesas-devel-20190308-v5.0
> > >  Compile tested only
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > index 244b0dda03ed..8fba6cde5905 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > @@ -490,12 +490,7 @@
> > >  	status = "okay";
> > >  
> > >  	ports {
> > > -		#address-cells = <1>;
> > > -		#size-cells = <0>;
> > > -
> > > -		port@0 {
> > > -			reg = <0>;
> > > -
> > > +		port {
> > >  			vin4_in: endpoint {
> > >  				remote-endpoint = <&adv7180_out>;
> > >  			};
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund

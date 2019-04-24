Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8C3C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6791220684
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfDXJ5T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:57:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36022 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfDXJ5T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 05:57:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4A92F25AE99;
        Wed, 24 Apr 2019 19:57:17 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4333494041B; Wed, 24 Apr 2019 11:57:15 +0200 (CEST)
Date:   Wed, 24 Apr 2019 11:57:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: draak: Remove unecessary index from
 vin4 port
Message-ID: <20190424095712.akqypzhnytbc7ev2@verge.net.au>
References: <20190313105118.23245-1-horms+renesas@verge.net.au>
 <20190313134628.GB24848@bigcity.dyn.berto.se>
 <20190419233049.GA6250@pendragon.ideasonboard.com>
 <20190420084122.GE28515@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190420084122.GE28515@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Apr 20, 2019 at 10:41:22AM +0200, Niklas Söderlund wrote:
> Hi Laurent and Simon,
> 
> On 2019-04-20 02:30:49 +0300, Laurent Pinchart wrote:
> > Hi Niklas,
> > 
> > On Wed, Mar 13, 2019 at 02:46:28PM +0100, Niklas Söderlund wrote:
> > > On 2019-03-13 11:51:18 +0100, Simon Horman wrote:
> > > > The ports node of vin4 only has one sub-node and thus does
> > > > not need #address-cells/#size-cells and the sub-node does
> > > > not need an exit.
> > > 
> > > I agree that the warning should be silenced however I have a feeling 
> > > this might need to be tested. The VIN bindings assigns special meaning 
> > > to which port reg an endpoint is described in and handles each of them 
> > > differently, see the biding documentation.
> > > 
> > > As the single port described here is port 0 I think removing the reg 
> > > property will probably work but is it correct? If someone with a Draak 
> > > board could test this patch it would be great!
> > 
> > I've tested this patch, and the media-ctl -p output is identical before
> > and after applying it.
> > 
> > # media-ctl -p -d /dev/media2
> > Media controller API version 5.1.0
> > 
> > Media device information
> > ------------------------
> > driver          rcar_vin
> > model           renesas,vin-r8a77995
> > serial
> > bus info        platform:e6ef4000.video
> > hw revision     0x0
> > driver version  5.1.0
> > 
> > Device topology
> > - entity 1: adv7180 0-0020 (1 pad, 1 link)
> >             type V4L2 subdev subtype Decoder flags 0
> >             device node name /dev/v4l-subdev6
> >         pad0: Source
> >                 [fmt:UYVY8_2X8/720x240 field:alternate]
> >                 -> "VIN4 output":0 []
> > 
> > - entity 5: VIN4 output (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video5
> >         pad0: Sink
> >                 <- "adv7180 0-0020":0 []
> > 
> > 
> > Please let me know if I should conduct other tests.
> 
> Thanks for testing, no more tests are needed.
> 
> > 
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> It works and the change silence the warning,
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, applied for v5.3.

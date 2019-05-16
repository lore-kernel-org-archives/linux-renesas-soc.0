Return-Path: <SRS0=PbOa=TQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7791C04AAF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 10:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7035B20848
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 10:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f1lgT8ah"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfEPKkp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 May 2019 06:40:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57072 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfEPKkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 06:40:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A84F3320;
        Thu, 16 May 2019 12:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558003243;
        bh=mYbEjTj+G+yzNC1WG+yDdWwkA3TPZfwqqoRwaezcwXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1lgT8ahsuQVCBPhC+UHVVbF5/c9PJLtPhH7Pto2GdxNo9rUGtZcHmyJdfWCIh1VB
         BhYRK9sWlbID2rO1jnnMBb+xRpTcemWoCB6yGFsvq0P+GIxCULhUuVQt1DvdpsYzML
         bcKgCVfKyUTCUNvAECtXnUaQv0dBRjtJQCMqBi24=
Date:   Thu, 16 May 2019 13:40:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com
Subject: Re: [RFC 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190516104027.GG4995@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-3-jacopo+renesas@jmondi.org>
 <20190511182330.GF13043@pendragon.ideasonboard.com>
 <20190515141220.xgyfqt6iyfgdgqd7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515141220.xgyfqt6iyfgdgqd7@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, May 15, 2019 at 04:12:20PM +0200, Jacopo Mondi wrote:
> On Sat, May 11, 2019 at 09:23:30PM +0300, Laurent Pinchart wrote:
> > On Wed, May 08, 2019 at 07:34:21PM +0200, Jacopo Mondi wrote:
> >> Document the newly added 'cmms' property which accepts a list of phandle
> >> and channel index pairs that point to the CMM units available for each
> >> Display Unit output video channel.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> ---
> >>  Documentation/devicetree/bindings/display/renesas,du.txt | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> index aedb22b4d161..2ccf78bf9a18 100644
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> @@ -44,6 +44,10 @@ Required Properties:
> >>      instance that serves the DU channel, and the channel index identifies the
> >>      LIF instance in that VSP.
> >>
> >> +  - cmms: A list of phandle and channel index tuples to the CMM modules
> >> +    connected to DU channels. The phandle identifies the CMM instance that
> >> +    serves the DU channel identified by the index.
> >
> > Do we need the index ?
> 
> Well, I struggled a bit at deciding if this was a good idea or not.
> In the end I decided to use the index, as in this version, by just
> providing the cmm phandle, the CMM gets enabled for the DU channel it
> is associated to. It is true I could just enumerate them, and assign
> the CMM corresponding to the first phandle to channel #0, the second
> to channel #1 and so on, but in the (very unlikely?) case where a
> developer what to enable CMM for, say, channel #0 and #2 but not #1,
> this scheme would break, as I have then decided to have a mandatory
> channel index to make the association stable. True that a CMM unit is
> associated to a DU channel only, and I could derive this from the base
> address or a custom property (like 'renesa,du-channel) in the CMM
> device node, but this seems better handled here.

First of all, DT should describe the hardware, enabling or disabling CMM
should not be done through this property. Then, if you really wanted to
control which channels use CMM through DT, you could just insert a 0
value in the cmms array in the corresponding position instead of the
phandler of a CMM node. Finally, you can also use status = "disabled" in
the CMM nodes to disable them, and the DU driver could check that. That
seems a better mechanism if we want to disable CMM support in DT.

> Now that I wrote this, I wonder if I actually need to know which
> channel a CMM is associated to, or I could just go and enable the ones
> listed in the 'cmms' property and that's it. Was this the idea behind
> your question?

You need to know the association, as you will have to configure the
CMMs, not just enable or disable them.

> > It should also be noted that the property is optional for SoCs that
> > don't have any CMM.
> >
> >> +
> >>  Required nodes:
> >>
> >>  The connections to the DU output video ports are modeled using the OF graph
> >
> > Could you update the example ?
> >

-- 
Regards,

Laurent Pinchart

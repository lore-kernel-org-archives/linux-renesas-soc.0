Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C544BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 945CB2081B
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j4dRCpEG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfCILvi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 06:51:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39734 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfCILvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 06:51:37 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1627949;
        Sat,  9 Mar 2019 12:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552132295;
        bh=RUAvSd16BrcJa0ukFpopdCJLZ+QDt5BH6sgn92Hj+9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j4dRCpEGz5xqwjehICjiBOldOO4xe1ZBO3XY5bIjLuQEqDUz0pECJKa7Ttq4aEQ2y
         f2A4morkA9UQmYoQRIeDOViMBYblSX/3O9/lrRxkFs13NlGNuYIiHKKm1TtYBpM8Te
         VhD8JPx1ZA+tqi/o4CjtwlYcDN5RCQ9FsP1UBntI=
Date:   Sat, 9 Mar 2019 13:51:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190309115128.GC4924@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
 <20190308175739.GA11318@pendragon.ideasonboard.com>
 <20190309112308.rbuqwvvvxgihmj7d@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190309112308.rbuqwvvvxgihmj7d@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sat, Mar 09, 2019 at 12:23:08PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 08, 2019 at 07:57:39PM +0200, Laurent Pinchart wrote:
> > On Fri, Mar 08, 2019 at 05:49:25PM +0100, Jacopo Mondi wrote:
> >> On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> >>> The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> >>> dual-link. In dual-link mode both input ports are used to carry even-
> >>> and odd-numbered pixels separately. Document this in the DT bindings,
> >>> along with the related rules governing port and usage.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >>> index 37f0c04d5a28..4ff6eb9bbc19 100644
> >>> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >>> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >>> @@ -28,6 +28,13 @@ Optional video port nodes:
> >>>  - port@1: Second LVDS input port
> >>>  - port@3: Second digital CMOS/TTL parallel output
> >>>
> >>> +The device can operate in single-link mode or dual-link mode. In single-link
> >>> +mode, all pixels are received on port@0, and port@1 shall not contain any
> >>> +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> >>> +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> >>> +endpoints.
> >>
> >> You know, I'm not sure this is helpful, as if we have to go and
> >> describe what the chip supports, a paragraph for dual ouput mode would
> >> be required as well. The bindings already document that the chip
> >> supports single/dual input/output modes, maybe you can just add rules
> >> that prescribes how to populate the endpoints, for both input and
> >> output modes?
> >
> > That's what I was trying to do :-) How else would you like to see it
> > described ?
> 
> I wonder if it won't be enough to expand the Optional endpoint
> properties description as in:
> 
>  - port@1: Second LVDS input port, to be used for dual-input mode
>  - port@3: Second digital CMOS/TTL parallel output, to be used for
>    dual-output mode.

I think it's useful to explain the constraints regarding presence (or
absence) of endpoints for ports 0 and 1 depending on which mode the
device operates under, not just what the ports are used for.

> If you prefer providing more context, it's fine what you had, just
> keep in mind there's also dual-output mode and not just the dual-input
> one.

Absolutely. The reason why I haven't expanded the bindings to document
dual-output mode is that I have no way to test it, and I don't think
untested bindings (meaning without a testable end-to-end implementation)
are a good idea.

> Up to you, feel free to add my
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> if relevant.
> 
> >>> +
> >>> +
> >>
> >> You can drop this empty line.
> >>
> >>>  Example:
> >>>  --------
> >>>

-- 
Regards,

Laurent Pinchart

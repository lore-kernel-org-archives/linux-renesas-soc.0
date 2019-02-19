Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E692DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B596021738
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h6xRTXQU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfBSQhr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 11:37:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfBSQhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 11:37:47 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07150329;
        Tue, 19 Feb 2019 17:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550594265;
        bh=BMJJANEDtO/n1aBDUZpfycyYCUXj430f8LhaVDKI7o0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h6xRTXQUpZ8RBqj2PeNYrE7hdeNElB2e+pZDLImMqr+MzdxEqspkX2GfU2pQwqDsH
         NH7HElJ3LPR7pU4GQ8wkNP19cBkrYBaVEm9xs4eEsPpVc9Oic2273HnEryBMLGXWWr
         wIc8jzWtIl3xqBDP/46b928y7/WqJ5FpYsmU3b4k=
Date:   Tue, 19 Feb 2019 18:37:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 6/7] vsp-lib: Support late queuing of buffers
 in yavta
Message-ID: <20190219163741.GE3526@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-7-kieran.bingham@ideasonboard.com>
 <20190217120005.GB3514@pendragon.ideasonboard.com>
 <3fd7a967-fe76-d363-356a-7da27bcab8f6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3fd7a967-fe76-d363-356a-7da27bcab8f6@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Sun, Feb 17, 2019 at 08:57:51PM +0000, Kieran Bingham wrote:
> On 17/02/2019 12:00, Laurent Pinchart wrote:
> > On Tue, Dec 04, 2018 at 03:51:45PM +0000, Kieran Bingham wrote:
> >> Provide the pass-through option of --queue-late to vsp-runner, to request
> >> that yavta will queue frames after the stream has started.
> > 
> > As with 5/7, what is the use case for this ?
> 
> I'm sure it had a very good use case at the time.
> Please ask 2 months ago Kieran ... Current Kieran has no idea :)
> 
> And then let me borrow your time machine - I have some good uses for it :D
> 
> I remember asking  you about this option in fact, but I can't remember
> what I was testing specifically, or why I have added this here.
> 
> Maybe I was using it to investigate something ... It might perhaps be
> useful to add a test which uses this to make sure the VSP1 is happy with
> late queued frames?

At least part of this is handled internally in videobuf2 without being
exposed to the VSP1 driver. If the exposed part is considered to be
possibly problematic then I would indeed prefer to add a specific test
to cover this.

> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >>  scripts/vsp-lib.sh | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> >> index 9140254c7459..3d2792707d24 100755
> >> --- a/scripts/vsp-lib.sh
> >> +++ b/scripts/vsp-lib.sh
> >> @@ -898,6 +898,7 @@ vsp_runner() {
> >>  	local count=10
> >>  	local pause=
> >>  	local skip=7
> >> +	local queue_late=
> >>  
> >>  	for option in $* ; do
> >>  		case $option in
> >> @@ -916,6 +917,8 @@ vsp_runner() {
> >>  		--skip=*)
> >>  			skip=${option/--skip=/}
> >>  			;;
> >> +		--queue-late)
> >> +			queue_late=queue-late
> 
> erm ... missing ";;"?
> 
> >>  
> >>  		*)
> >>  			return 1
> >> @@ -959,6 +962,7 @@ vsp_runner() {
> >>  
> >>  	$yavta -c$count -n $buffers ${format:+-f $format} ${size:+-s $size} \
> >>  		${skip:+--skip $skip} ${file:+--file=$file} ${pause:+-p$pause} \
> >> +		${queue_late:+--$queue_late} \
> >>  		$videodev | ./logger.sh $entity >> $logfile
> >>  }
> >>  

-- 
Regards,

Laurent Pinchart

Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CED9C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:35:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D74120855
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QpBETPoS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbfBSQfn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 11:35:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49458 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbfBSQfm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 11:35:42 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E528C329;
        Tue, 19 Feb 2019 17:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550594141;
        bh=Ag5m5nGdR7z/iPHkWO2SZiBF5wMlzZhR9pUgRmOFWnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QpBETPoSXl5d11mIrwKrtlRXwqL8z6fvL43DbT7RwTvwj1lFwbW6vVns5YKOF+5k3
         9sOqRDm5c9HH1uJO3V5i9dQdIqH/uoUey6jUQrzzdv35eTZca0Bah74nNRfR72ETUt
         upMbRmEFJOWxHjxehn1U2sLkJf7oLgATzmsEh92o=
Date:   Tue, 19 Feb 2019 18:35:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 5/7] vsp-lib: Allow forcing pixel perfect
 comparisons
Message-ID: <20190219163537.GD3526@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-6-kieran.bingham@ideasonboard.com>
 <20190217115907.GA3514@pendragon.ideasonboard.com>
 <c69a16fc-98d5-8fe9-0c1d-7b06995b4ced@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c69a16fc-98d5-8fe9-0c1d-7b06995b4ced@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Sun, Feb 17, 2019 at 08:51:52PM +0000, Kieran Bingham wrote:
> On 17/02/2019 11:59, Laurent Pinchart wrote:
> > On Tue, Dec 04, 2018 at 03:51:44PM +0000, Kieran Bingham wrote:
> >> Provide a means for the tester to request pixel perfect matches on tests.
> >> This can be either through setting the environment variable VSP_PIXEL_PERFECT, or
> >> by passing either '-p' or '--pixel-perfect' on the test command line.
> > 
> > What's the use case for this ?
> 
> Some of the tests (i.e. scaling) provide 'fuzzy comparisons' to allow "a
> close match" to pass.
> 
> It can be desirable to 'turn that off' so that you can generate a set of
> frames (using the '-k' option) to diff the expected against the actual
> frames.

Ideally we should improve the reference frame generation tool to
generate pixel-perfect frames :-) In the meantime I agree this could be
useful, but I think we should then integrate this better by marking a
test run as reference, saving frames to a good location, and then
reusing them for the subsequent runs. It's a bit too manual in its
proposed form for an automated test suite :-)

> This helps while improving the system without making changes to the
> specific tests.
> 
> It could be called 'disable fuzzy matching' if you like?
> 
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >>  scripts/vsp-lib.sh | 11 ++++++++++-
> >>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> >> index cf15a045ea8c..9140254c7459 100755
> >> --- a/scripts/vsp-lib.sh
> >> +++ b/scripts/vsp-lib.sh
> >> @@ -287,7 +287,11 @@ compare_frames() {
> >>  	params=${params//)/_}
> >>  	params=$pipe-$in_fmt-$out_fmt-$size$params
> >>  
> >> -	if [ x$__vsp_pixel_perfect != xtrue ] ; then
> >> +	# The system can hint when pixel-perfection is not supported,
> >> +	# however the user can override to force this requirement with
> >> +	# VSP_PIXEL_PERFECT=1 in the environment or by passing -p, or
> >> +	# --pixel-perfect on the commandline.
> >> +	if [ x$__vsp_pixel_perfect != xtrue -a x$VSP_PIXEL_PERFECT != x1 ] ; then
> >>  		method=fuzzy
> >>  	fi
> >>  
> >> @@ -1113,10 +1117,15 @@ case $1 in
> >>  		export VSP_KEEP_FRAMES=1
> >>  		shift
> >>  		;;
> >> +	-p|--pixel-perfect)
> >> +		export VSP_PIXEL_PERFECT=1
> >> +		shift
> >> +		;;
> >>  	-h|--help)
> >>  		echo "$(basename $0): VSP Test library"
> >>  		echo "  -x|--debug          enable shell debug"
> >>  		echo "  -k|--keep-frames    keep generated and captured frames"
> >> +		echo "  -p|--pixel-perfect  frames must match with pixel perfection"
> >>  		echo "  -h|--help           this help"
> >>  		exit
> >>  		shift

-- 
Regards,

Laurent Pinchart

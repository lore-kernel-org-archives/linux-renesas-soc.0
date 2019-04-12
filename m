Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0FBC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1B762077C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6x9ZQ2P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfDLMXG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:23:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfDLMXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:23:06 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D62DA31A;
        Fri, 12 Apr 2019 14:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555071784;
        bh=sBKGtY9jD/f9odmSE6VxqsZ0mA9yaXU5h5Vc5dLkli8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=U6x9ZQ2Pjanum9N+qom/qIt4apLBFwiTuA1mmvfUCoULCslNhlWQ2VvwNidYBwgtC
         gLdyQ4v3P8kL5xv5G6S4yoU1tVDpZIyjE77GfwqwpcWimrtPkKuDaddyggxN0B8iVQ
         lSRac/ZESSf+3VQnvN95Im3NhvFweLMYeq7MBZ9c=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: Color Keying
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
References: <TY1PR01MB1770CA2D8AFEEAAF55045AD0C0280@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f643b00d-b6d7-5710-dbbe-37a0beb75189@ideasonboard.com>
Date:   Fri, 12 Apr 2019 13:23:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1770CA2D8AFEEAAF55045AD0C0280@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On 12/04/2019 11:12, Fabrizio Castro wrote:
> Hello Laurent,
> 
> has colour keying ever been tested on R-Car Gen3?
> I am working on HDMI support for the RZ/G2E, and I wanted to test "colorkey", but it
> looks like that once you have RCAR_DU_FEATURE_VSP1_SOURCE defined within the
> features member of the SoC specific rcar_du_device_info struct, rcar_du_modeset_init
> won't call rcar_du_planes_init.
> 
> Is my understanding correct?
> Is this behaviour desired?
> Is there anything I can do to quickly test it on my RZ/G2E?

It looks like this has been attempted a couple of times but might not
yet be completed. Perhaps you have the required necessity to refresh the
patches? If not, let us know and we'll see what we can with our next
batch of tasks.

At [0] I see that there was a pull request to incorporate Gen3 color
keying support into the renesas drivers, but it was removed some time
after due to conflicts [1].

[0] https://lore.kernel.org/linux-renesas-soc/5151514.osXWQNHT4Q@avalon/
[1]
https://lore.kernel.org/linux-renesas-soc/CAMuHMdU7FjZ43+MTgWQfZX6fx6zyaFyw+SY-UoPZ5Gx2hDOL7A@mail.gmail.com/

You could try fetching the commits from
  git://linuxtv.org/pinchartl/media.git
      tags/drm-next-colorkey-v1-20171215

And try to cherry-pick them to mainline to see if that brings the
functionality you require.


A patch was provided for kms-tests at [2] which might help you validate
the patches.

[2]
https://lore.kernel.org/linux-renesas-soc/20171215134848.19680-1-laurent.pinchart@ideasonboard.com/


If you successfully rebase and test the patches, please consider
reposting them from the new base to rejuvenate the effort to get them
integrated.

If you have any difficulties please let us know, but I'm afraid I'm on
holiday next week so there is not much I can do until after I return.

--
Regards

Kieran



> Thanks,
> Fab
> 
> 
> 
> 


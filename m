Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A02DC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE9782082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HQSSBph6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfDLM2Z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:28:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40110 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfDLM2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:28:25 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33CB831A;
        Fri, 12 Apr 2019 14:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555072102;
        bh=upZWRcpX04j6BBaLmzwV/OYKU+BW9jxk6bcL2EhjJqg=;
        h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=HQSSBph6OGawvJEUvsY4mpQiC+KcuvliYomfmVnyEFSZHrBpdNUH7Nlv1U5tLxzsK
         OEU8Ozvmynrb5qS4pwsIfWHXZf6rO/kRb6YKttDvaCiFVlgThKAwVm9Rert7PlvPLG
         sQiJYBFjjZ7TbQtmPuClZN6QPEmO2hfgxX5pRB7M=
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: Color Keying
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
References: <TY1PR01MB1770CA2D8AFEEAAF55045AD0C0280@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <f643b00d-b6d7-5710-dbbe-37a0beb75189@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <acf4d133-19f9-9493-d2b2-3815664763b0@ideasonboard.com>
Date:   Fri, 12 Apr 2019 13:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f643b00d-b6d7-5710-dbbe-37a0beb75189@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Again,

It looks like someone else has also tried to rejuvenate the DRM generic
colorkey support from Laurent at:

https://lore.kernel.org/linux-renesas-soc/20180807172202.1961-2-digetx@gmail.com/

So that may or may not conflict. But it suggests that if you can get
Laurent's old patches working then it will help your use case - but
probably needs more considerable work before we can integrate into mainline.

--
Kieran



On 12/04/2019 13:23, Kieran Bingham wrote:
> Hi Fabrizio,
> 
> On 12/04/2019 11:12, Fabrizio Castro wrote:
>> Hello Laurent,
>>
>> has colour keying ever been tested on R-Car Gen3?
>> I am working on HDMI support for the RZ/G2E, and I wanted to test "colorkey", but it
>> looks like that once you have RCAR_DU_FEATURE_VSP1_SOURCE defined within the
>> features member of the SoC specific rcar_du_device_info struct, rcar_du_modeset_init
>> won't call rcar_du_planes_init.
>>
>> Is my understanding correct?
>> Is this behaviour desired?
>> Is there anything I can do to quickly test it on my RZ/G2E?
> 
> It looks like this has been attempted a couple of times but might not
> yet be completed. Perhaps you have the required necessity to refresh the
> patches? If not, let us know and we'll see what we can with our next
> batch of tasks.
> 
> At [0] I see that there was a pull request to incorporate Gen3 color
> keying support into the renesas drivers, but it was removed some time
> after due to conflicts [1].
> 
> [0] https://lore.kernel.org/linux-renesas-soc/5151514.osXWQNHT4Q@avalon/
> [1]
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdU7FjZ43+MTgWQfZX6fx6zyaFyw+SY-UoPZ5Gx2hDOL7A@mail.gmail.com/
> 
> You could try fetching the commits from
>   git://linuxtv.org/pinchartl/media.git
>       tags/drm-next-colorkey-v1-20171215
> 
> And try to cherry-pick them to mainline to see if that brings the
> functionality you require.
> 
> 
> A patch was provided for kms-tests at [2] which might help you validate
> the patches.
> 
> [2]
> https://lore.kernel.org/linux-renesas-soc/20171215134848.19680-1-laurent.pinchart@ideasonboard.com/
> 
> 
> If you successfully rebase and test the patches, please consider
> reposting them from the new base to rejuvenate the effort to get them
> integrated.
> 
> If you have any difficulties please let us know, but I'm afraid I'm on
> holiday next week so there is not much I can do until after I return.
> 
> --
> Regards
> 
> Kieran
> 
> 
> 
>> Thanks,
>> Fab
>>
>>
>>
>>
> 


Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34836C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 20:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1A352146F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 20:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="A9IbX8fj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfDKUml (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:42:41 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41978 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfDKUml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 16:42:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id t30so5733215lfd.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yRnD7ZMiFJsrzd4GivbJ0K2/JPe1+PbzfqYUrN7fypg=;
        b=A9IbX8fjxQgyz21TSPAINrEmB5Zuf2Zo4AWSfAdnn9tdTuHeA0QSgFTDyDpo9ksykQ
         9EgPVD5hzHMEU2A+1I8vtxlK9c2SQJKtZMyTmRL4FddKsJGe2ehf4MUvkJ9XHUHQR47v
         zBv+3pkAKK2ynigx6oJynUmiIHt1JmEiH7KRF2cqbWMmVVN0ez1gs3iTLCwPKxRszORv
         agJHb4uzNAsiUO0MT8XLk7KxXjP+J+8/n+XyKTGsCobS3XU2xWEefoZr6GlcrD+E5Ycl
         1lkPiS0NPt7rhvcX9W2KkmadDDzCqVW9ojhhyG3SKeZlBsmLG1Pa0tbCIGx5PoUWImCe
         Dn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yRnD7ZMiFJsrzd4GivbJ0K2/JPe1+PbzfqYUrN7fypg=;
        b=ilachjtJorBcKnS/Pm5Yc5uRiS86ov2BQeQmM7RE/diEahmeZ26XDO2BepdzUrQKo2
         f5vaiMjp7B7eUSov/xGuXw5Z42AMy+PGzYyVGdYg4Yx7Kh4zs9+pgAk5YrciDXjq0+OW
         lAFUDmcgkFpZIqK1LQM1UBbED1q1qopimfR+7NOmnvV9KtlQPSR5bfw50Sa3eFud3fuT
         lq1bPTlX+t4IzIu3/Y34MZexS+zfeK1HSI19FNajAuaaBfELsLpdyOgN/aUs8jPSvrpu
         a0pK7Xx0AGV62xb488CL0cckqjFWM1aV77iErAOHU6fzsg7aC8XxeQCnZRrTAMfdfP15
         EVSQ==
X-Gm-Message-State: APjAAAUvfC28GuZ3CkoqHOW9CDsscJtJEo3EnlsTW2WxNSdOctFZDvn5
        tLBIavZ1gD/YWWGDUbnozRcVgA==
X-Google-Smtp-Source: APXvYqwaPTUHdkxO+m8hzoJHblqH5Zkgv1DUCkRSEp8A3w+f0QNcmKCrELjZnil5/7SmO/EtIag+YQ==
X-Received: by 2002:ac2:5686:: with SMTP id 6mr12086164lfr.34.1555015359260;
        Thu, 11 Apr 2019 13:42:39 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b19sm7646293lfi.96.2019.04.11.13.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 13:42:38 -0700 (PDT)
Date:   Thu, 11 Apr 2019 22:42:37 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "George G. Davis" <george_davis@mentor.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        harsha.manjulamallikarjun@in.bosch.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 3/9] media: rcar-vin: Create a group notifier
Message-ID: <20190411204237.GH30887@bigcity.dyn.berto.se>
References: <20190405161639.GA10433@vmlxhi-102.adit-jv.com>
 <25dc2668-d270-ebf8-b014-88bbb7a6f243@gmail.com>
 <20190408111241.GF15350@bigcity.dyn.berto.se>
 <df6fa3bf-bf21-50b0-2cad-a613e2a43ce0@gmail.com>
 <20190409205745.GB9750@pendragon.ideasonboard.com>
 <3c2c2d04-8028-3511-aba0-0ea6dd5bdc50@mentor.com>
 <20190409225948.GD9750@pendragon.ideasonboard.com>
 <69091709-a63f-6a11-4b4b-13fcf8d3e40a@gmail.com>
 <20190411202819.GA8006@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190411202819.GA8006@vmlxhi-102.adit-jv.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugenie,

On 2019-04-11 22:28:19 +0200, Eugeniu Rosca wrote:
> Hi Niklas,
> 
> Two simple questions:
>  - I can only clone git://git.ragnatech.se/linux, but can't access it on
>    the web, does it have some web interface?

There should be a gitweb instance running at https://git.ragnatech.se/ 
if not let me know since then something is wrong ;-)

>  - Browsing through your v4l2/next/csi2/upport branch, it looks to be
>    targeted for upstream. Could we rely on those commits already or
>    they are still in development/testing?

The patches in that branch are target for upstreaming but sometime 
changes due to review comments. Best check the media-tree of what have 
accepted and the patchwork instance if you want day fresh statuses. I 
also rebase the branch from time to time on-top of the media-tree so you 
should not depend on it much I'm afraid.

If you plan to do some work on the rcar-csi2 driver you can always reach 
out and check what the status is if you are unsure.

-- 
Regards,
Niklas Söderlund

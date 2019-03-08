Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEAEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 14:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53A6A2087C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 14:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="TXpA5mwc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbfCHOta (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 09:49:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42975 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfCHOta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 09:49:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id d14so17615407ljl.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jIWgoXdZ2zpdc+p4gLk6XIwb/LLBU35MxKBr1UL+Vls=;
        b=TXpA5mwchNVwpOLFnAh6IH2N9KO8yMLY4ETLblTV0d3iMNKZG30K1MYpWE/tlrcI41
         qrvwiQd+501L0tBA/h3G4aBKiC9m3V84kZ6rRpvv3/xYNlbmR/uVEZXGazvd9gNOZVt3
         ja2o5vTsnpTMWbwTCmyWllPMQEvQgq2OFpH4pZKOXDzAbEf3MYJG6+YVe/nuEnD6NH60
         JPgndi5zDefHNemcaypk42l/9ayXq+Y/WEdQOViVHdn73gk1CW9UyHM3UNIcW0xhuCb0
         +2IZUB/K4MDXnFhDXoFUbrRi8em8uEDiyNMOMWuEP9h6i0aktronq8F9rTgzvMcGHLNR
         YL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jIWgoXdZ2zpdc+p4gLk6XIwb/LLBU35MxKBr1UL+Vls=;
        b=JUI7EivSva9Cd8N8oh8d6kF0KP3+hMAXQbpvhRvDADAZVu/0jcEKVt05H04spkxCYs
         CtFZpcjZ4N3NxIGvVHTgXaYTf1ApLxvCGa/aYRvh40s6KVhi4eCpIWYXU4tMBFPsodfT
         BJmxnMre3FgUKLEK61fCP6I/YCAWEg98F/9xQJalhLzpNHCmXHvll6x4brXUG2MWzpD9
         0N7pSm+vkWg0U8+0JTvqAvIbxwz7+x+QF86p5b72ZZUBPnpxdO58w28QSuBLCxS/rjh9
         zmgmLZhi8G1FzoL3o6fS/Vpqz0Zcg33/tVL2vEcfezhL5SwqGkyFX8P2yx+3A1zBJUaW
         /mJQ==
X-Gm-Message-State: APjAAAXovvxGTtWDKhbXX2g2Y8/yaXFS4YXlyL5Tug6hzYvRT5xP9b0b
        Pv2tAdZjSDF3lgWMNiZ1sfiW7w==
X-Google-Smtp-Source: APXvYqxDF4O6sQi/w2455HPRt7GfavptqAjdaEG1hqW7EQXrgioVR8ku8NLRGgEQ1kPSiFijo5zLAA==
X-Received: by 2002:a2e:9607:: with SMTP id v7mr2180253ljh.154.1552056568453;
        Fri, 08 Mar 2019 06:49:28 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id j14sm1470691lji.32.2019.03.08.06.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 06:49:27 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Fri, 8 Mar 2019 15:49:26 +0100
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove invalid compatible
 value for CSI40
Message-ID: <20190308144926.GR9239@bigcity.dyn.berto.se>
References: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
 <20190308120232.kueqdbkwoi2b6l6g@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190308120232.kueqdbkwoi2b6l6g@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On 2019-03-08 13:02:33 +0100, Simon Horman wrote:
> On Wed, Mar 06, 2019 at 06:45:56PM +0100, Geert Uytterhoeven wrote:
> > Hi Niklas,
> > 
> > On Wed, Mar 6, 2019 at 4:14 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> > > the R-Car CSI-2 driver but was removed before the driver was merged.
> > > Remove the only occurrence of the compatible value which manage to make
> > 
> > Nah, there's a second one, in r8a774c0.dtsi ;-)
> > 
> > > it upstream.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> should this patch have:
> 
> Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")

Yes it should. Want me to send a v2 or can you add then when picking up 
the patch?

-- 
Regards,
Niklas Söderlund

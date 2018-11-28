Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40957 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbeK2KlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 05:41:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id v5so33537lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Nov 2018 15:38:00 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 29 Nov 2018 00:37:58 +0100
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
Message-ID: <20181128233758.GB2162@bigcity.dyn.berto.se>
References: <20181128161829.27266-1-niklas.soderlund+renesas@ragnatech.se>
 <20181128215617.GA1707@kunai>
 <20181128220637.GA2162@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181128220637.GA2162@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-11-28 23:06:37 +0100, Niklas S�derlund wrote:
> Hi Wolfram,
> 
> On 2018-11-28 22:56:20 +0100, Wolfram Sang wrote:
> > Hi Niklas,
> > 
> > thanks for the updates! Do you happen to have a branch ready for
> > testing?
> 
> I will push a new branch once I'm done updating the clock patch so all 
> changes can be tested in one go. Will let you know once that is 
> available. Hopefully later tonight.

I have pushed the latest and greatest to [1]. I tested this on H3 ES1, 
H3 ES2.0 and M3-N and it looks good. Speeds for both MMC and SD cards 
match what we saw in Edinburgh.

I still have to post the clock patches to the mailing list but in case 
you wish to test right away I thought I send this mail out before I do 
that :-)

1. git://git.ragnatech.se/linux mmc/hackfest

-- 
Regards,
Niklas S�derlund

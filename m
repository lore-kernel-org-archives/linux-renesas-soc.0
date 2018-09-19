Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43562 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731442AbeITDm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 23:42:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id m84-v6so6458883lje.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Sep 2018 15:02:30 -0700 (PDT)
Date: Thu, 20 Sep 2018 00:02:27 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180919220227.GH4351@bigcity.dyn.berto.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
 <20180627061411.GQ5237@bigcity.dyn.berto.se>
 <20180627072702.ayayizxgghvoogdf@katana>
 <20180628003507.GR5237@bigcity.dyn.berto.se>
 <20180916144807.GB1083@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180916144807.GB1083@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-09-16 16:48:07 +0200, Wolfram Sang wrote:
> 
> > > > > So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd think.
> > > > > Maybe we should even move it to renesas_sdhi_core.c, but I am not too
> > > > > sure about that.
> > > 
> > > ... this.
> > > 
> > 
> > I will look into this and send a new version :-)
> 
> Did you send V2 of this? I can't find it.
> 

No I have not yet posted a v2 of this series. Perhaps I should break 
this patch out and send separate? I have handled the comments for this 
but patch 3/3 in this series still requires more work, what do you 
think?

-- 
Regards,
Niklas S�derlund

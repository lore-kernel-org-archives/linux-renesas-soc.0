Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60561 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750907AbeC0LML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 07:12:11 -0400
Date: Tue, 27 Mar 2018 13:12:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
Message-ID: <20180327111206.y7azdu355c6cevvi@verge.net.au>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
 <20180227090757.wvm6j4sy5nmeecf3@katana>
 <CAPDyKFqMacY1THjO+cTb6Aws3mCnbLogui9T6PjiVcoR89FiLg@mail.gmail.com>
 <20180227130222.zsz73d3upi3s7vjv@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180227130222.zsz73d3upi3s7vjv@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 27, 2018 at 02:02:23PM +0100, Wolfram Sang wrote:
> 
> > Perhaps someone need to explain in more detail what the HW controller
> > needs to manage tuning for HS400? I don't like that we may end up
> > getting it magically to work, then it's we better understand the
> > details and if the current sequence provided by the mmc core can't
> > fulfill the need for this case, we may instead consider adding an
> > additional pre/post host ops.
> 
> Thanks. Exactly this thinking prevented me from saying "It works, let's
> ship it" ;)

Thanks, I've dug a little deeper into the history of this code and
the associated hardware documentation and it seems that the desired
sequence is as follows:

1. Reset HS400 mode (currently executed near beginning of tmio_mmc_set_ios())
2. Set clock for HS200 mode (tmio_mmc_set_ios())
3. Tune in HS200 mode
4. Set clock for HS200 mode (tmio_mmc_set_ios())
5. Set to HS400 mode (currently renesas_sdhi_prepare_hs400_tuning() which
                      is executed near the end of tmio_mmc_set_ios())

X. It is also necessary to disable the SCC after setting HS400 mode
   has occurred before setting to High Speed mode.
   This is currently executed near the beginning of tmio_mmc_set_ios().

The current implementation differs a little from the above and its
hard to tell if that is because of hardware requirements or as
an artefact of the implementation of steps 1 and 5 being hooked into
tmio_mmc_set_ios().

It seems to me that step 1 could use the MMC core prepare_hs400_tuning
hook. Its less clear to me where steps 5 and X should hook in but perhaps
tmio_mmc_set_ios() is the right place.

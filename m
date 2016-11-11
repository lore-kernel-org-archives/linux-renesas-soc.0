Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49159 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934054AbcKKHUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 02:20:39 -0500
Date: Fri, 11 Nov 2016 08:20:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] UHS-I SDR-104 support for sh_mobile_sdhi
Message-ID: <20161111072019.GA18845@verge.net.au>
References: <1478182564-18762-1-git-send-email-horms+renesas@verge.net.au>
 <20161110114549.GC1436@katana>
 <CAPDyKFq-tZheBD_dqkKDeKy11r1UZGt2_NRpFYCqw0SsC-hBJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq-tZheBD_dqkKDeKy11r1UZGt2_NRpFYCqw0SsC-hBJw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 10, 2016 at 11:21:08PM +0100, Ulf Hansson wrote:
> On 10 November 2016 at 12:45, Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Thu, Nov 03, 2016 at 03:15:58PM +0100, Simon Horman wrote:
> >> Hi,
> >>
> >> this series is based on work by Ai Kyuse to add UHS-I SDR-104 support for
> >> sh_mobile_sdhi. It builds on work by Shinobu Uehara, Rob Taylor, William
> >> Towle and Ian Molton, Ben Hutchings, Wolfram Sang and others to add UHS-I
> >> SDR-50 support to the same driver.
> >>
> >> It is based on the next branch of the mmc tree.
> >>
> >> To aid review the following git branch is provided:
> >> * https:://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdr104-driver-v8
> >>
> >> Overview of changes since v7:
> >> * Correct inverted logic in sh_mobile_sdhi_hw_reset
> >> * Correct value of SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN
> >>
> >> Please see http://elinux.org/Tests:SD-SDHI-SDR104 for indicative tests
> >> results.
> >
> > Successfully tested on a Lager Board with a SanDisk card and a Samsung
> > card which used to cause issues before.
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Ulf, I think this series is ready to go for v4.10. All issues we know of
> > are related to pinmuxing and will be solved elsewhere. We currently have
> > hacks for that so it is quite clear the issues are not caused by this
> > series.
> >
> 
> Thanks, applied for next!
> 
> I did have to fix conflict and also to resolve some checkpatch
> warnings - but no worries this time!

Thanks, sorry for letting those slip through.

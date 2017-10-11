Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:48610 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932594AbdJKIfk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 04:35:40 -0400
Received: by mail-lf0-f44.google.com with SMTP id a69so1204357lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 01:35:39 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 11 Oct 2017 10:35:37 +0200
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] mmc: tmio: fix tuning for stubborn cards
Message-ID: <20171011083537.GB22539@bigcity.dyn.berto.se>
References: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
 <20171011073648.GF9661@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171011073648.GF9661@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 2017-10-11 09:36:48 +0200, Simon Horman wrote:
> On Wed, Oct 11, 2017 at 02:08:14AM +0200, Niklas S�derlund wrote:
> > The commit 43b0b361b0170030 ("mmc: tmio: always get number of taps")
> > changed the behavior of the tuning. Before the commit the SCC was only
> > enabled for the first tuning attempt (host->init_tuning(host)), if that
> > failed the hardware where reset and tuning retried. In the second
> > attempt the SCC where never configured and tuning would succeed for some
> > stubborn cards. This patch restore this behavior which allows a troubled
> > card I have to be used.
> 
> Hi Wolfram,
> 
> Is tuning retried if the card is changed, f.e. ejected and a different card
> inserted?

I'd say tuning is retried every time a card is inserted, based on my 
tests bellow. Which would make the change in 43b0b361b0170030 correct as 
the number of taps should be reread each time but the fallback to try 
tuning without the SCC clock changed restored (if that is correct 
behavior?). The register write which breaks my stubborn card tuning is 
in renesas_sdhi_init_tuning() in drivers/mmc/host/renesas_sdhi_core.c:

    # I assume this write is just to unlock writing to 
    # SH_MOBILE_SDHI_SCC_CKSEL ?
    sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
                    sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));

    # This register change starts to produce the timeout for CMD19 with 
    # my stubborn card. In renesas_sdhi_hw_reset() this register is 
    # reset and tuning then works.
    sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
                   SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
                   sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));

    # I as above assume this just locks the register write again ?
    sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
                        sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));

Test procedure as follows:

1. Insert stubborn card

[   29.048761] sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
[   34.168757] sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
[   34.228767] sh_mobile_sdhi ee100000.sd: Tuning procedure with SCC enabled failed, retry with SCC disabled
[   34.255636] mmc0: new ultra high speed SDR50 SDHC card at address aaaa
[   34.262440] mmcblk0: mmc0:aaaa SU04G 3.69 GiB 
[   34.274980]  mmcblk0: p1 p2

2. Eject stubborn card

[  115.858994] mmc0: card aaaa removed

3. Insert other card

[  137.195795] mmc0: new SD card at address 9749
[  137.200434] mmcblk0: mmc0:9749 SD128 120 MiB (ro)
[  137.208510]  mmcblk0: p1

4. Eject other card

[  142.499073] mmc0: card 9749 removed

5. Insert stubborn card

[  176.248760] sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
[  181.368756] sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
[  181.428768] sh_mobile_sdhi ee100000.sd: Tuning procedure with SCC enabled failed, retry with SCC disabled
[  181.455631] mmc0: new ultra high speed SDR50 SDHC card at address aaaa
[  181.462424] mmcblk0: mmc0:aaaa SU04G 3.69 GiB 
[  181.474949]  mmcblk0: p1 p2

-- 
Regards,
Niklas S�derlund

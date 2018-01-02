Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45638 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbeABV60 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 16:58:26 -0500
Received: by mail-lf0-f65.google.com with SMTP id y71so6004777lfd.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 13:58:25 -0800 (PST)
Date: Tue, 2 Jan 2018 22:58:22 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: gen2: add IP core switcher for all
 busses
Message-ID: <20180102215822.GA22490@bigcity.dyn.berto.se>
References: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your work.

On 2017-12-31 12:23:11 +0100, Wolfram Sang wrote:
> Here is the updated series to add the I2C IP core switcher to all busses of
> Gen2 boards where some kind of switching is possible (mostly to/from GPIO).
> 
> These patches were tested locally on Lager and Alt, and remotely on Koelsch,
> Porter and Gose. We have no Silk board available but the patch follows the same
> style as the other patches. In addition, these patches have been double-checked
> by vimdiff-comparing the i2c-bus blobs before and after this patchset.
> 
> As discussed previously: the tested boards boot fine. No regression encountered
> there. However, changing masters at runtime for HDMI-named busses and PWR-named
> busses will likely cause kernel warnings and maybe OOPSes. This is due to the
> rebind-issues in the V4L and regulator subsystems. For the former, fixing is
> WIP. For the latter, it is unknown how to deal with rebinding in general (but
> I'd need to look at this issue again if this is desired).

For V4L there is no fix that I know of in the near future. I have 
previously posted series for rcar-vin which resolved this issue by 
registering/unregistering the video devices at probe/remove time instead 
of at bind/unbind time of subdevices of the video device. This solution 
was not liked by Hans and was nacked in favor of the current scheme 
which is used in V4L (and the VIN Gen2 driver), which unfortunately have 
this drawback that the unbind/bind of subdevices are broken.

I fear not much can be done at a drive level to workaround this, more 
framework changes will be needed to resolve this.

> It was decided that
> we consider those follow-up problems which should not hold back these patches
> anymore. The EXIO named busses seemed to work fine as far as this could be
> remotely tested.
> 
> Changes since V1:
> 
> * fixed I2C4 pinmux for Koelsch and Gose (thanks Geert for the report!)
> * rebased to current renesas/dt-for-v4.16
> * fixed typo in branch name (s/topc/topic/)
> 
> The branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2017
> 
> It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.
> 
> Please review, comment...
> 
> Thanks,
> 
>    Wolfram
> 
> 
> Wolfram Sang (9):
>   ARM: dts: lager: use demuxer for IIC2/I2C2
>   ARM: dts: lager: use demuxer for IIC3/I2C3
>   ARM: dts: koelsch: use demuxer for I2C2
>   ARM: dts: koelsch: use demuxer for I2C4
>   ARM: dts: porter: use demuxer for I2C2
>   ARM: dts: alt: use demuxer for I2C1
>   ARM: dts: silk: use demuxer for I2C1
>   ARM: dts: gose: use demuxer for I2C2
>   ARM: dts: gose: use demuxer for I2C4
> 
>  arch/arm/boot/dts/r8a7790-lager.dts   | 279 ++++++++++++++++++++--------------
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 232 +++++++++++++++++-----------
>  arch/arm/boot/dts/r8a7791-porter.dts  | 128 +++++++++-------
>  arch/arm/boot/dts/r8a7793-gose.dts    | 252 ++++++++++++++++++------------
>  arch/arm/boot/dts/r8a7794-alt.dts     |  53 +++++--
>  arch/arm/boot/dts/r8a7794-silk.dts    | 128 +++++++++-------
>  6 files changed, 654 insertions(+), 418 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund

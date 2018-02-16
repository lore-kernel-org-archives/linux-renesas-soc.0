Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 16 Feb 2018 14:47:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V3] ARM: dts: stout: Initial r8a7790 Stout board support
Message-ID: <20180216134736.lv6nuz7xxuhym63h@verge.net.au>
References: <20180215184919.31617-1-marek.vasut+renesas@gmail.com>
 <20180215193302.dhpvyvyr6ez37dm3@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215193302.dhpvyvyr6ez37dm3@katana>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 08:33:02PM +0100, Wolfram Sang wrote:
> On Thu, Feb 15, 2018 at 07:49:19PM +0100, Marek Vasut wrote:
> > Stout base board support making use of 1 GiB of memory,
> > the Renesas H2 r8a7790 SoC with the SCIFA0 serial port
> > and CA15 with ARM architected timer.
> > 
> > Furthermore, this device tree contains entries for:
> >   - 4x LEDs
> >   - SDHI SD/MMC controller
> >   - Display unit with HDMI output
> >   - SH fast ethernet controller
> >   - QSPI controller with S25FL512S attached to it
> >   - I2C controller with DA9210 and DA 9063 PMICs
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Looks good, at least for the things I know best of all those:
> 
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied.

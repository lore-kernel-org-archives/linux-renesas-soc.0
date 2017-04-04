Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 4 Apr 2017 13:11:00 -0400
From: Simon Horman <horms@verge.net.au>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/7] rtc: Reuse rtc-sh driver to support RZ/A1
Message-ID: <20170404171100.GA14047@verge.net.au>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
 <20170403160337.g3fzjbfhllnaoafz@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170403160337.g3fzjbfhllnaoafz@piout.net>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 03, 2017 at 06:03:37PM +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 29/03/2017 at 10:30:28 -0700, Chris Brandt wrote:
> > Basically, the same RTC that was used in SuperH devices is now used in
> > RZ/A1 devices. Therefore with some slight changes, that driver can be
> > reused.
> > 
> > Additionally, since ARM architectures require Device Tree configurations,
> > device tree support has been added.
> > 
> > This was tested on RZ/A1H RSK board. Once the correct time was programmed
> > into the RTC running off a 32.768kHz crystal, you can retain an accurate
> > system clock between reboots (hard and soft) until power is finally removed
> > from the board (there is no batter backup on the RSK board).
> > 
> > v3:
> > * remove 'power-domains' from example in documentation
> > * update commit message subject and body of dt-bindings
> > 
> > v2:
> > * removed HAVE_CLK from Kconfig
> > * when using DT, look for "fck" instead of "rtc0"
> > * changed (res == NULL) to (!res)
> > * added Reviewed-by for rtc-sh.c
> > * added interrupt-names and clock-names
> > * clocks now include counting sources
> > * added clock-names "fck", "rtc_x1", "rtc_x3", "extal"
> > * changed 'is a RTC' to 'is an RTC' in commit message
> > * changed "rtc0" to "rtc"
> > * Added clock nodes for RTC_X1 and RTC_X3 pin inputs
> > * each commit now has a log message
> > 
> > 
> > Chris Brandt (7):
> >   rtc: rtc-sh: add support for rza series
> >   dt-bindings: rtc: document the rtc-sh bindings
> 
> I applied those two, I'll let Simon take the device tree patches.
> 
> Thanks!
> 
> >   ARM: dts: r7s72100: add rtc clock to device tree
> >   ARM: dts: r7s72100: add RTC_X clock inputs to device tree
> >   ARM: dts: r7s72100: add rtc to device tree
> >   ARM: dts: rskrza1: set rtc_x1 clock value
> >   ARM: dts: rskrza1: add rtc DT support

Thanks, I have queued up the dts patches.

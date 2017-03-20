Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:40771 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754338AbdCTWqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 18:46:00 -0400
Date: Mon, 20 Mar 2017 23:45:24 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/5] rtc: Add rtc-sh
Message-ID: <20170320224524.cvtxotz7266hrxr2@piout.net>
References: <20170316175112.27913-3-chris.brandt@renesas.com>
 <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com>
 <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWs3NtKLiBnKCmxGYNBW3zzWYydj=JGKr+mH7ao97L2_Q@mail.gmail.com>
 <20170317150524.oijto6gtjxycdnwn@piout.net>
 <SG2PR06MB1165819F41CF40562F44F08B8A3A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWxs4Xwc0T5AHL73ZtF6r8pN9v6g-GEzozdLvTc4j4aSw@mail.gmail.com>
 <SG2PR06MB11650F098CFD2BCCB74C823B8A3A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11650F098CFD2BCCB74C823B8A3A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20/03/2017 at 16:26:46 +0000, Chris Brandt wrote:
> Hi Geert,
> 
> On Monday, March 20, 2017, Geert Uytterhoeven wrote:
> > > +       rtc: rtc@fcff1000 {
> > > +               compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> > > +               reg = <0xfcff1000 0x2e>;
> > > +               interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> > > +                             GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> > > +                             GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> > > +               interrupt-names = "alarm", "period", "carry";
> > > +               clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> > > +                         <&extal_clk> , <&rtc_x3_clk>;
> > > +               clock-names = "fck", "rtc_x1", "extal", "rtc_x3";
> > > +               power-domains = <&cpg_clocks>;
> > > +               count-source = "rtc_x1";    <<<<<<< this would be in the
> > board dts file
> > 
> > IMHO that's software policy, not hardware description, so it doesn't
> > belong in DT.
> 
> Really? I'm so confused about what is and isn't the responsibility of DT.
> 
> 
> > However, by scanning the list of allowed clock names, and looking at clock
> > rates, the driver can find a suitable clock itself.
> 
> Yes, I could make the selection automatic by looking that the clock names (and
> I will do that for this driver), but what about the case where a user needs
> to select something from a list of possible HW options? In other words, where
> does 'software option' selection stuff go if not in the DT?
> 

If you want you can leave the clock selection logic out of the driver as
long as the DT binding is complete. You dont have to use everything that
is described in the DT.

Regarding the selection, I'd say take the first that is present and not
0 however, if something has already been set, you may not want to
override it. (I know, this is not helping a lot ;) )

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

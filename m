Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 16 Mar 2018 12:49:47 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: salvator-common: Configure
 PMIC for DDR Backup Power
Message-ID: <20180316114946.uyvy6zwhf6n6etpz@verge.net.au>
References: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
 <1521029386-29975-3-git-send-email-geert+renesas@glider.be>
 <9c6289e4-23dd-c79b-bd1f-058d843739d2@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c6289e4-23dd-c79b-bd1f-058d843739d2@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 14, 2018 at 06:17:17PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/14/2018 03:09 PM, Geert Uytterhoeven wrote:
> 
> > On Salvator-X(S), all of the DDR0, DDR1, DDR0C, and DDR1C power rails
> > need to be kept powered when backup mode is enabled.  Reflect this in
> > the "rohm,ddr-backup-power" property for the BD9571MWV PMIC node.
> > 
> > The accessory power switch (SW23) is a toggle switch, hense specify
> > "rohm,rstbmode-level".
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Add rohm,rstbmode-level.
> > ---
> >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > index 2a7f36abd2dd85c6..80794c38c2669d75 100644
> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > @@ -376,6 +376,8 @@
> >  		#interrupt-cells = <2>;
> >  		gpio-controller;
> >  		#gpio-cells = <2>;
> > +		rohm,ddr-backup-power = <15>;
> 
>   Why not 0xf if those are all bit flags?

Hi Geert,

could you address this feedback when you have some time?

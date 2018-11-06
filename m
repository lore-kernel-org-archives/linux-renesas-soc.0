Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 6 Nov 2018 13:17:49 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990: Add SDHI device nodes
Message-ID: <20181106121748.k64k6ks3lafetaku@verge.net.au>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <OSBPR01MB229351FF35C839C4E9A7F19CD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <7ab702f0-e78c-94c5-b74f-bac1803fb513@gmail.com>
 <CAMuHMdWkbqizvAtP=ka9tiirNqb=CzhRxGdWY3VcTT_8-UrG+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWkbqizvAtP=ka9tiirNqb=CzhRxGdWY3VcTT_8-UrG+Q@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 06, 2018 at 11:35:13AM +0100, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Tue, Nov 6, 2018 at 11:32 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> > On 11/06/2018 06:26 AM, Yoshihiro Shimoda wrote:
> > >> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
> > >>
> > >> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >>
> > >> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC.
> > >>
> > >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> Cc: Simon Horman <horms+renesas@verge.net.au>
> > >> Cc: Wolfram Sang <wsa@the-dreams.de>
> > >> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >> Cc: linux-renesas-soc@vger.kernel.org
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> ---
> > >
> > > Thank you for the patch!
> > >
> > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > I guess this patch and the 2/2 patch for ebisu have to be merged into a patch though.
> >
> > I wonder about that, 1/2 is adding SDHI DT nodes for an SoC, 2/2 is
> > enabling SDHI on a particular board, which I think should be separate.
> 
> The arm-soc maintainers tend to disagree, that's why Shimoda-san asked
> to combine them.

That is also my understanding.
Please consider combining these patches.

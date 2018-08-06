Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbeHFNIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 09:08:36 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 04/14] arm64: dts: renesas: r8a7795-es1: ulcb-kf: Use "renesas,ulcb" compatible
Date: Mon, 06 Aug 2018 14:00:45 +0300
Message-ID: <6288376.Dh0aHR02zn@avalon>
In-Reply-To: <e0f0c2dc-5d39-fd46-3ca1-4bb25881428c@ideasonboard.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <c0315c63-a006-48fd-0565-8addfd82ab48@ideasonboard.com> <e0f0c2dc-5d39-fd46-3ca1-4bb25881428c@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Monday, 6 August 2018 13:49:59 EEST Kieran Bingham wrote:
> On 06/08/18 11:45, Kieran Bingham wrote:
> > On 06/08/18 11:42, Laurent Pinchart wrote:
> >> On Sunday, 5 August 2018 02:11:04 EEST Eugeniu Rosca wrote:
> >>> Following the recent change in dt-bindings [1], switch from
> >>> "renesas,h3ulcb" to "renesas,ulcb" compatible string.
> >>> 
> >>> [1] Documentation/devicetree/bindings/arm/shmobile.txt
> >>> 
> >>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> >>> ---
> >>> 
> >>>  arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> >>> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts index
> >>> 06deb67c36c8..7a5b1dc64090 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> >>> @@ -14,6 +14,6 @@
> >>> 
> >>>  / {
> >>>  	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
> >>> 
> >>> -	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
> >>> +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
> >>>  		     "renesas,r8a7795";
> >> 
> >> This is unrelated to your patch, but due to the reason explained in my
> >> review of 02/14, I think "shimafuji,kingfisher" should include the SoC
> >> name.
> >> 
> >> This brings up the topic of how to describe boards that are made of an
> >> SoC "module" board plugged into an expansion "motherboard".
> > 
> > Isn't it the point that the shimafuji board is agnostic to the SoC on
> > the ULCB?
> > 
> > I presume the Kingfisher board is just the expansion board which would
> > be identical regardless of if it was put on an H3 ULCB, or an M3 ULCB?
> 
> In fact possibly the interesting point is that the kingfisher as an
> expansion board is surely an 'overlay', rather than the board itself ?

In a way it's both. From an SoC point of view, the KingFisher board can be 
seen as an expansion board. From a system point of view, it's a KingFisher 
system.

If you built a car around an H3 ULCB, would you consider that to be an H3 with 
a car extension, or a car with an H3 inside ? :-)

> >>>  };

-- 
Regards,

Laurent Pinchart

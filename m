Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 5 Oct 2017 11:10:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable PWM
 channel 0 and 1
Message-ID: <20171005091001.GF26369@verge.net.au>
References: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507112851-10042-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX8+jOYuhMFXoPX93VrRWiBUvwDjaL+4ZaFPenSV8i6vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8+jOYuhMFXoPX93VrRWiBUvwDjaL+4ZaFPenSV8i6vw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 04:38:08PM +0200, Geert Uytterhoeven wrote:
> On Wed, Oct 4, 2017 at 12:27 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > This patch enables PWM channel 0 and 1 on the draak. Each channel
> > connects to LTC2644 for brightness control.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

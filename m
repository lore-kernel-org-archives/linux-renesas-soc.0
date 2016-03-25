Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 25 Mar 2016 11:12:08 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] phy: rcar-gen3-usb2, rcar-gen2: Use ARCH_RENESAS
Message-ID: <20160325021207.GC31681@verge.net.au>
References: <1457313264-18476-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXqvp4+uQzLCPpj7r29bM0__O1j5-aQ_uQ9u0-XSrC3Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXqvp4+uQzLCPpj7r29bM0__O1j5-aQ_uQ9u0-XSrC3Rw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 07, 2016 at 09:01:48AM +0100, Geert Uytterhoeven wrote:
> On Mon, Mar 7, 2016 at 2:14 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
> > A now redundant dependency on OF is also dropped.
> >
> > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Kishon,

I am wondering if you could consider applying this series too.

Thanks in advance!

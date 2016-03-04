Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 4 Mar 2016 14:20:19 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: simple-pm-bus: Use ARCH_RENESAS
Message-ID: <20160304052019.GD27942@verge.net.au>
References: <1456969198-20365-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVU1RPAafTbUpw6CyW-tQ1amHeiR2DGY_QK8vTFEXpHTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVU1RPAafTbUpw6CyW-tQ1amHeiR2DGY_QK8vTFEXpHTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 03, 2016 at 09:31:49AM +0100, Geert Uytterhoeven wrote:
> On Thu, Mar 3, 2016 at 2:39 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
> >
> > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm a little unsure of who should take this but for now I will
queue it up in next with a view to sending a pull request to Linus
for v4.6. I'm open to other ideas.
